# Author: Mihai Alexandru (MAJigsaw77)

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1

cd LuaJIT

mkdir build

# Window x64 MinGW

make clean
make -j8 HOST_CC="gcc -m64" TARGET_SYS=Windows
cp src/libluajit.a build/libluajit.a

# copy includes
mkdir build/include

cp src/lua.hpp build/include
cp src/lauxlib.h build/include
cp src/lua.h build/include
cp src/luaconf.h build/include
cp src/lualib.h build/include
cp src/luajit.h build/include

# go back
cd ../
