@echo off

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1
cd LuaJIT
mkdir build
mkdir build\include
cd src
msvcbuild.bat static
copy lua.hpp .\..\build\include
copy lauxlib.h .\..\build\include
copy lua.h .\..\build\include
copy luaconf.h .\..\build\include
copy lualib.h .\..\build\include
copy luajit.h .\..\build\include
copy lua51.lib .\..\build
