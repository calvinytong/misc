#!/bin/sh
# This script was taken from the github tutorial for changing authorship. It can
# Be found here https://help.github.com/articles/changing-author-info/
# Replace OLD_EMAIL, CORRECT_NAME, CORRECT_EMAIL with desired fields and run in
# a bare cloned repo
# To clone a bare repo use cmd `git clone --bare` 
# Once you run the script, you must push the corrected history to GitHub
# Using `git push --force --tags origin 'refs/heads/*'`
git filter-branch --env-filter '

OLD_EMAIL=""
CORRECT_NAME=""
CORRECT_EMAIL=""

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
