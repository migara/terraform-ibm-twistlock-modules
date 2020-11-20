#!/bin/bash
set -e

# HOSTNAME=
# USERNAME=
# PASSWORD=
# NAMESPACE=
# CHART_NAME=

# Get auth token
get_auth_token() {

  auth_token=$(
   curl -k \
        -H 'Content-Type: application/json' \
        -s \
        -X POST \
        -d "{\"username\": \"${USERNAME}\", \"password\": \"${PASSWORD}\"}" \
        https://${HOSTNAME}:8083/api/v1/authenticate |\
   jq -r '.token'
  ) 
}

# Download helm chart
download_defender_helm_chart() {

  init_user_response=$(  
    curl -k --location --request POST \
      -H 'Content-Type: application/json' \
      -H "Authorization: Bearer ${auth_token}" \
      -o ${CHART_NAME} \
      -s \
      --data-raw "{
          \"consoleAddr\": \"${HOSTNAME}\",
          \"namespace\": \"${NAMESPACE}\",
          \"cri\": true,
          \"orchestration\": \"kubernetes\"
      }" \
      https://${HOSTNAME}:8083/api/v1/defenders/helm/twistlock-defender-helm.tar.gz
  )
}

get_auth_token
download_defender_helm_chart