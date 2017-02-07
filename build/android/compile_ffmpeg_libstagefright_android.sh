#!/bin/bash

BASEPATH=$(pwd)
export NDK=$1
export DEST=$BASEPATH/jni/ffmpeg_libstagefright
cd ../../
if [ ! -d "ffmpeg-2.4.3" ]; then
	echo "Fetching FFMPEG 2.4.3"
	wget "http://ffmpeg.org/releases/ffmpeg-2.4.3.tar.bz2"
	tar xvf ffmpeg-2.4.3.tar.bz2
	rm -f ffmpeg-2.4.3.tar.bz2
fi
#overriding some files ...
rm -f ffmpeg-2.4.3/tools/config.h ffmpeg-2.4.3/tools/config.mak
cp -f $BASEPATH/ffmpeg_patch/build_libstagefright ffmpeg-2.4.3/tools/
cp -f $BASEPATH/ffmpeg_patch/configure ffmpeg-2.4.3
cp -f $BASEPATH/ffmpeg_patch/libstagefright.cpp ffmpeg-2.4.3/libavcodec

cd ffmpeg-2.4.3/tools/
chmod a+x build_libstagefright
./build_libstagefright || exit 1
for arch in armeabi armeabi-v7a x86; do
	for lib in libavcodec libavformat libswscale libavutil libavfilter libswresample; do
		mv $DEST/$arch/lib/"$lib".so $DEST/$arch/lib/"$lib"_stagefright.so
	done
done
cd $BASEPATH
