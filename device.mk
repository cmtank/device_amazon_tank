LOCAL_PATH := device/amazon/ford

DEVICE_FOLDER := device/amazon/ford

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/amazon/ford/ford-vendor.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

# Install init.d scripts
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/configs/99exfat-support:system/etc/init.d/99exfat-support

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Ramdisk
PRODUCT_PACKAGES += \
    factory_init.project.rc \
    factory_init.rc \
    fstab.mt8127 \
    init.base.rc \
    init.build.rc \
    init.charging.rc \
	init.mt8127.rc \
	init.mt8127.usb.rc \
	init.project.rc \
    init.rc.ufsd \
    init.recovery.mt8127.rc \
    init.ssd.rc \
    meta_init.project.rc \
    meta_init.rc \
	ueventd.mt8127.rc \
    enableswap.sh

# Config files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVICE_FOLDER)/configs/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    $(DEVICE_FOLDER)/configs/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    $(DEVICE_FOLDER)/configs/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(DEVICE_FOLDER)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_FOLDER)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg


$(call inherit-product-if-exists, vendor/amazon/ford/ford-vendor.mk)

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default
    
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

WITH_EXFAT := true

DEVICE_PACKAGE_OVERLAYS += device/amazon/ford/overlay


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
