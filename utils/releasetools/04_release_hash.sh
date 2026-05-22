#!/bin/bash
if [ $# != "1" ]
then
    echo "Usage: ./utils/releasetools/04_release_hash.sh <version_tag>"
    exit 1
fi

SHA=$(curl -s http://download.redis.io/releases/redi)
ENTRY="hash redis-${1}.tar.gz sha256 $SHA http://download.redis.io/releases/redis-${1}.tar.gz"
echo $ENTRY >> ../redis-hashes/README
echo "Press any key to commit, Ctrl-C to abort)."
read yes
(cd ../redis-hashes; git commit -a -m "${1} hash."; git push)
