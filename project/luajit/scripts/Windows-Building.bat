@echo off

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1
cd LuaJIT
mkdir build
mkdir build\include
cd src
msvcbuild.bat static
cd ..
cd ..
copy LuaJIT\src\lua.hpp LuaJIT\build\include
copy LuaJIT\src\lauxlib.h LuaJIT\build\include
copy LuaJIT\src\lua.h LuaJIT\build\include
copy LuaJIT\src\luaconf.h LuaJIT\build\include
copy LuaJIT\src\lualib.h LuaJIT\build\include
copy LuaJIT\src\luajit.h LuaJIT\build\include
copy LuaJIT\src\lua51.lib LuaJIT\build
