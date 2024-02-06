# Based off https://github.com/love2d/love-apple-dependencies/blob/main/macOS/luajit-macOS.sh

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1

cd LuaJIT

export MACOSX_DEPLOYMENT_TARGET=10.7

mkdir build

# build x64
make clean
make -j8 TARGET_FLAGS="-arch x86_64"
cp src/libluajit.a build/libluajit_x86_64.a

# build arm64
make clean
make -j8 TARGET_FLAGS="-arch arm64"
cp src/libluajit.a build/libluajit_arm64.a

# copy includes
mkdir build/include

cp src/lua.hpp build/include
cp src/lauxlib.h build/include
cp src/lua.h build/include
cp src/luaconf.h build/include
cp src/lualib.h build/include
cp src/luajit.h build/include

# combine lib
lipo -create -output build/libluajit.a build/libluajit_arm64.a build/libluajit_x86_64.a

# go back

cd ../
