# Conjur
FROM ruby:2.4 as summon

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl

# Install summon and summon-conjur
RUN curl -sSL https://raw.githubusercontent.com/cyberark/summon/master/install.sh \
      | env TMPDIR=$(mktemp -d) bash && \
    curl -sSL https://raw.githubusercontent.com/cyberark/summon-conjur/master/install.sh \
      | env TMPDIR=$(mktemp -d) bash

# Application
FROM maven:3.8.1-jdk-11-slim as maven

WORKDIR /app

# Copy pom.xml and uses it to install all the dependencies
COPY ./pom.xml ./pom.xml
RUN mvn verify clean --fail-never

# Copy the source and package the application
COPY ./src ./src
RUN mvn package && cp target/users-*.jar users.jar

# Prepare final image using runtime only
FROM openjdk:11-jre-slim

COPY --from=summon /usr/local/lib/summon /usr/local/lib/summon
COPY --from=summon /usr/local/bin/summon /usr/local/bin/summon
COPY --from=maven /app/users.jar /users.jar

ENTRYPOINT [ "java", "-jar", "/users.jar"]