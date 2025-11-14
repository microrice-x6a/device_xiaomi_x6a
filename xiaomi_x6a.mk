include build/make/target/product/treble_common.mk
$(call inherit-product, vendor/vndk/vndk32.mk)
$(call inherit-product, device/xiaomi/x6a/base.mk)
$(call inherit-product, device/xiaomi/x6a/lineage.mk)

PRODUCT_NAME := xiaomi_x6a
PRODUCT_DEVICE := x6a_a64_ab
PRODUCT_BRAND := Android
PRODUCT_MODEL := Xiao Mi X6A

PRODUCT_PACKAGES += 
