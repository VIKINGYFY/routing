#!/bin/sh

case "$PKG_NAME" in
batmand)
	# Date-based package versions are separate from the upstream Git revision.
	batmand -v 2>&1 | grep -Eq '^B[.]A[.]T[.]M[.]A[.]N[.] [0-9a-f]{40} [(]compatibility version [0-9]+[)]$'
	;;

*)
	echo "Untested package: $PKG_NAME" >&2
	exit 1
	;;
esac
