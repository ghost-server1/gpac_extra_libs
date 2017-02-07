LOCAL_PATH:= $(call my-dir)

# We need to build this for both the device (as a shared library)
# and the host (as a static library for tools to use).

common_C_INCLUDES += $(LOCAL_PATH)/../../../zlib
common_C_INCLUDES += $(LOCAL_PATH)/../../../libpng
LIBPNG_PATH := ../../../libpng

common_SRC_FILES := \
	$(LIBPNG_PATH)/png.c \
	$(LIBPNG_PATH)/pngerror.c \
	$(LIBPNG_PATH)/pnggccrd.c \
	$(LIBPNG_PATH)/pngget.c \
	$(LIBPNG_PATH)/pngmem.c \
	$(LIBPNG_PATH)/pngpread.c \
	$(LIBPNG_PATH)/pngread.c \
	$(LIBPNG_PATH)/pngrio.c \
	$(LIBPNG_PATH)/pngrtran.c \
	$(LIBPNG_PATH)/pngrutil.c \
	$(LIBPNG_PATH)/pngset.c \
	$(LIBPNG_PATH)/pngtrans.c \
	$(LIBPNG_PATH)/pngvcrd.c \
	$(LIBPNG_PATH)/pngwio.c \
	$(LIBPNG_PATH)/pngwrite.c \
	$(LIBPNG_PATH)/pngwtran.c \
	$(LIBPNG_PATH)/pngwutil.c

common_CFLAGS := ## -fomit-frame-pointer


common_COPY_HEADERS_TO := libpng
common_COPY_HEADERS := png.h pngconf.h pngusr.h

# For the host
# =====================================================

#include $(CLEAR_VARS)

#LOCAL_SRC_FILES := $(common_SRC_FILES)
#LOCAL_CFLAGS += $(common_CFLAGS)
#LOCAL_C_INCLUDES += $(common_C_INCLUDES) external/zlib

#LOCAL_MODULE:= libpng

#LOCAL_COPY_HEADERS_TO := $(common_COPY_HEADERS_TO)
#LOCAL_COPY_HEADERS := $(common_COPY_HEADERS)

#include $(BUILD_HOST_STATIC_LIBRARY)


# For the device
# =====================================================

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(common_SRC_FILES)
LOCAL_CFLAGS += $(common_CFLAGS)
LOCAL_C_INCLUDES += $(common_C_INCLUDES) \
LOCAL_C_INCLUDES += $(common_C_INCLUDES) external/zlib
common_C_INCLUDES += $(LOCAL_PATH)/../../../zlib

LOCAL_LDLIBS    += -lz

LOCAL_SHARED_LIBRARIES := libz
TARGET_PLATFORM		:= android-4
LOCAL_MODULE:= libpng

LOCAL_COPY_HEADERS_TO := $(common_COPY_HEADERS_TO)
LOCAL_COPY_HEADERS := $(common_COPY_HEADERS)

#include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)


