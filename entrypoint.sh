#!/bin/sh

COUCHDB_VERSION=$1

if [ -z "$COUCHDB_VERSION" ]; then
  echo "Missing CouchDB version in the [couchdb-version] input. Received value: $COUCHDB_VERSION"
  exit 2
fi

echo "Check dependencies"
echo "- curl : $(which curl)"

echo "Starting CouchDB"
docker run -p 5984:5984 -d couchdb:$COUCHDB_VERSION

# FIXME can't connect. reason is unknown.
sleep 20
# function waiting() {
#   echo "Waiting for CouchDB run..."

#   while ! curl -f http://localhost:5984 &> /dev/null
#   do
#     # echo $(curl -o /dev/null -w "%{http_code}" "http://localhost:19764")
#     echo $(curl -f http://localhost:5984)
#     echo $(curl -f http://0.0.0.0:5984)
#     echo $(curl -f http://127.0.0.1:5984)
#     echo $(curl -f https://127.0.0.1:5984)
#     echo $(docker ps)
#     # echo -ne "."
#     sleep 5
#   done
# }

# waiting
