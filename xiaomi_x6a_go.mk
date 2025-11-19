$(call inherit-product, build/target/product/go_defaults.mk)
$(call inherit-product, $(LOCAL_PATH)/vendor_prop.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.characteristics=default,lowram
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

TARGET_BOOT_ANIMATION_RES := 480

PRODUCT_NAME := xiaomi_x6a
PRODUCT_DEVICE := x6a_a64_ab
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi Smart Home Display 6
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_PACKAGES +=
