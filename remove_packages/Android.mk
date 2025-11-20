LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := x6a_remove_packages

LOCAL_OVERRIDES_PACKAGES := \
    messaging \
    ExactCalculator \
    Email \
    Exchange2 \
    com.android.emailcommon \
    Calendar \
    CarrierDefaultApp \
    SimAppDialog \
    WAPPushManager \
    SecureElement \
    BlockedNumberProvider \
    CallLogBackup

LOCAL_MODULE_TAGS := optional
include $(BUILD_PHONY_PACKAGE)

