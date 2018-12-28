# mulle-c-developer

🧢  mulle-c developer kit for mulle-sde

This developer kit adds unto
[mulle-sde-developer](/github.com/mulle-sde/mulle-sde-developer)
by adding more elaborate cmake templates. It is the basis for the more
generally useful developer kits
[mulle-core-developer](/github.com/mulle-core/mulle-core-developer),
[mulle-objc-developer](/github.com/mulle-objc/mulle-objc-developer),
[foundation-developer](/github.com/MulleFoundation/foundation-developer)


These templates enable you to

* create standalone dynamic libraries, used by mulle-test
* startup libraries, used by mulle-objc
* use whole-archive linking, used by mulle-objc
* tweak some compiler settings, like add -DNDEBUG for Release


## Usage

Check that the (meta) extensions are found with `mulle-sde extension show`

### Create an executable mulle-c project

`mulle-sde init -d hello-exe -m mulle-c/c-developer executable`

### Create a library mulle-c project

`mulle-sde init -d hello-lib -m mulle-c/c-developer library`


## Install

### Packages

OS      | Command
--------|------------------------------------
macos   | `brew install mulle-kybernetik/software/mulle-c-developer`
debian  | `sudo apt-get -y install mulle-c-developer` (but see below)
ubuntu  | same as debian


#### Debian Mulle kybernetiK repository

For apt installation you need to add the Mulle kybernetiK debian repository
first:

```
wget -O - "https://www.mulle-kybernetik.com/dists/debian-admin-pub.asc" | sudo apt-key add -
echo "deb [arch=all] http://www.mulle-kybernetik.com `lsb_release -c -s` main" | sudo tee "/etc/apt/sources.list.d/mulle-kybernetik.com-main.list" > /dev/null
sudo apt-get update
```

### Script

mulle-sde provides an [installer-all](https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/installer-all) script to install the required commands and mulle-sde-developer itself into `/usr` or some other place.
This is suitable for environments without supported package managers:

#### Install into /usr with sudo

```
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/installer-all' && \
chmod 755 installer-all && \
sudo OTHER_PROJECTS="mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest" ./installer-all /usr
```

#### Install into ${HOME} (without sudo)

```
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/installer-all' && \
chmod 755 installer-all && \
OTHER_PROJECTS="mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest" ./installer-all ~ no
```


