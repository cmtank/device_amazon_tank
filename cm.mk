# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tv.mk)

# Inherit device configuration for Fire TV Stick 2
$(call inherit-product, device/amazon/tank/full_tank.mk)

# Screen Resolution
TARGET_SCREEN_WIDTH := 600
TARGET_SCREEN_HEIGHT := 1024

# Device identifier
PRODUCT_DEVICE := tank
PRODUCT_NAME := cm_tank
PRODUCT_BRAND := google
PRODUCT_MODEL := tank
PRODUCT_MANUFACTURER := amzn

# Override the fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=NVIDIA/foster_e/foster:5.1/LMY47D/35739_609.6420:user/release-keys \
    PRIVATE_BUILD_DESC="foster_e-user 5.1 LMY47D 35739_609.6420 release-keys"

