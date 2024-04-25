@echo off

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1
cd LuaJIT
mkdir build
mkdir build\include
cd src
msvcbuild.bat static
xcopy /s *.h ..\build\include
copy lua51.lib ..\build
