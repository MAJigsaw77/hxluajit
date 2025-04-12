@echo off

if exist LuaJIT (
    cd LuaJIT
    git checkout v2.1
    git pull origin v2.1
) else (
    git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1 --depth 1
    cd LuaJIT
)

if not exist build (
    mkdir build
)

if not exist build\include (
    mkdir build\include
)

cd src

call msvcbuild.bat static

cd ..

xcopy /Y /Q src\lua51.lib build\libluajit.lib
xcopy /Y /Q src\lua.hpp build\include\lua.hpp
xcopy /Y /Q src\lauxlib.h build\include\lauxlib.h
xcopy /Y /Q src\lua.h build\include\lua.h
xcopy /Y /Q src\luaconf.h build\include\luaconf.h
xcopy /Y /Q src\lualib.h build\include\lualib.h
xcopy /Y /Q src\luajit.h build\include\luajit.h

cd ..
