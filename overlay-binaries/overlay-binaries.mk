OVERLAY_BIN := device/amazon/ford/overlay-binaries

# install-recovery.sh used to initialise init.d support	
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/install-recovery.sh:system/bin/new-install-recovery.sh \
	$(OVERLAY_BIN)/install-recovery.sh:system/etc/install-recovery-2.sh
	
# Install init.d scripts
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/99exfat-support:system/etc/init.d/99exfat-support \
	$(OVERLAY_BIN)/99sudaemon:system/etc/init.d/99sudaemon \
	$(OVERLAY_BIN)/00permissions:system/etc/init.d/00permissions

