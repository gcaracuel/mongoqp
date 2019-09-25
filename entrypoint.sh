#!/bin/bash

if [[ -v PASSWORD_LOCATION ]]; then
  export REMCO_PASSWORD=$(cat $PASSWORD_LOCATION)
  echo "Using \$PASSWORD_LOCATION value"
elif [[ -v REMCO_PASSWORD ]]; then
  echo "Using \$REMCO_PASSWORD value"
else
  echo "ERROR! Neither PASSWORD nor PASSWORD_LOCATION has been provided"
  exit 1
fi

remco_linux