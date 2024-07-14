# prune-git-branches
This script will prune your local branches no longer tracked on remote. <br>
Run with ```-f``` flag to also remove unmerged branches.

## simple-script.sh
This script removes all branches except for the specified parameter branch names.
If no branches are specified, the script defaults to using _main_, _master_, _dev_ and _develop_ as parameters. This basically removes all feature branches.
