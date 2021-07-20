APP_NAME=usersapp-secure
APP_NAMESPACE=usersapp
APP_SERVICE_ACCOUNT_NAME=usersapp-secure-sa

AUTHENTICATOR_ID="dev"

APP_SECRETS_POLICY_BRANCH="app/usersapp/secret"
APP_SECRETS_READER_LAYER="app/usersapp/layer"

CONJUR_ACCOUNT="default"
CONJUR_APPLIANCE_URL="https://conjur-cluster-conjur-oss.conjur-server.svc.cluster.local"

CONJUR_ADMIN_AUTHN_LOGIN="admin"
CONJUR_ADMIN_API_KEY="MySecretP@ss1"

OSS_CONJUR_SERVICE_ACCOUNT_NAME="conjur-cluster"
OSS_CONJUR_NAMESPACE="conjur-server"

APP_AUTHENTICATION_CONTAINER_NAME="secretless"
