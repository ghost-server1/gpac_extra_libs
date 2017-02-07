#!/bin/sh

rm -rf $1/extra_lib/include/ios/
mkdir $1/extra_lib/include/ios/

mkdir -p $1/extra_lib/include/ios/SDL2/
cp SDL_iOS/SDL2/include/*.h $1/extra_lib/include/ios/SDL2/
cp SDL_iOS/glues/source/glues.h $1/extra_lib/include/ios/
mkdir -p $1/extra_lib/lib/iOS/
cp lib/iOS/*.a $1/extra_lib/lib/iOS/

#replace FFMPEG headers in gpac public
cp -r ffmpeg_ios/FFmpeg-iOS/include/* $1/extra_lib/include/ios/

#copy FFMPEG binaries
mkdir -p ./gpac_public/extra_lib/lib/iOS/
cp ffmpeg_ios/FFmpeg-iOS/lib/* $1/extra_lib/lib/iOS/

#copy SSL libraries
cp -r OpenSSL-for-iPhone/include/* $1/extra_lib/include/ios/
cp OpenSSL-for-iPhone/lib/*.a $1/extra_lib/lib/iOS/


cp $1/extra_lib/include/mad.h $1/extra_lib/include/ios/
cp $1/extra_lib/include/faad.h $1/extra_lib/include/ios/
cp $1/extra_lib/include/neaacdec.h $1/extra_lib/include/ios/
