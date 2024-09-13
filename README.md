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

<details>
<summary>Commands list</summary>

#### Debian based distributions ([Debian](https://debian.org)):
```bash
sudo apt-get install libluajit-5.1-dev
```

#### Arch based distributions ([Arch](https://archlinux.org)):
```bash
sudo pacman -S luajit
```

#### Fedora based distributions ([Fedora](https://getfedora.org)):
```bash
sudo dnf install luajit
```

#### Red Hat Enterprise Linux (RHEL):
```bash
sudo dnf install luajit
```

#### openSUSE based distributions ([openSUSE](https://www.opensuse.org)):
```bash
sudo zypper install luajit
```

#### Gentoo based distributions ([Gentoo](https://gentoo.org)):
```bash
sudo emerge dev-lang/luajit
```

#### Slackware based distributions ([Slackware](https://www.slackware.com)):
```bash
sudo slackpkg install luajit
```

#### Void Linux ([Void Linux](https://voidlinux.org)):
```bash
sudo xbps-install -S luajit
```

#### NixOS ([NixOS](https://nixos.org)):
```bash
nix-env -iA nixpkgs.luajit
```

</details>

### Usage Example

Check out the [Examples Folder](examples/) for examples on how to use this library.

### Licensing

**hxluajit** is made available under the **MIT License**. Check [LICENSE](./LICENSE) for more information.

![](https://avatars.githubusercontent.com/u/11773774?s=200&v=4)

**LuaJIT** is made available under the **MIT License**. Check [LuaJIT's Licence](https://github.com/LuaJIT/LuaJIT/blob/v2.1/COPYRIGHT) for more information.
