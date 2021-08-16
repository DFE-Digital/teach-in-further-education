#!/usr/bin/env bash

MGMT_TOKEN=$1
SPACE_ID=$2
ENV_ID=$3
SOURCE_ENV_ID=$4
FILES="migrations/*.js"

echo "Logging in"
contentful login --management-token "${MGMT_TOKEN}" 2>&1
contentful space use --space-id "${SPACE_ID}" --environment-id "${ENV_ID}" 2>&1

echo "Creating environment"
contentful space environment create --environment-id "${ENV_ID}" --name "${ENV_ID}" --await-processing true --source "${SOURCE_ENV_ID}" 2>&1

echo "Applying migrations"
for f in $FILES
do
  echo "Processing $f file..."
  contentful space migration --environment-id "${ENV_ID}" "${f}" --yes 2>&1
done

