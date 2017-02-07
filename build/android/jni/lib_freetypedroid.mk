# this is now the default FreeType build for Android
#
ifndef USE_FREETYPE
USE_FREETYPE := 2.3.12
endif

ifeq ($(USE_FREETYPE),2.3.12)
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# compile in ARM mode, since the glyph loader/renderer is a hotspot
# when loading complex pages in the browser
#
LOCAL_ARM_MODE := arm
TARGET_PLATFORM := android-4


LIBFT2_PATH := ../../../freetype
LOCAL_C_INCLUDES := $(LIBFT2_PATH)/builds $(LIBFT2_PATH)/include $(LIBFT2_PATH)/config

LOCAL_SRC_FILES:= \
	$(LIBFT2_PATH)/src/base/ftbbox.c \
	$(LIBFT2_PATH)/src/base/ftbitmap.c \
	$(LIBFT2_PATH)/src/base/ftglyph.c \
	$(LIBFT2_PATH)/src/base/ftstroke.c \
	$(LIBFT2_PATH)/src/base/ftxf86.c \
	$(LIBFT2_PATH)/src/base/ftbase.c \
	$(LIBFT2_PATH)/src/base/ftsystem.c \
	$(LIBFT2_PATH)/src/base/ftinit.c \
	$(LIBFT2_PATH)/src/base/ftgasp.c \
	$(LIBFT2_PATH)/src/raster/raster.c \
	$(LIBFT2_PATH)/src/sfnt/sfnt.c \
	$(LIBFT2_PATH)/src/smooth/smooth.c \
	$(LIBFT2_PATH)/src/autofit/autofit.c \
	$(LIBFT2_PATH)/src/truetype/truetype.c \
	$(LIBFT2_PATH)/src/cff/cff.c \
	$(LIBFT2_PATH)/src/psnames/psnames.c \
	$(LIBFT2_PATH)/src/pshinter/pshinter.c


LOCAL_CFLAGS += -W -Wall
LOCAL_CFLAGS += -fPIC -DPIC -DANDROID
LOCAL_CFLAGS += "-DDARWIN_NO_CARBON"
LOCAL_CFLAGS += "-DFT2_BUILD_LIBRARY"

# enable the FreeType internal memory debugger in the simulator
# you need to define the FT2_DEBUG_MEMORY environment variable
# when running the program to activate it. It will dump memory
# statistics when FT_Done_FreeType is called
#
ifeq ($(TARGET_SIMULATOR),true)
LOCAL_CFLAGS += "-DFT_DEBUG_MEMORY"
endif

# the following is for testing only, and should not be used in final builds
# of the product
#LOCAL_CFLAGS += "-DTT_CONFIG_OPTION_BYTECODE_INTERPRETER"

LOCAL_CFLAGS += -O2

LOCAL_MODULE:= libft2

#include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)
endif
