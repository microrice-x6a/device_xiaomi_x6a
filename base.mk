#Huawei devices don't declare fingerprint and telephony hardware feature
#TODO: Proper detection
PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \


BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/phh/treble/sepolicy
DEVICE_PACKAGE_OVERLAYS += \
	device/phh/treble/overlay \
	device/phh/treble/overlay-lineage

$(call inherit-product, vendor/hardware_overlay/overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

#Those overrides are here because Huawei's init read properties
#from /system/etc/prop.default, then /vendor/build.prop, then /system/build.prop
#So we need to set our props in prop.default
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
	ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
	ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
	ro.build.version.release=$(PLATFORM_VERSION) \
	ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH) \
	ro.adb.secure=0 \
	ro.logd.auditd=true
	
#Huawei HiSuite (also other OEM custom programs I guess) it's of no use in AOSP builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	persist.sys.usb.config=adb \
	ro.cust.cdrom=/dev/null	

#VNDK config files
PRODUCT_COPY_FILES += \
	device/phh/treble/vndk-detect:system/bin/vndk-detect \
	device/phh/treble/vndk.rc:system/etc/init/vndk.rc \
	device/phh/treble/ld.config.26.txt:system/etc/ld.config.26.txt \

#USB Audio
PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
	device/phh/treble/rw-system.sh:system/bin/rw-system.sh \
	device/phh/treble/phh-prop-handler.sh:system/bin/phh-prop-handler.sh \
	device/phh/treble/fixSPL/getSPL.arm:system/bin/getSPL

PRODUCT_COPY_FILES += \
	device/phh/treble/empty:system/phh/empty \
	device/phh/treble/phh-on-boot.sh:system/bin/phh-on-boot.sh

PRODUCT_PACKAGES += \
	treble-environ-rc

PRODUCT_PACKAGES += \
	bootctl \
	vintf

PRODUCT_COPY_FILES += \
	device/phh/treble/twrp/twrp.rc:system/etc/init/twrp.rc \
	device/phh/treble/twrp/twrp.sh:system/bin/twrp.sh \
	device/phh/treble/twrp/busybox-armv7l:system/bin/busybox_phh

PRODUCT_PACKAGES += \
    simg2img_simple

ifneq (,$(wildcard external/exfat))
PRODUCT_PACKAGES += \
	mkfs.exfat \
	fsck.exfat
endif

PRODUCT_PACKAGES += \
	android.hardware.wifi.hostapd-V1.0-java

PRODUCT_COPY_FILES += \
	device/phh/treble/interfaces.xml:system/etc/permissions/interfaces.xml

SELINUX_IGNORE_NEVERALLOWS := true

PRODUCT_PACKAGES += \
    uevent

PRODUCT_COPY_FILES += \
	device/phh/treble/files/adbd.rc:system/etc/init/adbd.rc

PRODUCT_PACKAGES += \
	resetprop
PRODUCT_COPY_FILES += \
	device/phh/treble/phh-securize.sh:system/bin/phh-securize.sh \

# Privapp-permissions whitelist for PhhTrebleApp
PRODUCT_COPY_FILES += \
	device/phh/treble/privapp-permissions-me.phh.treble.app.xml:system/etc/permissions/privapp-permissions-me.phh.treble.app.xml
