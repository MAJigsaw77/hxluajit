# Author: Lily Ross (mcagabe19)
# Note that use msys to build

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1

cd LuaJIT

mkdir build

make clean
cd src
make -j8 BUILDMODE=static
cd ..
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
