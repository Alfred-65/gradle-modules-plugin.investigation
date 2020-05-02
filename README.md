## Introduction
This folder contains a lot of sub-folders. Each sub-folder contains a [Gradle](gradle.org) project.
The purpose of these gradle projects is to investigate the work of Gradle's eclipse plugin without
or with the help of plugin
[gradle-modules-plugin](https://github.com/java9-modularity/gradle-modules-plugin).

## Rational for this contribution

Currently Gradle doesn't support modular Java (which is the main reason
for [gradle-modules-plugin](https://github.com/java9-modularity/gradle-modules-plugin)). Thus it is
no wonder that the `.classpath` file created by Gradle's eclipse plugin requires (currently manual)
changes in modular Java projects.

The problems discovered so far are outlined in (rather simple) projects in new sub-folders
`project*` (see below for more information).

The intention of [contribution](https://github.com/java9-modularity/gradle-modules-plugin/pull/127)
is to improve the `.classpath` file created by Gradle's eclipse plugin such that no manual
corrections are necessary.

For background information and starting point, see

* [issue 33](https://github.com/java9-modularity/gradle-modules-plugin/issues/33)
* [Gradle's documentation](https://docs.gradle.org/current/userguide/eclipse_plugin.html)

This contribution was tested in the following environments:

1. Gradle:
	* 5.3.1: Gradle version used by "gradle-modules-plugin" version 1.6.0
	* 5.6.4: Last 5.x version of Gradle
	* 6.0.1: As of 2019-11-28 current Gradle release.
	* 6.1:
	* 6.3: As of 2020-05-02 current Gradle release.
- Eclipse:
	* version 2019-09
	* version 2020-03
- Operating systems:
	* Windows 10 (widely used)
	* ubuntu 16.04 LTS (because I have access to it and whant to check the UN*X world as well)

## General remarks

All projects in the additional sub-folders where created by the `gradle init` task where the same
version of Gradle is used as later on in the project.

The name of the sub-folders follow the following principle:

- prefix = "project"
- "-" = hyphen
- "?" = single character stating the main purpose of the gradle project
       _(note: libraries to be consumed have to be published before they could be consumed by other
               libraries, this requirement is fullfilled if projects are build and published in
               alphabetic order)_.
	* m => a library used in the main source-set of another library
	* t => a library used in the test source-set of another library
	* z => a library consuming other libraries of type t or m
- "?" = another single character indicating whether a project is modular or not and which test
        engines are used by that project in the test source-set. Thus modular as well as non-modular
        is covered as well as all combinations for using  test-engines JUnit 4, JUnit 5 and TestNG
	- a = 01 => non-modular          JUnit 5
	- b = 02 => non-modular
	- ...
	- t = 20 =>   modular                     TestNG
	- u = 21 =>   modular            JUnit 5
	- v = 22 =>   modular   JUnit 4
	- w = 23 =>   modular            JUnit 5, TestNG
	- x = 24 =>   modular   JUnit 4,          TestNG
	- y = 25 =>   modular   JUnit 4, JUnit 5
	- z = 26 =>   modular   JUnit 4, JUnit 5, TestNG
- xyz    = indicating the gradle version which is used in that subfolder, e.g:
	* "531" => gradle version 5.3.1,
	* "601" => gradle version 6.0.1

## Projects in sub-folders

### project-ma601
Properties

- Gradle version 6.0.1
- non-modular, provides library consumed by other project's main source-set
- project uses JUnit 5 test engine only

Observations:

1. Win10, Eclipse 2020-03: Improvement not necessary and not possible,
   because non-modular projects don't apply "gradle-modules-plugin".

### project-mu610
Properties
- Gradle version 6.1
- modular, provides library consumed by other projects in main source-set
- project uses JUnit 5 test engine only

Observations:

1. Win10, Eclipse 2020-03: Improvement (JRE on module-path) possible, but not necessary.

### project-tu531
Properties

- Gradle version 5.3.1
- modular, provides library consumed by other projects in test source-set
- project uses JUnit 5 test engine only

Observations:

1. Win10, Eclipse 2020-03: Needs improvement, Eclipse can't compile test-source-set.

### project-tu564
Properties

- Gradle version 5.6.4
- modular, provides library consumed by other projects in test source-set
- project uses JUnit 5 test engine only

Observations:

1. Win10, Eclipse 2020-03: Improvement (JRE on module-path) possible, but not necessary.


### project-tu630
Properties

- Gradle version 6.0.1
- modular, provides library consumed by other projects in test source-set
- project uses JUnit 5 test engine only

Observations:

1. Win10, Eclipse 2020-03: Improvement (JRE on module-path) possible, but not necessary.

### project-zu6xy
Properties

- Gradle versions 6.0.1, 6.3
- modular project consumes libaries in main source-set
- project uses JUnit 5 test engine only

Observations:

1. Win10, Eclipse 2020-03: Needs improvement, consumed libraries not on module-path.
