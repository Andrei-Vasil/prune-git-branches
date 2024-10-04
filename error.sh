#!/bin/sh

error() {
    # @description used to output error message with error code
    # @param $1 the exit code, $2 the error message
    echo $2 >&2
    exit $1
}

format_error() {
    # @description used to output error message with error code + static tool usage
    # @param $1 the exit code, $2 the error message
    echo $2 >&2
    echo "Usage:" >&2
    echo "\t$0 --remote [-f]" >&2
    echo "\t$0 --pattern [branch1 branch2 branch3 ...]" >&2
    exit $1
}