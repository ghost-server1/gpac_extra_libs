LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# measurements show that the ARM version of ZLib is about x1.17 faster
# than the thumb one...
LOCAL_ARM_MODE := arm
TARGET_PLATFORM		:= android-4

#LOCAL_C_INCLUDES 	:= $(LOCAL_PATH)/../../../zlib/

ZLIB_DIR := ../../../zlib/

zlib_files := \
	$(ZLIB_DIR)/adler32.c \
	$(ZLIB_DIR)/compress.c \
	$(ZLIB_DIR)/crc32.c \
	$(ZLIB_DIR)/gzio.c \
	$(ZLIB_DIR)/uncompr.c \
	$(ZLIB_DIR)/deflate.c \
	$(ZLIB_DIR)/trees.c \
	$(ZLIB_DIR)/zutil.c \
	$(ZLIB_DIR)/inflate.c \
	$(ZLIB_DIR)/infback.c \
	$(ZLIB_DIR)/inftrees.c \
	$(ZLIB_DIR)/inffast.c


LOCAL_MODULE := libz
LOCAL_CFLAGS += -O3 -DUSE_MMAP
LOCAL_SRC_FILES := $(zlib_files)

include $(BUILD_SHARED_LIBRARY)


#include $(CLEAR_VARS)

#LOCAL_ARM_MODE := arm
#LOCAL_MODULE := libz
#LOCAL_CFLAGS += -O3 -DUSE_MMAP
#LOCAL_SRC_FILES := $(zlib_files)
#include $(BUILD_STATIC_LIBRARY)

