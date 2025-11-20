
include build/make/target/product/treble_common.mk
$(call inherit-product, vendor/vndk/vndk32.mk)
$(call inherit-product, $(LOCAL_PATH)/base.mk)

$(call inherit-product, $(LOCAL_PATH)/lineage.mk)
$(call inherit-product, $(LOCAL_PATH)/vendor_prop.mk)

TARGET_BOOT_ANIMATION_RES := 480

PRODUCT_NAME := xiaomi_x6a
PRODUCT_DEVICE := x6a_a64_ab
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi Smart Home Display 6
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_PACKAGES += 
