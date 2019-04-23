# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit device configuration for full ford
$(call inherit-product, device/amazon/ford/device.mk)

# Inherit common Lineage
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_CHARACTERISTICS := tablet

TARGET_SCREEN_WIDTH := 600
TARGET_SCREEN_HEIGHT := 1024

PRODUCT_DEVICE := ford
PRODUCT_NAME := cm_ford
PRODUCT_BRAND := google
PRODUCT_MODEL := Fire
PRODUCT_MANUFACTURER := amzn
