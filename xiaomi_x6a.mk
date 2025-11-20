
include build/make/target/product/treble_common.mk
$(call inherit-product, vendor/vndk/vndk32.mk)
$(call inherit-product, $(LOCAL_PATH)/base.mk)

$(call inherit-product, $(LOCAL_PATH)/lineage.mk)
$(call inherit-product, $(LOCAL_PATH)/vendor_prop.mk)

PRODUCT_PACKAGES += \
    x6a-preinstall \
    x6a_preinstall_localsend \
    x6a_preinstall_lawnchair

PRODUCT_PACKAGES += \


PRODUCT_COPY_FILES += \
	device/xiaomi/x6a/init.x6a.rc:system/etc/init/init.x6a.rc

TARGET_BOOT_ANIMATION_RES := 480

PRODUCT_NAME := xiaomi_x6a
PRODUCT_DEVICE := x6a_a64_ab
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi Smart Home Display 6
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_PACKAGES += 
