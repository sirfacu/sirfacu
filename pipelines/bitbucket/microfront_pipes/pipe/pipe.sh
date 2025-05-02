#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"
status=0

info "Executing the pipe..."

# Required parameters 
BITBUCKET_APP_KEY=${BITBUCKET_APP_KEY:?'BITBUCKET_APP_KEY variable missing.'}
BITBUCKET_APP_SECRET=${BITBUCKET_APP_SECRET:?'BITBUCKET_APP_SECRET variable missing.'}
BITBUCKET_WORKSPACE=${BITBUCKET_WORKSPACE:?'BITBUCKET_WORKSPACE variable missing.'}
BITBUCKET_REPO_SLUG=${BITBUCKET_REPO_SLUG:?'BITBUCKET_REPO_SLUG variable missing.'}
BITBUCKET_BRANCH=${BITBUCKET_BRANCH:?'BITBUCKET_BRANCH variable missing.'}

info "Getting next version of ${BITBUCKET_REPO_SLUG} repo from ${BITBUCKET_BRANCH} branch ..."

# Default parameters
DEBUG=${DEBUG:="false"}

info "Getting access_token..."

ACCESS_TOKEN=$(curl -s -X POST -u "${BITBUCKET_APP_KEY}:${BITBUCKET_APP_SECRET}" https://bitbucket.org/site/oauth2/access_token -d grant_type=client_credentials | jq '.access_token')

info "Get current version based on tags..."

CURRENT_VERSION=$(curl -s -X GET -H "Accept:application/json" -H "Authorization: Bearer ${ACCESS_TOKEN}" https://api.bitbucket.org/2.0/repositories/${BITBUCKET_WORKSPACE}/${BITBUCKET_REPO_SLUG}/refs/tags?pagelen=100 | jq -r '.values[].name' | sort -Vr | head -n 1)

if [ -d $CURRENT_VERSION ]; then CURRENT_VERSION=v0.0.0; fi

info "Current version is ${CURRENT_VERSION}"

info "Getting next version..."

NEXT_VERSION=$(docker run --rm alpine/semver:7.5.4 semver -c -i "patch" $CURRENT_VERSION)

info "Next version is ${NEXT_VERSION}" 

echo ARTIFACT_VERSION=$NEXT_VERSION >> set_env.sh
echo ARTIFACT_NAME=${MF_INITIATIVE}.${NEXT_VERSION}.js  >> set_env.sh

if [[ "${status}" == "0" ]]; then
  success "Success!"
else
  fail "Error!"
fi