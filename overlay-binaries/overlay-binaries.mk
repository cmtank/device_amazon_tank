OVERLAY_BIN := device/amazon/ford/overlay-binaries

#ifeq ($(TARGET_DEVICE),ford)

# Install module to set selinux to permissive
# Loaded by init.mt8127.rc
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/selinux_permissive.ko:system/lib/modules/vcodec_kernel_driver.ko

# install-recovery.sh used to initialise init.d support	
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/install-recovery.sh:system/bin/install-recovery.sh
	
# Install init.d scripts
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/99exfat-support:system/etc/init.d/99exfat-support	

#endif
