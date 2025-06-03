# LÖVE Template with Fennel
This is the template I use for new projects with löve.
Documenting it mostly as practice for other repositories.

But, feel free to use it.

## Setup
Make a local copy of the template:
`git clone https://github.com/massette/love2d-fennel-template.git`

Running the cloned directory with `love` will launch a Fennel REPL.
For compiling into lua, see [Distribution](#distribution).

You can update the fennel script from [fennel-lang.org](https://fennel-lang.org/)
or use a different installation for compilation by setting `FENNEL_PATH`.

## Structure
When building a project, all `.fnl` files from any level of the project are
compiled into `.lua` files in the `build/` directory, preserving directory
structure.

Additionally, `conf.lua` is copied from the top-level directory as well as
any files in the `assets/` directory, regardless of type.

**Note, `main.lua` does not affect the build!** It is only responsible for
launching the REPL during development.

### Special Directories
These directories are used by name in the Makefile.

#### assets/
All files in this directory are copied directly into each build,
preserving directory structure.

Note, non-code files placed anywhere else are not used in the build.

#### build/
This directory contains all files used for the most recent build.
It can be removed with `make clean`.

#### dist/
This directory contains any packaged binaries.
It can be removed with `make clean`.

### Code Directories
These directories contain only .fnl and .lua files.
For the most part, they can be safely removed.

#### src/
Code created solely for this projecct is stored here.

#### lib/
This directory contains library code used across multiple files or
projects.

Libraries are often stored in subdirectories.
Note, `fennel.lua` is stored here by default.

#### util/
This directory contains code used across multiple files that may not be
complex enough to be stored as a library.

Files in this directory often return a function directly.

## Distribution
This section will be updated when I actually get to this point with a
project.

`NAME` and `VERSION` are used to name the produced executables.

### LOVE
`make love` compresses necessary files into a `.love` in the `dist/` directory.
Set `DIST_LOVE` to save to a different path.
