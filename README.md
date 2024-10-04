# prune-git-branches

This script will prune your local branches no longer tracked on remote. <br>
Run with `-f` flag to also remove unmerged branches.

remove-non-primary-branches.sh
This script removes all branches except for the specified parameter branch names.
If no branches are specified, the script defaults to removing all non-primary branches using _main_, _master_, _dev_ and _develop_ as parameters.

## Usage

```sh
# note: you are free to alias main.sh however you wish
alias prune-git-branches='/path/to/this/repo/main.sh'
prune-git-branches --remote [-f]
prune-git-branches --pattern [branch1 branch2 branch3 ...]
```

## Required packages

- git
- xargs
- grep
- awk
- sed
- cut
- getopt
- dirname
- readlink
