# Rust Dev Container template

Template for writing Rust projects with [devcontainers](https://containers.dev/overview) on [VSCode](https://code.visualstudio.com/).

It's basically [the official Rust devcontainer template](https://github.com/devcontainers/images/tree/main/src/rust) with some recommended extensions and extra features in the devcontainer config:
1. Mounting `~/.ssh` folder by default (helpful if you don't have a cross-environment ssh agent set up).
2. Importing your total host global gitconfig, including [includes](https://git-scm.com/docs/git-config#_includes).

I considered turning the latter into a [devcontainer feature](https://containers.dev/implementors/features), but those [disallow host-machine operations (note missing initializeCommand hook)](https://containers.dev/implementors/features/#lifecycle-hooks), presumably for the obvious security implications.