# Based off https://github.com/love2d/love-apple-dependencies/blob/main/macOS/luajit-macOS.sh

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1 --depth 1

cd LuaJIT

export MACOSX_DEPLOYMENT_TARGET=10.7

mkdir build

if command -v nproc &> /dev/null; then
    JOBS=$(nproc)
elif command -v sysctl &> /dev/null; then
    JOBS=$(sysctl -n hw.ncpu)
else
    JOBS=4
fi

# build x64
make clean
make -j$JOBS TARGET_FLAGS="-arch x86_64"
cp src/libluajit.a build/libluajit_x86_64.a

# build arm64
make clean
make -j$JOBS TARGET_FLAGS="-arch arm64"
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
