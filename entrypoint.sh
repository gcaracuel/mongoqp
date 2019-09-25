#!/bin/bash

if [[ -v PASSWORD_LOCATION ]]; then
  export MONGO_PASSWORD=$(cat $PASSWORD_LOCATION)
  echo "Using \$PASSWORD_LOCATION value"
elif [[ -v MONGO_PASSWORD ]]; then
  echo "Using \$MONGO_PASSWORD value"
else
  echo "ERROR! Neither MONGO_PASSWORD nor PASSWORD_LOCATION has been provided"
  exit 1
fi

remco_linux