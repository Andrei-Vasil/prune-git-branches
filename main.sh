#!/bin/sh

CURRENT_DIRECTORY=$(dirname "$(readlink -f "$0")")
. "$CURRENT_DIRECTORY/error.sh"
. "$CURRENT_DIRECTORY/pattern.sh"
. "$CURRENT_DIRECTORY/remote.sh"

in_git_folder=$(git rev-parse --is-inside-work-tree 2> /dev/null)
if [ -z "$in_git_folder" ] ; then
    error 1 "You are not located in a git repository! :("
fi

PATTERN=0
REMOTE=0
FORCE=0

options=$(getopt --shell bash --options f --longoptions pattern,remote -- "$@")

if test $? != 0 ; then
	format_error 1 "Invalid command format"
fi

eval set -- "$options"

while true ; do
	case "$1" in

		--remote)
			REMOTE=1
			shift
			;;

		--pattern)
			PATTERN=1
			shift
			;;

		-f)
			FORCE=1
			shift
			;;

		--)
			shift
			break
			;;

		*)
			format_error 1 "$0: unparseable option $1"
			;;

	esac
done

if [ $PATTERN -eq 1 ] ; then
	if [ $REMOTE -eq 1 ] || [ $FORCE -eq 1 ] ; then
		format_error 1 "Invalid command format"
	fi

    pattern "$@"
    exit $?
fi

if [ $REMOTE -eq 1 ] ; then
    if [ $PATTERN -eq 1 ] ; then
        format_error 1 "Invalid command format"
    fi

    remote
    exit $?
fi

format_error 1 "You must provide at least one argument"