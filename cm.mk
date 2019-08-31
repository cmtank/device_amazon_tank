# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tv.mk)

# Include CM LatinIME dictionaries
#PRODUCT_PACKAGE_OVERLAYS += vendor/cm/overlay/dictionaries

# Inherit device configuration for Fire TV Stick
$(call inherit-product, device/amazon/tank/full_tank.mk)

TARGET_SCREEN_WIDTH := 600
TARGET_SCREEN_HEIGHT := 1024

PRODUCT_DEVICE := tank
PRODUCT_NAME := cm_tank
#PRODUCT_RELEASE_NAME := tank
PRODUCT_BRAND := google
PRODUCT_MODEL := tank
PRODUCT_MANUFACTURER := amzn

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_tank-user 5.1.1 LVY48F 288.6.3.9_user_639566220 release-keys"

BUILD_FINGERPRINT := Amazon/full_tank/tank:5.1.1/LVY48F/288.6.3.9_user_639566220:user/release-keys

