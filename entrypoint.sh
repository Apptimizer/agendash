#!/usr/bin/env sh

set +e

source /agendash/refresh-secrets.sh

exec node ./bin/agendash-standalone.js --db=$MONGODB_URI --collection=$COLLECTION --path=$BASE_PATH
