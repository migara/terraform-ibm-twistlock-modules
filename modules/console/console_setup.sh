#!/bin/bash
set -e

# HOSTNAME=
# USERNAME=
# PASSWORD=
# LICENSE_KEY=

# Checks if Console is reachable over the network from the host where you call the endpoint
ping() {

  ping_response=$(
    curl -k \
    -s \
    -o /dev/null \
    -w "%{http_code}\n" \
    -X GET \
    https://${HOSTNAME}:8083/api/v1/_ping
  )

  echo $ping_response

}

limit=0
while [ $(ping) -ne "200" ]; do 
		echo "Waiting for the console to be ready...."

    if [[ "$limit" == '5' ]]; then
      echo "Console is not ready, exiting...." && exit 1
    fi
    ((limit++))
    sleep 5
	done

# Setup initial user
setup_user() {

  init_user_response=$(
   curl -k \
        -H 'Content-Type: application/json' \
        -s \
        -o /dev/null \
        -w "%{http_code}\n" \
        -X POST \
        -d "{\"username\": \"${USERNAME}\", \"password\": \"${PASSWORD}\"}" \
        https://${HOSTNAME}:8083/api/v1/signup
  )

  if [[ $init_user_response = 200 ]] ; then
    echo "Initial admin user ($USERNAME) is created"
  else
    echo "[skip] Initial admin user is already created"
  fi

}

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

# Setup twistlock license
license() {

  license_response=$(
   curl -k \
        -H 'Content-Type: application/json' \
        -H "Authorization: Bearer ${auth_token}" \
        -s \
        -o /dev/null \
        -w "%{http_code}\n" \
        -X POST \
        -d "{\"key\": \"${LICENSE_KEY}\"}" \
        https://${HOSTNAME}:8083/api/v1/settings/license
  )
  echo "License installed"
}

# Set SAN
set_san() {

  san=$(
   curl -k \
        -H 'Content-Type: application/json' \
        -H "Authorization: Bearer ${auth_token}" \
        -s \
        -X GET \
        -d "{\"key\": \"${LICENSE_KEY}\"}" \
        https://${HOSTNAME}:8083/api/v1/settings/certs |\
   jq ".consoleSAN += [\"$HOSTNAME\"]"
  )

  san_response=$(
   curl -k \
        -H 'Content-Type: application/json' \
        -H "Authorization: Bearer ${auth_token}" \
        -X POST \
        -s \
        -o /dev/null \
        -w "%{http_code}\n" \
        -d "${san}" \
        https://${HOSTNAME}:8083/api/v1/settings/certs
  )

  echo "Console address added to the SAN list"

}

setup_user
get_auth_token
license
set_san