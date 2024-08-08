# Based off https://github.com/love2d/love-apple-dependencies/blob/main/iOS/luajit-iOS.sh

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1 --depth 1

cd LuaJIT

export MACOSX_DEPLOYMENT_TARGET=10.9

mkdir build

# iOS device binaries

ISDKP=$(xcrun --sdk iphoneos --show-sdk-path)
ICC=$(xcrun --sdk iphoneos --find clang)

ISDKF="-arch arm64 -isysroot $ISDKP -mios-version-min=8.0"
make clean TARGET_SYS=iOS
make -j$(nproc) CC="clang" CROSS="$(dirname $ICC)/" TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS
cp src/libluajit.a build/libluajit_device.a

# iOS simulator binaries

ISDKP=$(xcrun --sdk iphonesimulator --show-sdk-path)
ICC=$(xcrun --sdk iphonesimulator --find clang)

ISDKF="-arch x86_64 -isysroot $ISDKP -mios-simulator-version-min=8.0"
make clean TARGET_SYS=iOS
make -j$(nproc) CC="clang" CROSS="$(dirname $ICC)/" TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS
cp src/libluajit.a build/libluajit_x86_64_sim.a

ISDKF="-arch arm64 -isysroot $ISDKP -mios-simulator-version-min=8.0"
make clean TARGET_SYS=iOS
make -j$(nproc) CC="clang" CROSS="$(dirname $ICC)/" TARGET_FLAGS="$ISDKF" TARGET_SYS=iOS
cp src/libluajit.a build/libluajit_arm64_sim.a

# copy includes
mkdir build/include

cp src/lua.hpp build/include
cp src/lauxlib.h build/include
cp src/lua.h build/include
cp src/luaconf.h build/include
cp src/lualib.h build/include
cp src/luajit.h build/include

# combine lib
lipo -create -output build/libluajit_sim.a build/libluajit_x86_64_sim.a build/libluajit_arm64_sim.a

# go back
cd ../
