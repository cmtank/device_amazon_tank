
# headers
TARGET_SPECIFIC_HEADER_PATH := device/amazon/tank/include

# inherit from the proprietary version
-include vendor/amazon/tank/BoardConfig.mk

DALVIK_VM_LIB := true

# Platform
TARGET_BOARD_PLATFORM := mt8127
TARGET_BOARD_PLATFORM_GPU := mali-450mp4

# Bootloader
TARGET_NO_BOOTLOADER := true

# Extra scripts
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/amazon/tank/releasetools/ota_from_target_files

# Architecture
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true

# Kernel Config
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x04000000 --tags_offset 0x00000100
#BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
#BOARD_KERNEL_BASE := 0x80000000
#BOARD_KERNEL_PAGESIZE := 4096
#BOARD_PAGE_SIZE := 0x800


# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/amazon/tank/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x04000000 --tags_offset 0x00000100
TARGET_KERNEL_CONFIG := tank_defconfig
TARGET_KERNEL_SOURCE := kernel/amazon/mt8127
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_SECOND_OFFSET := 0x00f00000
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-


BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
#BOARD_KERNEL_CMDLINE := androidboot.console=ttyMSM0 androidboot.hardware=qcom
#BOARD_KERNEL_CMDLINE += user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
#BOARD_KERNEL_CMDLINE += service_locator.enable=1
#BOARD_KERNEL_CMDLINE += swiotlb=2048

BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

#TARGET_PREBUILT_KERNEL := device/amazon/tank/boot.img

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -DMTK_HARDWARE -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DAMAZON_LOG -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Wifi defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
#WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
#WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/brcm/bcm43569a2-firmware.bin"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"

# Bluetooth defines
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/amazon/tank/bluetooth

# Graphics
BOARD_EGL_CFG := device/amazon/tank/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
TARGET_USES_ION := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 1024*1024

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_HAS_WAITFORVSYNC := true

# Surfaceflinger optimization for VD surfaces
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
#NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 901775360
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6583598592
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

BLOCK_BASED_OTA := false

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file

# Assert
TARGET_OTA_ASSERT_DEVICE := tank
TARGET_BOOTLOADER_BOARD_NAME := tank

# Shims
TARGET_LD_SHIM_LIBS := \
/system/lib/libasp.so|libshim_asp.so \
/system/bin/thermald|libshim_thermald.so

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

# TWRP
#ifneq (,$(strip $(wildcard bootable/recovery-twrp/twrp.cpp)))
#RECOVERY_VARIANT := twrp
#endif
#DEVICE_RESOLUTION := 600x1024
#TW_EXCLUDE_MTP := false
#RECOVERY_SDCARD_ON_DATA := true
#TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
#TARGET_RECOVERY_LCD_BACKLIGHT_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#RECOVERY_FSTAB_VERSION := 2
#TW_THEME := landscape_mdpi
#TWRP_EVENT_LOGGING := true
#RECOVERY_TOUCHSCREEN_SWAP_XY := true
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#RECOVERY_TOUCHSCREEN_FLIP_Y := true 
#RECOVERY_TOUCHSCREEN_FLIP_X := true
#BOARD_HAS_FLIPPED_SCREEN := true

