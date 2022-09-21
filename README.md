The South Sámi morphology and tools
==========================================

[![GitHub issues](https://img.shields.io/github/issues-raw/giellalt/lang-sma)](https://github.com/giellalt/lang-sma/issues)
[![Build Status](https://divvun-tc.thetc.se/api/github/v1/repository/giellalt/lang-sma/main/badge.svg)](https://github.com/giellalt/lang-sma/actions)
[![License](https://img.shields.io/github/license/giellalt/lang-sma)](https://github.com/giellalt/lang-sma/blob/main/LICENSE)
[![Desktop speller download](https://img.shields.io/badge/download%40latest-desktop--bhfst-brightgreen)](https://pahkat.uit.no/main/download/speller-sma?platform=desktop&channel=nightly)
[![Mobile speller download](https://img.shields.io/badge/download%40latest-mobile--bhfst-brightgreen)](https://pahkat.uit.no/main/download/speller-sma?platform=mbile&channel=nightly)

This repository contains finite state source files for the South Sámi language,
for building morphological analysers, proofing tools
and dictionaries. The data and implementation are licenced under _GNU GPL v3_
licence, also detailed in the
[LICENSE](https://github.com/giellalt/lang-sma/blob/main/LICENSE). The
authors named in the AUTHORS file are available to grant other licencing
choices.

Install proofing tools and [keyboards](https://github.com/giellalt/keyboard-sma)
for the South Sámi language by using the [Divvun Installer](http://divvun.no)
(some languages are only available via the nightly channel).

Spell-checker accuracy:

[![Speller
Accuracy](https://img.shields.io/badge/Speller_Accuracy-83_%25-green.svg)](https://giellalt.github.io/lang-sma/speller-report.html)
[![Spell-checking accuracy development
graph](https://giellalt.github.io/lang-sma/speller-report.svg)](https://giellalt.github.io/lang-sma/speller-report.svg)

Use and test spellers
---------------------

The spellers downloadable at the top of this page (the `*.bhfst` files) can be
used with [divvunspell](https://github.com/divvun/divvunspell).

Documentation
-------------

Documentation can be found at:

- [Language specific documentation](https://giellalt.github.io/lang-sma/)
-   <https://giellalt.uit.no/index.html> (general info)

Core dependencies
-----------------

In order to compile and use South Sámi language morphology and
dictionaries, you need:

- an FST compiler: [HFST](https://github.com/hfst/hfst), [Foma](https://github.com/mhulden/foma) or [Xerox Xfst](https://web.stanford.edu/~laurik/fsmbook/home.html)
- [VislCG3](https://visl.sdu.dk/svn/visl/tools/vislcg3/trunk) Constraint Grammar tools

To install VislCG3 and HFST, just copy/paste this into your Terminal on **Mac OS X**:

```
curl https://apertium.projectjj.com/osx/install-nightly.sh | sudo bash
```

or terminal on **Ubuntu, Debian or Windows Subsystem for Linux**:

```
wget https://apertium.projectjj.com/apt/install-nightly.sh -O - | sudo bash
sudo apt-get install cg3 hfst
```

or terminal on **RedHat, Fedora, CentOS or Windows Subsystem for Linux**:

```
wget https://apertium.projectjj.com/rpm/install-nightly.sh -O - | sudo bash
sudo dnf install cg3 hfst
```

Alternatively, the Apertium wiki has good instructions on how to [install the dependencies for Mac
OS X](https://wiki.apertium.org/wiki/Apertium_on_Mac_OS_X) and how to [install
the dependencies on
linux](https://wiki.apertium.org/wiki/Installation_of_grammar_libraries)

Further details and dependencies are described on the GiellaLT [Getting Started](https://giellalt.uit.no/infra/GettingStarted.html) pages.

Downloading
-----------

Using Git:
```
git clone https://github.com/giellalt/lang-sma
```

Using Subversion:
```
svn checkout https://github.com/giellalt/lang-sma.git/trunk lang-sma
```

Building and installation
-------------------------

[INSTALL](https://github.com/giellalt/lang-sma/blob/main/INSTALL)
describes the GNU build system in detail, but for most users it is the usual:

```sh
./autogen.sh # This will automatically clone or check out other GiellaLT dependencies
./configure
make
(as root) make install
```
