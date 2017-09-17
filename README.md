whatigot.bash
=============

[![Build status][Build image]][Build]

A Bash script that prints a list of installed software and their versions. Provides an overview of the major system software installed, such as services and programming languages, and its corresponding version. Useful for exploring new systems or comparing software installations between boxes.

The goal of *whatigot* is to only list intentionally installed software. This is quite different from the output one might get from a package manager, which typically lists every package, many of which are just dependencies of the software we really care about. For this reason we do not list libraries or members of the GNU Coreutils.

Contents
--------

  1. [Example output](#example-output)
  1. [Installation](#installation)
  1. [Supported software](#supported-software)
  1. [Testing](#testing)

Example output
--------------

Each line of output comprises the name of the software, suffixed with a colon and a space, followed by the version as a single token. Any additional information, such as build number, is stripped away so the output is limited to two columns. Some distributions modify the software and suffix additional identifiers to the version number, such as in the following BIND example; this is kept.

`./whatigot.bash`

>BIND: 9.9.4-RedHat-9.9.4-51.el7  
Docker: 1.12.6  
ImageMagick: 6.7.8-9  
MongoDB: 2.6.12  
NGINX: 1.10.2

Installation
------------

Either clone this repository with Git or download the script and set the executable bit as shown in the following steps.

```sh
wget https://raw.githubusercontent.com/ScriptFUSION/whatigot.bash/master/whatigot.bash
chmod +x whatigot.bash
./whatigot.bash
```

Optionally, move it to somewhere on the PATH to run it like a normal system command.

```sh
sudo mv whatigot.bash /usr/local/bin/whatigot
whatigot
```

Supported software
------------------

When the script runs it will search for the following software and print its version number if found.

 - [BIND][BIND]
 - [Composer][Composer]
 - [Docker][Docker]
 - [ExifTool][ExifTool]
 - [ImageMagick][ImageMagick]
 - [MongoDB][MongoDB]
 - [NGINX][NGINX]
 - [OpenDKIM][OpenDKIM]
 - [Perl][Perl]
 - [PHP][PHP]
 - [Postfix][Postfix]
 - [Python][Python]
 - [Squid][Squid]
 - [Varnish][Varnish]
 - [ZNC][ZNC]

### Adding new software support

It's easy to add support for your favourite software! Just follow these steps.

1. Add a function to `whatigot.bash`, in alphabetical order, and ensure it's called at the end.
2. Ensure the relevant package is installed for each test environment.
3. Add a test case to the [`test`][Test script] script.
4. Update the [readme](#supported-software).
5. Create a [pull request][PRs]!

Testing
-------

[Pull requests][PRs] are automatically tested by [Travis][Build], for each distribution, in parallel. The following distributions are currently tested.

* [CentOS 7][CentOS]
* [Ubuntu 16.04][Ubuntu]

Docker builds test environments for each distribution, installs all the software and copies in the script. The script runs inside the Docker environment and its output is captured and tested by Travis using the [`test`][Test script] script.

### Adding new test environments

Adding a new test environment becomes iteratively more taxing as we support more software, and conversely, supporting more software becomes more difficult the more test environments we have. Therefore we'd like to keep the number of test environments limited to the minimum necessary to prove the software works.

Since CentOS is based on RedHat, it is supposed testing CentOS should be sufficient to prove RedHat works, and we therefore do not need a separate RedHat testing environment. Of course, if this proves false, we may consider adding additional RedHat testing support, but please consider creating an [issue][Issues] to discuss whether we should support a new environment before doing any work to avoid the risk of rejection!

To add support for a new test environment follow these steps.

1. Create a directory named after the distribution.
2. Add a `Dockerfile` to the distribution directory that installs all the [supported software](#supported-software).
3. Add the distribution directory name with a `DIST` key to the `env` matrix in `.travis.yml`.
4. Create a [pull request][PRs]!


  [Test script]: https://github.com/ScriptFUSION/whatigot.bash/blob/master/test
  [Issues]: https://github.com/ScriptFUSION/whatigot.bash/issues
  [PRs]: https://github.com/ScriptFUSION/whatigot.bash/pulls
  [Build]: http://travis-ci.org/ScriptFUSION/whatigot.bash
  [Build image]: https://travis-ci.org/ScriptFUSION/whatigot.bash.svg?branch=master "Build status"

  [CentOS]: https://www.centos.org
  [Ubuntu]: https://www.ubuntu.com

  [BIND]: https://www.isc.org/downloads/bind
  [Composer]: https://getcomposer.org
  [Docker]: https://docker.com
  [ExifTool]: https://www.sno.phy.queensu.ca/~phil/exiftool
  [ImageMagick]: https://www.imagemagick.org
  [MongoDB]: https://www.mongodb.com
  [NGINX]: http://nginx.org
  [OpenDKIM]: http://opendkim.org
  [Perl]: https://www.perl.org
  [PHP]: http://php.net
  [Postfix]: http://www.postfix.org
  [Python]: https://www.python.org
  [Squid]: http://www.squid-cache.org
  [Varnish]: https://varnish-cache.org
  [ZNC]: https://znc.in
