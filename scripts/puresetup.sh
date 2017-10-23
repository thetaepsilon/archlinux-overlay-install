#!/bin/sh
root="$1";

usage() {
	echo "Usage: $0 rootprefixdir" >&2;
	exit 1;
}

if test -z "$root"; then usage; fi;

trymkdir() {
	mkdir "$1" | exit $?;
}

trymkdir "$root/proc";
trymkdir "$root/sys";
trymkdir "$root/dev";

trymkdir "$root/cfg";

trymkdir "$root/pkgdata";
#trymkdir "$root/pkgdata/syncdb";

trymkdir "$root/var";
trymkdir "$root/var/lib";
trymkdir "$root/var/lib/pacman";
ln -s "../../../pkgdata/syncdb" "$root/var/lib/pacman/sync" || exit $?;
