LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE	:= libfaad_static
LIBFAAD_PATH := ../../../faad2

LOCAL_C_INCLUDES := $(LIBFAAD_PATH)/include $(LIBFAAD_PATH)/libfaad $(LOCAL_PATH)/faad

STATIC_LIBFAAD_SRC_FILES := \
	$(LIBFAAD_PATH)/libfaad/bits.c \
	$(LIBFAAD_PATH)/libfaad/cfft.c \
	$(LIBFAAD_PATH)/libfaad/decoder.c \
	$(LIBFAAD_PATH)/libfaad/drc.c \
	$(LIBFAAD_PATH)/libfaad/drm_dec.c \
	$(LIBFAAD_PATH)/libfaad/error.c \
	$(LIBFAAD_PATH)/libfaad/filtbank.c \
	$(LIBFAAD_PATH)/libfaad/ic_predict.c \
	$(LIBFAAD_PATH)/libfaad/is.c \
	$(LIBFAAD_PATH)/libfaad/lt_predict.c \
	$(LIBFAAD_PATH)/libfaad/mdct.c \
	$(LIBFAAD_PATH)/libfaad/mp4.c \
	$(LIBFAAD_PATH)/libfaad/ms.c \
	$(LIBFAAD_PATH)/libfaad/output.c \
	$(LIBFAAD_PATH)/libfaad/pns.c \
	$(LIBFAAD_PATH)/libfaad/ps_dec.c \
	$(LIBFAAD_PATH)/libfaad/ps_syntax.c \
	$(LIBFAAD_PATH)/libfaad/pulse.c \
	$(LIBFAAD_PATH)/libfaad/specrec.c \
	$(LIBFAAD_PATH)/libfaad/syntax.c \
	$(LIBFAAD_PATH)/libfaad/tns.c \
	$(LIBFAAD_PATH)/libfaad/hcr.c \
	$(LIBFAAD_PATH)/libfaad/huffman.c \
	$(LIBFAAD_PATH)/libfaad/rvlc.c \
	$(LIBFAAD_PATH)/libfaad/ssr.c \
	$(LIBFAAD_PATH)/libfaad/ssr_fb.c \
	$(LIBFAAD_PATH)/libfaad/ssr_ipqf.c \
	$(LIBFAAD_PATH)/libfaad/common.c \
	$(LIBFAAD_PATH)/libfaad/sbr_dct.c \
	$(LIBFAAD_PATH)/libfaad/sbr_e_nf.c \
	$(LIBFAAD_PATH)/libfaad/sbr_fbt.c \
	$(LIBFAAD_PATH)/libfaad/sbr_hfadj.c \
	$(LIBFAAD_PATH)/libfaad/sbr_hfgen.c \
	$(LIBFAAD_PATH)/libfaad/sbr_huff.c \
	$(LIBFAAD_PATH)/libfaad/sbr_qmf.c \
	$(LIBFAAD_PATH)/libfaad/sbr_syntax.c \
	$(LIBFAAD_PATH)/libfaad/sbr_tf_grid.c \
	$(LIBFAAD_PATH)/libfaad/sbr_dec.c \

LOCAL_SRC_FILES := $(STATIC_LIBFAAD_SRC_FILES)

LOCAL_CFLAGS += -DANDROID -DPIC


include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= libfaad

LOCAL_C_INCLUDES := $(LIBFAAD_PATH)/include $(LIBFAAD_PATH)/libfaad $(LOCAL_PATH)/faad
LOCAL_STATIC_LIBRARIES := libfaad_static 
SHARED_LIBFAAD_SRC_FILES := \
	$(LIBFAAD_PATH)/libfaad/bits.c \
	$(LIBFAAD_PATH)/libfaad/cfft.c \
	$(LIBFAAD_PATH)/libfaad/decoder.c \
	$(LIBFAAD_PATH)/libfaad/drc.c \
	$(LIBFAAD_PATH)/libfaad/drm_dec.c \
	$(LIBFAAD_PATH)/libfaad/error.c \
	$(LIBFAAD_PATH)/libfaad/filtbank.c \
	$(LIBFAAD_PATH)/libfaad/ic_predict.c \
	$(LIBFAAD_PATH)/libfaad/is.c \
	$(LIBFAAD_PATH)/libfaad/lt_predict.c \
	$(LIBFAAD_PATH)/libfaad/mdct.c \
	$(LIBFAAD_PATH)/libfaad/mp4.c \
	$(LIBFAAD_PATH)/libfaad/ms.c \
	$(LIBFAAD_PATH)/libfaad/output.c \
	$(LIBFAAD_PATH)/libfaad/pns.c \
	$(LIBFAAD_PATH)/libfaad/ps_dec.c \
	$(LIBFAAD_PATH)/libfaad/ps_syntax.c \
	$(LIBFAAD_PATH)/libfaad/pulse.c \
	$(LIBFAAD_PATH)/libfaad/specrec.c \
	$(LIBFAAD_PATH)/libfaad/syntax.c \
	$(LIBFAAD_PATH)/libfaad/tns.c \
	$(LIBFAAD_PATH)/libfaad/hcr.c \
	$(LIBFAAD_PATH)/libfaad/huffman.c \
	$(LIBFAAD_PATH)/libfaad/rvlc.c \
	$(LIBFAAD_PATH)/libfaad/ssr.c \
	$(LIBFAAD_PATH)/libfaad/ssr_fb.c \
	$(LIBFAAD_PATH)/libfaad/ssr_ipqf.c \
	$(LIBFAAD_PATH)/libfaad/common.c \
	$(LIBFAAD_PATH)/libfaad/sbr_dct.c \
	$(LIBFAAD_PATH)/libfaad/sbr_e_nf.c \
	$(LIBFAAD_PATH)/libfaad/sbr_fbt.c \
	$(LIBFAAD_PATH)/libfaad/sbr_hfadj.c \
	$(LIBFAAD_PATH)/libfaad/sbr_hfgen.c \
	$(LIBFAAD_PATH)/libfaad/sbr_huff.c \
	$(LIBFAAD_PATH)/libfaad/sbr_qmf.c \
	$(LIBFAAD_PATH)/libfaad/sbr_syntax.c \
	$(LIBFAAD_PATH)/libfaad/sbr_tf_grid.c \
	$(LIBFAAD_PATH)/libfaad/sbr_dec.c \

LOCAL_SRC_FILES := $(SHARED_LIBFAAD_SRC_FILES)

LOCAL_CFLAGS += -DANDROID -DPIC


include $(BUILD_SHARED_LIBRARY)


