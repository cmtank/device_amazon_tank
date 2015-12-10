OVERLAY_BIN := device/amazon/ford/overlay-binaries

# Install module to set selinux to permissive
# Loaded by init.mt8127.rc
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/selinux_permissive.ko:system/lib/modules/vcodec_kernel_driver.ko

# install-recovery.sh used to initialise init.d support	
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/install-recovery.sh:system/bin/new-install-recovery.sh \
	$(OVERLAY_BIN)/install-recovery.sh:system/etc/install-recovery-2.sh
	
# Install init.d scripts
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/99exfat-support:system/etc/init.d/99exfat-support \
	$(OVERLAY_BIN)/99sudaemon:system/etc/init.d/99sudaemon

