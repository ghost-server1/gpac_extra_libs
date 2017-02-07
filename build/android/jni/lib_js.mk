LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE		:= libjs_osmo
#LOCAL_CFLAGS    	:= -Werror
TARGET_PLATFORM		:= android-4
LIBJS_PATH := ../../../js
LOCAL_C_INCLUDES 	:= $(LIBJS_PATH) $(LIBJS_PATH)/editline/ $(LOCAL_PATH)/js/ 


LOCAL_SHARED_LIBRARIES := libeditline

LOCAL_SRC_FILES :=	\
	$(LIBJS_PATH)/jsapi.c		\
	$(LIBJS_PATH)/jsarena.c	\
	$(LIBJS_PATH)/jsarray.c	\
	$(LIBJS_PATH)/jsatom.c	\
	$(LIBJS_PATH)/jsbool.c	\
	$(LIBJS_PATH)/jscntxt.c	\
	$(LIBJS_PATH)/jsdate.c	\
	$(LIBJS_PATH)/jsdbgapi.c	\
	$(LIBJS_PATH)/jsdhash.c	\
	$(LIBJS_PATH)/jsdtoa.c	\
	$(LIBJS_PATH)/jsemit.c	\
	$(LIBJS_PATH)/jsexn.c		\
	$(LIBJS_PATH)/jsfun.c		\
	$(LIBJS_PATH)/jsgc.c		\
	$(LIBJS_PATH)/jshash.c	\
	$(LIBJS_PATH)/jsinterp.c	\
	$(LIBJS_PATH)/jsiter.c	\
	$(LIBJS_PATH)/jslock.c	\
	$(LIBJS_PATH)/jslog2.c	\
	$(LIBJS_PATH)/jslong.c	\
	$(LIBJS_PATH)/jsmath.c	\
	$(LIBJS_PATH)/jsnum.c		\
	$(LIBJS_PATH)/jsobj.c		\
	$(LIBJS_PATH)/jsopcode.c      \
	$(LIBJS_PATH)/jsparse.c	\
	$(LIBJS_PATH)/jsprf.c		\
	$(LIBJS_PATH)/jsregexp.c	\
	$(LIBJS_PATH)/jsscan.c	\
	$(LIBJS_PATH)/jsscope.c	\
	$(LIBJS_PATH)/jsscript.c	\
	$(LIBJS_PATH)/jsstr.c		\
	$(LIBJS_PATH)/jsutil.c        \
	$(LIBJS_PATH)/jsxdrapi.c	\
	$(LIBJS_PATH)/jsxml.c		\
	$(LIBJS_PATH)/prmjtime.c	\
	$(LIBJS_PATH)/jsfile.c		
	

#LOCAL_SRC_FILES += js.c
#js/jsinvoke.c
LOCAL_CFLAGS += -DXP_UNIX



#include $(BUILD_EXECUTABLE)
include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_STATIC_LIBRARY)

