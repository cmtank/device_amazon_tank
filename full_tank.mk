# ATV
PRODUCT_IS_ATV_SDK := true
PRODUCT_CHARACTERISTICS := tv,nosdcard

# Include drawables for various densities.
PRODUCT_AAPT_CONFIG := normal large xlarge tvdpi hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# include available languages for TTS in the system image
-include external/svox/pico/lang/PicoLangDeDeInSystem.mk
-include external/svox/pico/lang/PicoLangEnGBInSystem.mk
-include external/svox/pico/lang/PicoLangEnUsInSystem.mk
-include external/svox/pico/lang/PicoLangEsEsInSystem.mk
-include external/svox/pico/lang/PicoLangFrFrInSystem.mk
-include external/svox/pico/lang/PicoLangItItInSystem.mk

# CMLeanbackCustomizer
PRODUCT_PACKAGES += \
    CMLeanbackCustomizer

# Amazon btremoted
PRODUCT_PACKAGES += \
    btremoted

# From build/target/product/core_base.mk
PRODUCT_PACKAGES += \
    ContactsProvider \
    DefaultContainerService \
    UserDictionaryProvider \
    libaudiopreprocessing \
    libfilterpack_imageproc \
    libgabi++ \
    libkeystore \
    mdnsd \
    requestsync

# stagefright
PRODUCT_PACKAGES += \
    libstagefright.so \
    libstagefright_amrnb_common.so \
    libstagefright_avc_common.so \
    libstagefright_enc_common.so \
    libstagefright_foundation.so \
    libstagefright_hdcprx.so \
    libstagefright_http_support.so \
    libstagefright_httplive.so \
    libstagefright_omx.so \
    libstagefright_soft_aacdec.so \
    libstagefright_soft_aacenc.so \
    libstagefright_soft_amrdec.so \
    libstagefright_soft_amrnbenc.so \
    libstagefright_soft_amrwbenc.so \
    libstagefright_soft_flacenc.so \
    libstagefright_soft_g711dec.so \
    libstagefright_soft_gsmdec.so \
    libstagefright_soft_h264dec.so \
    libstagefright_soft_h264enc.so \
    libstagefright_soft_hevcdec.so \
    libstagefright_soft_mp3dec.so \
    libstagefright_soft_mpeg4dec.so \
    libstagefright_soft_mpeg4enc.so \
    libstagefright_soft_opusdec.so \
    libstagefright_soft_rawdec.so \
    libstagefright_soft_vorbisdec.so \
    libstagefright_soft_vpxdec.so \
    libstagefright_soft_vpxenc.so \
    libstagefright_wfd.so \
    libstagefright_yuv.so

# From build/target/product/core.mk
PRODUCT_PACKAGES += \
    BasicDreams \
    CalendarProvider \
    CertInstaller \
    ExternalStorageProvider \
    FusedLocation \
    InputDevices \
    KeyChain \
    Launcher2 \
    PicoTts \
    PacProcessor \
    PrintSpooler \
    ProxyHandler \
    SharedStorageBackup \
    VpnDialogs

# From build/target/product/generic_no_telephony.mk
PRODUCT_PACKAGES += \
    Bluetooth \
    SystemUI \
    librs_jni \
    audio.primary.default \
    audio_policy.default \
    clatd \
    clatd.conf \
    local_time.default \
    screenrecord   

# TV
PRODUCT_PACKAGES += \
    TvProvider \
    TvSettings \
    tv_input.default \
    LeanbackLauncher \
    LeanbackIme \
    Overscan

# Enable frame-exact AV sync
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.avsync=true

$(call inherit-product-if-exists, frameworks/base/data/sounds/AllAudio.mk)
$(call inherit-product-if-exists, external/svox/pico/lang/all_pico_languages.mk)
$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/dancing-script/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/carrois-gothic-sc/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/coming-soon/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/cutive-mono/fonts.mk)
$(call inherit-product-if-exists, external/lohit-fonts/fonts.mk)
$(call inherit-product-if-exists, external/noto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product-if-exists, frameworks/webview/chromium/chromium.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/amazon/tank/rootdir,root)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += device/amazon/tank/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    device/amazon/tank/permissions/tv_core_hardware.xml:system/etc/permissions/tv_core_hardware.xml \
    device/amazon/tank/permissions/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml

# Config files
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf \
    device/amazon/tank/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/amazon/tank/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/amazon/tank/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/amazon/tank/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg

# Keylayout
PRODUCT_COPY_FILES += \
    device/amazon/tank/keylayouts/Generic.kl:system/usr/keylayout/Generic.kl

# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf \
     $(LOCAL_PATH)/configs/thermal.policy.conf:system/etc/.tp/thermal.policy.conf \
     $(LOCAL_PATH)/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc \
     $(LOCAL_PATH)/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf

# Audio
PRODUCT_PACKAGES += \
    libtinycompress

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth.default

# Power
PRODUCT_PACKAGES += \
    power.default

# Network
PRODUCT_PACKAGES += \
    netd

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# RemovePackages
PRODUCT_PACKAGES += \
    RemovePackages

# Shims 
PRODUCT_PACKAGES += \
    libshim_asp

# Call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/amazon/tank/tank-vendor.mk)
