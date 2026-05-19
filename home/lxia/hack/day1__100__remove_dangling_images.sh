#!/bin/sh

DANGLING_IMAGES="$(podman images --filter dangling=true --quiet)"
if [ -n "$DANGLING_IMAGES" ] ; then
  podman rmi $DANGLING_IMAGES
fi

EXITVALUE=$?
if [ $EXITVALUE != 0 ]; then
    /usr/bin/logger -t lxia "ALERT $0 exited abnormally with [$EXITVALUE]"
fi
exit $EXITVALUE
