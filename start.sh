#!/bin/bash

set -eo pipefail

# Replace variables in the config file

replace_vars() {
  OUTPUT=$(echo $1 | sed -e 's/.source//');
  SOURCE=$1

  eval "cat <<EOF
  $(<$SOURCE)
EOF
  " > $OUTPUT
}

if [ -e "$CONFIG_FILE_PATH.source" ]
then
  replace_vars "$CONFIG_FILE_PATH.source"
fi

echo "Configuration settings"
cat "$CONFIG_FILE_PATH"

echo "starting sphinx service..."
$GOPATH/bin/sphinx -config=$CONFIG_FILE_PATH
