@echo off

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1
cd LuaJIT/src
./msvcbuild.bat static

mkdir ..\build
copy lua51.lib ..\build

mkdir ..\build\include
copy lua.hpp ..\build\include
copy lauxlib.h ..\build\include
copy lua.h ..\build\include
copy luaconf.h ..\build\include
copy lualib.h ..\build\include
copy luajit.h ..\build\include
