LOCAL_PATH:= $(call my-dir)

include $(LOCAL_PATH)/lib_zlibdroid.mk
include $(LOCAL_PATH)/lib_editline.mk
include $(LOCAL_PATH)/lib_faad.mk
include $(LOCAL_PATH)/lib_ffmpeg.mk
include $(LOCAL_PATH)/lib_freetypedroid.mk
include $(LOCAL_PATH)/lib_jpegdroid.mk
include $(LOCAL_PATH)/lib_js.mk
include $(LOCAL_PATH)/lib_mad.mk
include $(LOCAL_PATH)/lib_openjpeg.mk
include $(LOCAL_PATH)/lib_pngdroid.mk
#uncomment this line if you need support stagefright
#include $(LOCAL_PATH)/lib_ffmpeg_stagefright.mk


