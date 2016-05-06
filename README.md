you-debug-it
============

**you-debug-it** is a Vim plugin that helps to control your debug code.

Installation
------------

#### Install you-debug-it

##### Pathogen

    $ cd ~/.vim/bundle
    $ git clone https://github.com/aserebryakov/you-debug-it.git

##### NeoBundle

    NeoBundle 'aserebryakov/you-debug-it'

##### Without plugin manager

Clone or download this repository and copy its contents to your `~/.vim/`
directory.

Usage
-----

##### Commands

* `:YouDebugItStart`   - enables automatical insertion of comment tag into text
* `:YouDebugItStop`    - disables automatical insertion of comment tag into text
* `:YouDebugItClean`   - deletes all the lines containing the tag

Contribution
------------

Source code and issues are hosted on GitHub:

    https://github.com/aserebryakov/you-debug-it

License
-------

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)

Changelog
---------

#### 0.1.0

* Initial version supporting only languages that have '//' comments

#### 0.2.0

* Added support for all languages where `commentstring` is defined

#### 0.2.1

* Fixed `YouDebugItClean` command in case of `commentstring=/*%s*/`
* Fixed error in case `YouDebugItClean` is executed before `YouDebugItStart`

#### 0.2.2

* Fixed error on `<CR>` pressing when buffer is changed after plugin enabling
* Fixed error in case `YouDebugItStop` is executed before `YouDebugItStart`

Credits
-------

* Alexander Serebryakov, author ([GitHub](https://github.com/aserebryakov))
