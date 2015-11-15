# Inherit from those products. Most specific first.
$(call inherit-product, device/amazon/ford/device.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)


PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_NAME := full_ford
PRODUCT_DEVICE := ford
PRODUCT_BRAND := google
PRODUCT_MODEL := Fire
PRODUCT_MANUFACTURER := amzn
