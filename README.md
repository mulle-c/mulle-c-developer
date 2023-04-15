# mulle-c-developer

#### 🧢 mulle-c developer kit for mulle-sde

This developer kit adds unto
[mulle-sde-developer](//github.com/mulle-sde/mulle-sde-developer)
by adding more elaborate cmake templates. It is the basis for more
generally useful developer kits like
[mulle-objc-developer](//github.com/mulle-objc/mulle-objc-developer) or
[foundation-developer](//github.com/MulleFoundation/foundation-developer)

These templates enable you to:

* create standalone dynamic libraries, used by mulle-test
* startup libraries, used by mulle-objc
* use whole-archive linking, used by mulle-objc
* tweak some compiler settings, like add -DNDEBUG for Release

| Release Version                                       | Release Notes
|-------------------------------------------------------|--------------
| ![Mulle kybernetiK tag](https://img.shields.io/github/tag/mulle-c/mulle-c-developer.svg?branch=release) [![Build Status](https://github.com/mulle-c/mulle-c-developer/workflows/CI/badge.svg?branch=release)](//github.com/mulle-c/mulle-c-developer/actions)| [RELEASENOTES](RELEASENOTES.md) |



## Usage

Check that the (meta) extensions are found with `mulle-sde extension show`

### Create an executable mulle-c project

``` sh
mulle-sde init -d hello-exe -m mulle-c/c-developer executable
```

### Create a library mulle-c project

``` sh 
mulle-sde init -d hello-lib -m mulle-c/c-developer library
```


### You are here

![Overview](overview.dot.svg)





## Add

Use [mulle-sde](//github.com/mulle-sde) to add mulle-c-developer to your project:

``` sh
mulle-sde add github:mulle-c/mulle-c-developer
```

To only add the sources of mulle-c-developer with dependency
sources use [clib](https://github.com/clibs/clib):


``` sh
clib install --out src/mulle-c mulle-c/mulle-c-developer
```

Add `-isystem src/mulle-c` to your `CFLAGS` and compile all the sources that were downloaded with your project.


## Install

### Install with mulle-sde

Use [mulle-sde](//github.com/mulle-sde) to build and install mulle-c-developer:

``` sh
mulle-sde install --prefix /usr/local \
   https://github.com/mulle-c/mulle-c-developer/archive/latest.tar.gz
```

### Manual Installation


Install **mulle-c-developer** into `/usr/local` with [cmake](https://cmake.org):

``` sh
cmake -B build \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DCMAKE_PREFIX_PATH=/usr/local \
      -DCMAKE_BUILD_TYPE=Release &&
cmake --build build --config Release &&
cmake --install build --config Release
```


## Author

[Nat!](https://mulle-kybernetik.com/weblog) for Mulle kybernetiK



