LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE		:= libopenjpeg
#LOCAL_CFLAGS    	:= -Werror
TARGET_PLATFORM		:= android-4
LIBOPENJPEG_PATH 	:= ../../../OpenJPEG/
LOCAL_C_INCLUDES 	:= $(LOCAL_PATH)/../../../OpenJPEG/libopenjpeg



LOCAL_SRC_FILES := $(LIBOPENJPEG_PATH)/libopenjpeg/bio.c $(LIBOPENJPEG_PATH)/libopenjpeg/cio.c $(LIBOPENJPEG_PATH)/libopenjpeg/dwt.c $(LIBOPENJPEG_PATH)/libopenjpeg/event.c $(LIBOPENJPEG_PATH)/libopenjpeg/image.c $(LIBOPENJPEG_PATH)/libopenjpeg/j2k.c $(LIBOPENJPEG_PATH)/libopenjpeg/j2k_lib.c $(LIBOPENJPEG_PATH)/libopenjpeg/jp2.c $(LIBOPENJPEG_PATH)/libopenjpeg/jpt.c $(LIBOPENJPEG_PATH)/libopenjpeg/mct.c $(LIBOPENJPEG_PATH)/libopenjpeg/mqc.c $(LIBOPENJPEG_PATH)/libopenjpeg/openjpeg.c $(LIBOPENJPEG_PATH)/libopenjpeg/pi.c $(LIBOPENJPEG_PATH)/libopenjpeg/raw.c $(LIBOPENJPEG_PATH)/libopenjpeg/t1.c $(LIBOPENJPEG_PATH)/libopenjpeg/t2.c $(LIBOPENJPEG_PATH)/libopenjpeg/tcd.c $(LIBOPENJPEG_PATH)/libopenjpeg/tgt.c




include $(BUILD_SHARED_LIBRARY)

