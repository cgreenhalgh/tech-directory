# Technology directory

Simple web directory of technologies (or whatever). THat's the idea, anyway.

Chris Greenhalgh, 2016-01-07

Copyright (c) The University of Nottingham, 2016

To update make the changes, then to build and test:
```
jekyll server --baseurl ''
```

When you are happy check everything (including generated `_site/`) into 
`master` branch and:
```
git branch -D gh-pages
git checkout -b gh-pages
git filter-branch --subdirectory-filter _site/ -f
git checkout master
git push --all origin
```

Latest version should now be visible on [github](http://cgreenhalgh.github.io/tech-directory).

