LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LIBMAD_PATH := ../../../libmad
LOCAL_C_INCLUDES 	:= $(LOCAL_PATH)/../../../libmad $(LOCAL_PATH)/libmad

LOCAL_MODULE		:= libmad
#LOCAL_CFLAGS    	:= -Werror
TARGET_PLATFORM		:= android-4
LOCAL_ARM_MODE		:= arm


LOCAL_SRC_FILES :=  $(LIBMAD_PATH)/version.c $(LIBMAD_PATH)/fixed.c $(LIBMAD_PATH)/bit.c $(LIBMAD_PATH)/timer.c $(LIBMAD_PATH)/stream.c $(LIBMAD_PATH)/frame.c $(LIBMAD_PATH)/synth.c $(LIBMAD_PATH)/decoder.c $(LIBMAD_PATH)/layer12.c $(LIBMAD_PATH)/layer3.c $(LIBMAD_PATH)/huffman.c
#LOCAL_SRC_FILES += D.dat imdct_s.dat qc_table.dat rq_table.dat sf_table.dat

LOCAL_CFLAGS += -DHAVE_CONFIG_H
#LOCAL_CFLAGS += -DFPM_ARM
#LOCAL_CFLAGS += -ffast-math
LOCAL_CFLAGS += -O3
LOCAL_CFLAGS += -DFPM_DEFAULT

include $(BUILD_SHARED_LIBRARY)
