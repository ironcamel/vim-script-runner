# About

script-runner is a vim plugin that lets you easily and quickly run a perl,
python, ruby, bash, etc. script. Just hit F5 and it runs your script and outputs
the results in a split window at the bottom. Note that you don't even have to save your script first. You can just open a scratch buffer, type some code and hit F5.

# Installation

## Pathogen Install

If you have the pathogen plugin installed, you can just clone this project
inside your ~/.vim/bundle folder

## Script Install

    bash install.sh

## Manual Install

    cp plugin/script-runner.vim ~/.vim/plugin

# Usage

normal mode: F5

command mode: :sx

# Advanced

If you want to change the default key mapping of F5, add this to your .vimrc:

    let g:script_runner_key = '<F6>'

You can run a custom command based on the type of script you are working on.
For example, if you want the Data::Dump module available each time you run
a perl script, add this to your .vimrc:

    let g:script_runner_perl = 'perl -MData::Dump'

To run a specific version of ruby:

    let g:script_runner_ruby = '/usr/local/bin/ruby1.9'

# Contributors 

* Magnus Woldrich [trapd00r](https://github.com/trapd00r)
* Naveed Massjouni [ironcamel](https://github.com/ironcamel) (author)
* William Wolf [throughnothing](https://github.com/throughnothing)
