# prune-git-branches

This script will prune the local branches that you no longer want.
You have 2 options when deleting: `--remote` or `--pattern`

## Remote

This option will delete all your local branches that are no longer tracked on remote. \
Run with `-f` flag to also remove unmerged branches.

## Pattern

This option removes all branches except for the specified parameter branch names.
If no branches are specified, the script defaults to removing all non-primary branches using _main_, _master_, _dev_ and _develop_ as parameters.

## Usage

```sh
# note: you are free to alias main.sh however you wish
alias prune-git-branches='/path/to/this/repo/main.sh'
prune-git-branches --remote [-f]
prune-git-branches --pattern [branch1 branch2 branch3 ...]
```
