# hxluajit

![](https://img.shields.io/github/repo-size/MAJigsaw77/hxluajit) ![](https://badgen.net/github/open-issues/MAJigsaw77/hxluajit) ![](https://badgen.net/badge/license/MIT/green)

Haxe/hxcpp @:native bindings for [LuaJIT](https://luajit.org/luajit.html).

### Installation

You can install it through `Haxelib`
```bash
haxelib install hxluajit
```
Or through `Git`, if you want the latest updates
```bash
haxelib git hxluajit https://github.com/MAJigsaw77/hxluajit.git
```

### Dependencies

On ***Linux*** you need to install `luajit` from your distro's package manager.

* [Debian](https://debian.org) based distributions:
  ```bash
  sudo apt-get install libluajit-5.1-dev
  ```

* [Arch](https://archlinux.org) based distributions:
  ```bash
  sudo pacman -S luajit
  ```

* [Gentoo](https://gentoo.org) based distributions:
  ```bash
  sudo emerge dev-lang/luajit
  ```

### Usage Example

Check out the [Examples Folder](examples/) for examples on how to use this library.

### Licensing

**hxluajit** is made available under the **MIT License**. Check [LICENSE](./LICENSE) for more information.

![](https://avatars.githubusercontent.com/u/11773774?s=200&v=4)

**LuaJIT** is made available under the **MIT License**. Check [LuaJIT's Licence](https://github.com/LuaJIT/LuaJIT/blob/v2.1/COPYRIGHT) for more information.
