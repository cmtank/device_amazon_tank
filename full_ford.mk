# Inherit from those products. Most specific first.
$(call inherit-product, device/amazon/ford/device.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := full_ford
PRODUCT_DEVICE := ford
PRODUCT_BRAND := google
PRODUCT_MODEL := Fire
PRODUCT_MANUFACTURER := amzn
