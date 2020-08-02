LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_JAVA_LIBRARIES := android-common
LOCAL_CERTIFICATE := shared
LOCAL_PACKAGE_NAME := RemovePackages
LOCAL_OVERRIDES_PACKAGES := \
        AudioFX \
        BasicDreams \
        Browser \
        Calculator \
        Calendar \
        CalendarProvider \
        Camera2 \
        Contacts \
        ContactsProvider \
        CMFileManager \
        DeskClock \
        Eleven \
        Email \
        Exchange2 \
        Galaxy4 \
        Gallery2 \
        HoloSpiralWallpaper \
        LiveWallpapers \
        LiveWallpapersPicker \
        LockClock \
        MmsService \
        PhaseBeam \
        PhotoPhase \
        PhotoTable \
        PrintSpooler \
        privacy-browser \
        SoundRecorder \
        Telecom \
        TelephonyProvider \
        TeleService \
        ThemeChooser \
        Trebuchet \
        VisualizationWallpapers \
        WallpaperCropper

include $(BUILD_PACKAGE)
