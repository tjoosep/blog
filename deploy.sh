#!/bin/sh

# if fail, deploy stops
set -e

printf "\033[0;32mDeploying new stuff to github...\033[0m\n"

# build project
hugo -t hugo-notepadium

# go to /public
cd public

# add everything to git
git add .

# commit
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

git commit -m "$msg"

# push and build
git push origin main