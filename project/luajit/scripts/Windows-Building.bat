@echo off

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1
cd LuaJIT
mkdir build
mkdir build\include
cd src
msvcbuild.bat static
copy src\lua.hpp ..\..\build\include
copy src\lauxlib.h ..\..\build\include
copy src\lua.h ..\..\build\include
copy src\luaconf.h ..\..\build\include
copy src\lualib.h ..\..\build\include
copy src\luajit.h ..\..\build\include
copy lua51.lib ..\..\build
