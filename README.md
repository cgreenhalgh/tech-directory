# Technology directory

Simple web directory of technologies (or whatever). THat's the idea, anyway.

Chris Greenhalgh, 2016-01-07

Copyright (c) The University of Nottingham, 2016

## Build / use

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

## Data Specification

`recommendation`s (each for a single technology) are in `_data/recommendations.yml`, as a list of objects with properties:
- `title` (required) of the technology, slugified as ID
- `description` 
- `url` 
- `type` (required) of technology, e.g. `software`, `hardware`, `format`
- `for` (required) i.e. primary use, may be a list, e.g. `data storage`
- `by` authors/creators
- `date` of recommendation
- `because` - reason or justification for recommending it
- `eg` of successful use, list of objects (see below)
- `history`, list of objects (see below)
- `partof` another technology - strict life-cycle constraint
- `includes` other technologies
- `seealso` other complementary technologies
- `supercedes` other technologies, i.e. replaces
- reverse properties: `includedby` (`includes`), `haspart` (`partof`), `supportedby` (`supported`), `usedin` (`used`)

`recommendation` `eg` has properties:
- `usedin` project or event
- `date` of use
- `by` person using it
- `description` of successful use

`recommendation` `history` has properties:
- `status` 
- `date` (required)
- `description`

`project`s (and events) are in `_data/projects.yml` as a list of objects with properties:
- `title` (required), slugified as ID
- `description`
- `date` - key date, typically start date
- `enddate`
- `type`, e.g. `project` or `event`
- `people` involved
- `contact` person
- `ledby` (e.g. PI)
- `supported` other projects, events or technologies
- `fundedby`, object with properties `funder` and `reference`
- `partof` another project
- `used` technologies 
- reverse properties: `supportedby` (`supported`), `haspart` (`partof`), `recordedin` (`record`.`of`)

`record`s are in `_data/records.yml` as a list of objects with properties:
- `title` (required), slugified as ID
- `description`
- `of` event or project or technology
- `type`, e.g. `dataset`, `publication`, `video`
- `url`
- `by` people
- `date`
- `seealso` other records, projects, etc.

