@echo off

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1 --depth 1
cd LuaJIT/src
msvcbuild.bat static
