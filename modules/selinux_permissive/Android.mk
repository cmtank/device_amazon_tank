SELINUX_MODULE:
	make -C device/amazon/ford/modules/selinux_permissive/ KERNEL=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" MDIR="$(PWD)/device/amazon/ford/modules/selinux_permissive/" module
	cp device/amazon/ford/modules/selinux_permissive/selinux_permissive.ko $(KERNEL_MODULES_OUT)/vcodec_kernel_driver.ko
    
TARGET_KERNEL_MODULES := SELINUX_MODULE
