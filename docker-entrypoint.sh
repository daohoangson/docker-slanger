#!/bin/sh

set -e

# always start with slanger unless some absolute path binary is specified
# eg. `docker run --rm -it xfrocks/slanger /bin/sh` 
if [ "${1:0:1}" != '/' ]; then
	set -- slanger "$@"
fi

echo "Executing $@..."
exec "$@"