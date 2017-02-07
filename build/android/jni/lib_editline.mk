LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE		:= editline
#LOCAL_CFLAGS    	:= -Werror
TARGET_PLATFORM		:= android-4

LOCAL_SRC_FILES := ../../../js/editline/editline.c ../../../js/editline/sysunix.c

LOCAL_CFLAGS += -DHAVE_STDLIB
LOCAL_CFLAGS += -DSYS_UNIX
LOCAL_CFLAGS += -DHAVE_TCGETATTR
LOCAL_CFLAGS += -DUSE_DIRENT


#ref: Makefile.ref


#include $(BUILD_EXECUTABLE)
include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_STATIC_LIBRARY)

