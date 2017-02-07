LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS) 
LOCAL_MODULE:= libavcodec_stagefright
LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/lib/libavcodec_stagefright.so 
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/include 
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS) 
LOCAL_MODULE:= libavformat_stagefright 
LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/lib/libavformat_stagefright.so 
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/include 
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS) 
LOCAL_MODULE:= libswscale_stagefright 
LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/lib/libswscale_stagefright.so 
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/include
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS) 
LOCAL_MODULE:= libavutil_stagefright 
LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/lib/libavutil_stagefright.so 
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/include
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS) 
LOCAL_MODULE:= libavfilter_stagefright 
LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/lib/libavfilter_stagefright.so 
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/include
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS) 
LOCAL_MODULE:= libwsresample_stagefright 
LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/lib/libswresample_stagefright.so 
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg_libstagefright/$(TARGET_ARCH_ABI)/include
include $(PREBUILT_SHARED_LIBRARY)
