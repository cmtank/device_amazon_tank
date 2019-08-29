LOCAL_PATH := device/amazon/tank

ifeq ($(TARGET_PREBUILT_KERNEL),)
        LOCAL_KERNEL := $(LOCAL_PATH)/boot.img
else
        LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif


PRODUCT_IS_ATV_SDK := true

PRODUCT_PACKAGES := \
    EmulatorSmokeTests \
    LeanbackSampleApp

$(call inherit-product, device/google/atv/products/atv_base.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/google/atv/sdk_overlay \
    development/sdk_overlay

# Include drawables for various densities.
PRODUCT_AAPT_CONFIG := normal large xlarge tvdpi hdpi xhdpi xxhdpi

# Add TV skins to SDK, in addition to (not replacing) original SDK tree
PRODUCT_SDK_ATREE_FILES := \
    development/build/sdk.atree \
    device/google/atv/sdk/atv_sdk.atree

# Define the host tools and libs that are parts of the SDK.
#-include sdk/build/product_sdk.mk
#-include development/build/product_sdk.mk

#include $(SRC_TARGET_DIR)/product/emulator.

PRODUCT_COPY_FILES += \
        $(LOCAL_KERNEL):kernel

LOCAL_SHARED_LIBRARIES:= libtinycompress

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += device/amazon/tank/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device uses high-density artwork where available
#PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

#init.d script
PRODUCT_COPY_FILES += \
		      device/amazon/tank/init.d/init.fosflags.sh:system/etc/init.fosflags.sh

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Config files
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/amazon/tank/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/amazon/tank/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/amazon/tank/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg

# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf \
     $(LOCAL_PATH)/configs/thermal.policy.conf:system/etc/.tp/thermal.policy.conf \
     $(LOCAL_PATH)/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc \
     $(LOCAL_PATH)/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	libtinycompress
    
# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default
	
# Power
PRODUCT_PACKAGES += \
	power.default

# network
PRODUCT_PACKAGES += \
    netd
    
# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# root access
PRODUCT_PACKAGES += \
	su
# Shims	
PRODUCT_PACKAGES += \
        libshim_asp \

WITH_EXFAT := true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/amazon/tank/tank-vendor.mk)
