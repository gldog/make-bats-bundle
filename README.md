# make-bats-bundle

# About

The script `make-bats-bundle.sh` is to bundle a bats-bundle with actual helper libraries.

# Make a bats bundle

    make-bats-bundle.sh

This command clones the repos bats-core, bats-assert, bats-file and bats-support, removes files not used in production,
and makes the bats-bundle.tar.gz

# Don't use bats npm-modules for helper libraries

In the [bats docs](https://bats-core.readthedocs.io/en/stable/index.html)
there are ways described to download and use bats and helper libraries.
In the bats docs [Installation> Any OS: npm](https://bats-core.readthedocs.io/en/stable/installation.html#any-os-npm) it
is documented how to install `bats` by `npm`.
This leads to the assumption also helper libraries can be installed by `npm` as well.
In fact this is possible, but some node-modules are outdated.
In my try (May 2025) the version of `bats-support`was 0.3.0, and the version of `bats-assert` was also 0.3.0.
But the current version of bats-assert is 2.1.0.

`bats-assert` in version 0.3.0 only provides the function `assert_output`, not other functions like
`assert-stderr`.

There is the open GitHub
issue [npm packages for - for bats-core plugins #493](https://github.com/bats-core/bats-core/issues/493):

> However none of the other plugins are published to npm.
>
>- bats-assert
>- bats-detik
>- bats-support
>- bats-file


The actual code of `bats-core` seems to be updated to node-modules.

The actual code of _bats-libraries_ are available in the GitHub repos:

- [bats-code/bats-assert](https://github.com/bats-core/bats-assert/tree/master/src), with more functions
  than `assert_output`
- [bats-code/bats-suport](https://github.com/bats-core/bats-support)
- [bats-file](https://github.com/bats-core/bats-file)