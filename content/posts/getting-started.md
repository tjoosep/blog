---
title: "Getting Started"
date: 2021-03-21T14:47:23+02:00
draft: false
---

For my site I use [Hugo](https://gohugo.io/). It is very simple and easy to set up the site, there are A LOT of themes and everything is easily configurable.

### Some helpful commands
1. Install hugo

	`brew install hugo`

2. New site
	
	`hugo new site mycoolsite`

3. New post

	`hugo new posts/post-name.md`

4. Building the code
	
	`hugo server -t your-cool-theme-name`

5. View the masterpiece

	`hugo server`


#### To organize everything, I use 2 separate gihtub sites. 
* blog - hugo files and folders
* my-git-account.github.io - published everything from blog repository.

For that I have submoduled my blog with github pages. 
```sh
cd blog
git submodule add -b main my-git-repo.github.io.git public
```
This command adds submodule to main branch under public folder. Everything in that folder will be published to your github pages. 

If everything looks good, you need to generate static files into public folder. 
```sh
hugo -t hugo-notepadium
cd public
git add .
git commit -m "msg"
git push origin main
```
Notice that my theme is called `hugo-notepadium`


I have created a deployment script:
```sh
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
```

### To add tags and categories
Simply just add 
* `tags: ["your-tag-name"]` 
* `categories: ["your-category-name"]`

into header block.

And in your config.toml/.yml file make sure you have enabled both of these features (in my case): 
```
[params.nav]
showCategories = true
showTags = true	
```


### Useful links and sources
1. [Hugo config](https://gohugo.io/getting-started/configuration/)

2. [Notepadium theme](https://themes.gohugo.io/hugo-notepadium/)

3. [Getting started with hugo and github pages](https://www.youtube.com/watch?v=LIFvgrRxdt4)

4. [Raw notepadium syntax highlights](https://raw.githubusercontent.com/cntrump/hugo-notepadium/master/exampleSite/content/post/markdown-syntax.md)