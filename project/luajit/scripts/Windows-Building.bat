@echo off

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1
mkdir LuaJIT/build
cd LuaJIT/src
./msvcbuild.bat static

cd ../

cp src/lua51.lib build/lua51.lib

mkdir build/include

cp src/lua.hpp build/include/lua.hpp
cp src/lauxlib.h build/include/lauxlib.h
cp src/lua.h build/include/lua.h
cp src/luaconf.h build/include/luaconf.h
cp src/lualib.h build/include/lualib.h
cp src/luajit.h build/include/luajit.h
