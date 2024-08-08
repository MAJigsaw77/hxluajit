#!/bin/bash

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1 --depth 1

cd LuaJIT

mkdir -p build

NDKBIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"

declare -A archs=(
	["arm64"]="aarch64-linux-android- aarch64-linux-android21-clang -m64"
	["armv7a"]="armv7a-linux-androideabi- armv7a-linux-androideabi21-clang -m32"
	["x86_64"]="x86_64-linux-android- x86_64-linux-android21-clang -m64"
	["x86"]="i686-linux-android- i686-linux-android21-clang -m32"
)

if command -v nproc &> /dev/null; then
    JOBS=$(nproc)
elif command -v sysctl &> /dev/null; then
    JOBS=$(sysctl -n hw.ncpu)
else
    JOBS=4
fi

build_arch()
{
	local arch=$1
	local cross_prefix=$2
	local cc=$3
	local host_cc=$4

	make clean
	make -j$JOBS HOST_CC="gcc $host_cc" CC=clang CROSS="$NDKBIN/$cross_prefix" \
		STATIC_CC="$NDKBIN/$cc -fPIC" DYNAMIC_CC="$NDKBIN/$cc -fPIC" TARGET_SYS=Linux \
		TARGET_LD="$NDKBIN/$cc" TARGET_LDFLAGS="-fuse-ld=lld" TARGET_AR="$NDKBIN/llvm-ar rcus" \
		TARGET_STRIP="$NDKBIN/llvm-strip"
	cp src/libluajit.a build/libluajit-$arch.a
}

for arch in "${!archs[@]}"; do
	build_arch "$arch" ${archs[$arch]}
done

mkdir -p build/include

cp src/{lua.hpp,lauxlib.h,lua.h,luaconf.h,lualib.h,luajit.h} build/include

cd ../
