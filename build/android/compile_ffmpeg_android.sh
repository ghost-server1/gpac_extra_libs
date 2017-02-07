#!/bin/bash

BASEPATH=$(pwd)
export NDK=$1
export DEST=$BASEPATH/jni/ffmpeg
cd ../../
if [ ! -d "ffmpeg-2.4.3" ]; then
	echo "Fetching FFMPEG 2.4.3"
	wget "http://ffmpeg.org/releases/ffmpeg-2.4.3.tar.bz2"
	tar xvf ffmpeg-2.4.3.tar.bz2
	rm -f ffmpeg-2.4.3.tar.bz2
fi

#overriding some files ...
cp -f $BASEPATH/ffmpeg_patch/configure ffmpeg-2.4.3
cd ffmpeg-2.4.3/

if [ "$NDK" = "" ]; then
    echo NDK variable not set, assuming ${HOME}/android-ndk
    export NDK=${HOME}/android-ndk
fi

ROOT_DIR=`pwd`

OBJS="$ROOT_DIR/objs/ffmpeg"
if [ "$DEST" = "" ]; then
	rm -rf $ROOT_DIR/build/stagefright
	mkdir -p $ROOT_DIR/build/stagefright
	DEST=$ROOT_DIR/build/stagefright
fi

for ABI in "armeabi-v7a" "armeabi" "x86"; do
	if [ "$ABI" = "x86" ]; then
		ARCH="x86"
		TOOLCHAIN=`echo $NDK/toolchains/x86-4.9/prebuilt/*-x86*`
	else
		ARCH="arm"
		TOOLCHAIN=`echo $NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/*-x86*`
	fi 
	SYSROOT=$NDK/platforms/android-9/arch-$ARCH
	# Expand the prebuilt/* path into the correct one
	export PATH=$TOOLCHAIN/bin:$PATH
	
	FLAGS="--target-os=linux --arch=$ARCH"
	FLAGS="$FLAGS --sysroot=$SYSROOT"
	FLAGS="$FLAGS --enable-shared --disable-static --disable-doc --disable-ffmpeg --disable-ffplay --disable-ffprobe --disable-ffserver --disable-symver --disable-programs --disable-debug --enable-cross-compile --enable-optimizations --enable-small --enable-pic"
	if [ "$ARCH" = "arm" ]; then
		FLAGS="$FLAGS --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- --cpu=armv7-a"
	else
		FLAGS="$FLAGS --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- --disable-asm"
	fi

	EXTRA_CFLAGS="-I$DEST/$ABI/include"
	EXTRA_CFLAGS="$EXTRA_CFLAGS -I$NDK/sources/cxx-stl/gnu-libstdc++/4.9/include -I$NDK/sources/cxx-stl/gnu-libstdc++/4.9/libs/$ABI/include"
	if [ "$ARCH" = "arm" ]; then
		EXTRA_CFLAGS="$EXTRA_CFLAGS -march=armv7-a -mfloat-abi=softfp -mfpu=neon"
	fi
	FLAGS="$FLAGS --prefix=$DEST/$ABI"
	
	mkdir -p $DEST/$ABI
	mkdir -p $OBJS/$ABI

	echo $FLAGS --extra-cflags="$EXTRA_CFLAGS" --extra-ldflags="$EXTRA_LDFLAGS" --extra-cxxflags="$EXTRA_CXXFLAGS" > $DEST/$ABI/info.txt
	echo "Configuring ..."
	cd $OBJS/$ABI
	$ROOT_DIR/configure $FLAGS --extra-cflags="$EXTRA_CFLAGS" --extra-ldflags="$EXTRA_LDFLAGS" --extra-cxxflags="$EXTRA_CXXFLAGS" | tee $DEST/$ABI/configuration.txt
	[ $PIPESTATUS == 0 ] || exit 1
	echo "Making ..."
	#make clean
	make -j4 || exit 1
	make install || exit 1
done

cd $BASEPATH
