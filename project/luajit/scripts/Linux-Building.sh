#!/bin/bash

if [ -d "LuaJIT" ]; then
    cd LuaJIT
    git checkout v2.1
    git pull origin v2.1
else
    git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1 --depth 1
    cd LuaJIT
fi

mkdir -p build
mkdir -p build/include

if command -v nproc &> /dev/null; then
    JOBS=$(nproc)
elif command -v sysctl &> /dev/null; then
    JOBS=$(sysctl -n hw.ncpu)
else
    JOBS=4
fi

make clean
make -j$JOBS TARGET_FLAGS="-march=x86-64"
cp src/libluajit.a build/libluajit_x86_64.a

make clean
make -j$JOBS TARGET_FLAGS="-march=armv8-a" CC=aarch64-linux-gnu-gcc
cp src/libluajit.a build/libluajit_arm64.a

cp src/{lua.hpp,lauxlib.h,lua.h,luaconf.h,lualib.h,luajit.h} build/include

ar -x build/libluajit_x86_64.a
ar -x build/libluajit_arm64.a
ar rcs build/libluajit.a *.o

rm -f *.o

cd ..
