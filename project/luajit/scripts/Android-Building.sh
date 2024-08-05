# Author: Mihai Alexandru (MAJigsaw77)

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1

cd LuaJIT

mkdir build

# Android arm64

NDKBIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
NDKCROSS="$NDKBIN/aarch64-linux-android-"
NDKCC="$NDKBIN/aarch64-linux-android21-clang"

make clean
make -j8 HOST_CC="gcc -m64" CC=clang CROSS=$NDKCROSS \
     STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" TARGET_SYS=Linux \
     TARGET_LD=$NDKCC TARGET_LDFLAGS="-fuse-ld=lld" TARGET_AR="$NDKBIN/llvm-ar rcus" \
     TARGET_STRIP=$NDKBIN/llvm-strip
cp src/libluajit.a build/libluajit-arm64.a

# Android armv7a

NDKBIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
NDKCROSS="$NDKBIN/armv7a-linux-androideabi-"
NDKCC="$NDKBIN/armv7a-linux-androideabi21-clang"

make clean
make -j8 HOST_CC="gcc -m32" CC=clang CROSS=$NDKCROSS \
     STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" TARGET_SYS=Linux \
     TARGET_LD=$NDKCC TARGET_LDFLAGS="-fuse-ld=lld" TARGET_AR="$NDKBIN/llvm-ar rcus" \
     TARGET_STRIP=$NDKBIN/llvm-strip
cp src/libluajit.a build/libluajit-armv7a.a

# Android x86_64

NDKBIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
NDKCROSS="$NDKBIN/x86_64-linux-android-"
NDKCC="$NDKBIN/x86_64-linux-android21-clang"

make clean
make -j8 HOST_CC="gcc -m64" CC=clang CROSS=$NDKCROSS \
     STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" TARGET_SYS=Linux \
     TARGET_LD=$NDKCC TARGET_LDFLAGS="-fuse-ld=lld" TARGET_AR="$NDKBIN/llvm-ar rcus" \
     TARGET_STRIP=$NDKBIN/llvm-strip
cp src/libluajit.a build/libluajit-x86_64.a

# Android x86

NDKBIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
NDKCROSS="$NDKBIN/i686-linux-android-"
NDKCC="$NDKBIN/i686-linux-android21-clang"

make clean
make -j8 HOST_CC="gcc -m32" CC=clang CROSS=$NDKCROSS \
     STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" TARGET_SYS=Linux \
     TARGET_LD=$NDKCC TARGET_LDFLAGS="-fuse-ld=lld" TARGET_AR="$NDKBIN/llvm-ar rcus" \
     TARGET_STRIP=$NDKBIN/llvm-strip
cp src/libluajit.a build/libluajit-x86.a

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
