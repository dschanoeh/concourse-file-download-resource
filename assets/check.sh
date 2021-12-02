#!/bin/sh

set -e
set -o pipefail

exec 3>&1 # make stdout available as fd 3 for the result
exec 1>&2 # redirect all output to stderr for logging

# Read inputs
payload=$(mktemp $TMPDIR/file-download-resource-request.XXXXXX)

cat > $payload <&0

# Extract relevant parameters from config
URL=`jq -r '.source.url' < $payload`
FILENAME=`jq -r '.source.fileName' < $payload`
USER=`jq -r '.source.user' < $payload`
PASSWORD=`jq -r '.source.password' < $payload`

if [[ "$URL" == "null" ]] || [[ "$FILENAME" == "null" ]]; then
    echo "Required parameters url and/or fileName are not set"
    exit
fi

# Use basic auth in case user and password are set
if [[ "$USER" != "null" ]] && [[ "$PASSWORD" != "null" ]]; then
    curl -s -u $USER:$PASSWORD -o $FILENAME $URL
else
    curl -s -o $FILENAME $URL
fi

CHECKSUM=`/usr/bin/sha1sum $FILENAME | cut -d " " -f 1`

printf '[{"checksum": "%s"}]\n' "$CHECKSUM" >&3