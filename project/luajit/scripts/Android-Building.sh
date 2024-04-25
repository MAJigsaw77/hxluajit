# Author: Mihai Alexandru (MAJigsaw77)

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1

cd LuaJIT

mkdir project
mkdir project/luajit
mkdir project/luajit/include
mkdir project/luajit/lib
mkdir project/luajit/lib/Android

# Android arm64

NDKBIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
NDKCROSS="$NDKBIN/aarch64-linux-android-"
NDKCC="$NDKBIN/aarch64-linux-android21-clang"

make clean
make -j8 HOST_CC="gcc -m64" CC=clang CROSS=$NDKCROSS \
     STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" TARGET_SYS=Linux \
     TARGET_LD=$NDKCC TARGET_LDFLAGS="-fuse-ld=lld" TARGET_AR="$NDKBIN/llvm-ar rcus" \
     TARGET_STRIP=$NDKBIN/llvm-strip
cp src/libluajit.a project/luajit/lib/Android/libluajit-arm64.a

# Android armv7a

NDKBIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
NDKCROSS="$NDKBIN/armv7a-linux-androideabi-"
NDKCC="$NDKBIN/armv7a-linux-androideabi19-clang"

make clean
make -j8 HOST_CC="gcc -m32" CC=clang CROSS=$NDKCROSS \
     STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" TARGET_SYS=Linux \
     TARGET_LD=$NDKCC TARGET_LDFLAGS="-fuse-ld=lld" TARGET_AR="$NDKBIN/llvm-ar rcus" \
     TARGET_STRIP=$NDKBIN/llvm-strip
cp src/libluajit.a project/luajit/lib/Android/libluajit-armv7a.a

# Android x86_64

NDKBIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
NDKCROSS="$NDKBIN/x86_64-linux-android-"
NDKCC="$NDKBIN/x86_64-linux-android21-clang"

make clean
make -j8 HOST_CC="gcc -m64" CC=clang CROSS=$NDKCROSS \
     STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" TARGET_SYS=Linux \
     TARGET_LD=$NDKCC TARGET_LDFLAGS="-fuse-ld=lld" TARGET_AR="$NDKBIN/llvm-ar rcus" \
     TARGET_STRIP=$NDKBIN/llvm-strip
cp src/libluajit.a project/luajit/lib/Android/libluajit-x86_64.a

# Android x86

NDKBIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
NDKCROSS="$NDKBIN/i686-linux-android-"
NDKCC="$NDKBIN/i686-linux-android19-clang"

make clean
make -j8 HOST_CC="gcc -m32" CC=clang CROSS=$NDKCROSS \
     STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" TARGET_SYS=Linux \
     TARGET_LD=$NDKCC TARGET_LDFLAGS="-fuse-ld=lld" TARGET_AR="$NDKBIN/llvm-ar rcus" \
     TARGET_STRIP=$NDKBIN/llvm-strip
cp src/libluajit.a project/luajit/lib/Android/libluajit-x86.a

cp src/lua.hpp project/luajit/include
cp src/lauxlib.h project/luajit/include
cp src/lua.h project/luajit/include
cp src/luaconf.h project/luajit/include
cp src/lualib.h project/luajit/include
cp src/luajit.h project/luajit/include

# go back
cd ../
