LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm
TARGET_PLATFORM := android-4

LOCAL_MODULE:= libjpegdroid

LIBJEG_PATH := ../../../libjpg

LOCAL_C_INCLUDES := $(LIBJEG_PATH)

LOCAL_SRC_FILES := \
	$(LIBJEG_PATH)/jcapimin.c \
	$(LIBJEG_PATH)/jcapistd.c \
	$(LIBJEG_PATH)/jccoefct.c \
	$(LIBJEG_PATH)/jccolor.c \
	$(LIBJEG_PATH)/jcdctmgr.c \
	$(LIBJEG_PATH)/jchuff.c \
	$(LIBJEG_PATH)/jcinit.c \
	$(LIBJEG_PATH)/jcmainct.c \
	$(LIBJEG_PATH)/jcmarker.c \
	$(LIBJEG_PATH)/jcmaster.c \
	$(LIBJEG_PATH)/jcomapi.c \
	$(LIBJEG_PATH)/jcparam.c \
	$(LIBJEG_PATH)/jcphuff.c \
	$(LIBJEG_PATH)/jcprepct.c \
	$(LIBJEG_PATH)/jcsample.c \
	$(LIBJEG_PATH)/jctrans.c \
	$(LIBJEG_PATH)/jdapimin.c \
	$(LIBJEG_PATH)/jdapistd.c \
	$(LIBJEG_PATH)/jdatadst.c \
	$(LIBJEG_PATH)/jdatasrc.c \
	$(LIBJEG_PATH)/jdcoefct.c \
	$(LIBJEG_PATH)/jdcolor.c \
	$(LIBJEG_PATH)/jddctmgr.c \
	$(LIBJEG_PATH)/jdhuff.c \
	$(LIBJEG_PATH)/jdinput.c \
	$(LIBJEG_PATH)/jdmainct.c \
	$(LIBJEG_PATH)/jdmarker.c \
	$(LIBJEG_PATH)/jdmaster.c \
	$(LIBJEG_PATH)/jdmerge.c \
	$(LIBJEG_PATH)/jdphuff.c \
	$(LIBJEG_PATH)/jdpostct.c \
	$(LIBJEG_PATH)/jdsample.c \
	$(LIBJEG_PATH)/jdtrans.c \
	$(LIBJEG_PATH)/jerror.c \
	$(LIBJEG_PATH)/jfdctflt.c \
	$(LIBJEG_PATH)/jfdctint.c \
	$(LIBJEG_PATH)/jidctflt.c \
	$(LIBJEG_PATH)/jidctred.c \
	$(LIBJEG_PATH)/jquant1.c \
	$(LIBJEG_PATH)/jquant2.c \
	$(LIBJEG_PATH)/jutils.c \
	$(LIBJEG_PATH)/jmemmgr.c \
	jpegdroid/jmem-android.c \
	$(LIBJEG_PATH)/jfdctfst.c

# the assembler is only for the ARM version, don't break the Linux sim
ifneq ($(TARGET_ARCH),arm)
ANDROID_JPEG_NO_ASSEMBLER := true
endif

# temp fix until we understand why this broke cnn.com
#ANDROID_JPEG_NO_ASSEMBLER := true

ifeq ($(strip $(ANDROID_JPEG_NO_ASSEMBLER)),true)
LOCAL_SRC_FILES += $(LIBJEG_PATH)/jidctint.c $(LIBJEG_PATH)/jidctfst.c
else
LOCAL_SRC_FILES += $(LIBJEG_PATH)/jidctint.c jpegdroid/jidctfst.S
endif

LOCAL_CFLAGS += -DAVOID_TABLES
LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays
#LOCAL_CFLAGS += -march=armv6j



include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_STATIC_LIBRARY)
