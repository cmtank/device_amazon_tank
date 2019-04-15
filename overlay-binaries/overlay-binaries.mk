OVERLAY_BIN := device/amazon/ford/overlay-binaries
	
# Install init.d scripts
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/99exfat-support:system/etc/init.d/99exfat-support \
	$(OVERLAY_BIN)/99sudaemon:system/etc/init.d/99sudaemon \
	$(OVERLAY_BIN)/00permissions:system/etc/init.d/00permissions

# Swype gesture lib
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Use mediatek video encoder from FireOS 5.1.4
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/libMtkOmxVenc.so:system/lib/libMtkOmxVenc.so