# pre-commit-gitops
![Branch master](https://img.shields.io/badge/branch-master-brightgreen.svg?style=flat-square)[![Build](https://api.travis-ci.org/detailyang/pre-commit-shell.svg)](https://travis-ci.org/detailyang/pre-commit-shell)[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/detailyang/pre-commit-shell/master/LICENSE)[![release](https://img.shields.io/github/release/detailyang/pre-commit-shell.svg)](https://github.com/detailyang/pre-commit-shell/releases)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)


pre-commit-gitops is a [pre-commit](https://github.com/pre-commit/pre-commit) component, which wrapper [shellcheck](https://www.shellcheck.net/) to check shell scripts:)

Table of Contents
-----------------

  * [Requirements](#requirements)
  * [Install](#install)
  * [Contributing](#contributing)
  * [License](#license)
  * [Author](#author)

Requirements
------------
  pre-commit-shell requires the following to run:

  * [pre-commit](http://pre-commit.com)
  * [branching](https://github.com/songhanpoo/pre-commit-shell-gitops/blob/main/pre_commit_hooks/branching.sh)
  * [msg](https://github.com/songhanpoo/pre-commit-shell-gitops/blob/main/pre_commit_hooks/msg.sh)
    

Install
---------

1. create .pre-commit-config.yaml in you git project
2. pre-commit install 
3. enjoy it

example .pre-commit-config.yaml as following:

```yaml
repos:
  - repo: https://github.com/songhanpoo/pre-commit-shell-gitops.git
    rev: v1.0.3
    hooks:
    - id: msg-check
      verbose: false
      args:
        - -p=".*"
    - id: branching-check
      verbose: false
      args:
        - -p=".*"
```
Contributing
------------

To contribute to pre-commit-gitops, clone this repo locally and commit your code on a separate branch. 


Author
------

> GitHub [@songhanpoo](https://github.com/songhanpoo)     


License
-------

pre-commit-gitops is licensed under the [MIT] license.  
