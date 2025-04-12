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

export MACOSX_DEPLOYMENT_TARGET=10.9

ISDKP=$(xcrun --sdk iphoneos --show-sdk-path)
ICC=$(xcrun --sdk iphoneos --find clang)

ISDKF="-arch arm64 -isysroot $ISDKP -mios-version-min=8.0"
make clean TARGET_SYS=iOS
make -j$JOBS CC="clang" CROSS="$(dirname $ICC)/" TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS
cp src/libluajit.a build/libluajit_device.a

ISDKP=$(xcrun --sdk iphonesimulator --show-sdk-path)
ICC=$(xcrun --sdk iphonesimulator --find clang)

ISDKF="-arch x86_64 -isysroot $ISDKP -mios-simulator-version-min=8.0"
make clean TARGET_SYS=iOS
make -j$JOBS CC="clang" CROSS="$(dirname $ICC)/" TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS
cp src/libluajit.a build/libluajit_x86_64_sim.a

ISDKF="-arch arm64 -isysroot $ISDKP -mios-simulator-version-min=8.0"
make clean TARGET_SYS=iOS
make -j$JOBS CC="clang" CROSS="$(dirname $ICC)/" TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS
cp src/libluajit.a build/libluajit_arm64_sim.a

cp src/{lua.hpp,lauxlib.h,lua.h,luaconf.h,lualib.h,luajit.h} build/include

lipo -create -output build/libluajit_sim.a build/libluajit_x86_64_sim.a build/libluajit_arm64_sim.a

cd ..
