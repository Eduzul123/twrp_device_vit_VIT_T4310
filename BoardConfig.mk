#
# Copyright (C) 2016 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/vit/VIT_T4310


# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_LDPRELOAD := libxlog.so

BOARD_HAS_NO_SELECT_BUTTON := true

# BOOTLOADER
TARGET_BOOTLOADER_BOARD_NAME := mt6580

# Kernel
BOARD_KERNEL_CMDLINE += \
	bootopt=64S3,32S1,32S1 \
	androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS  := --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --tags_offset 0x0e000000 --board 1520325298
TARGET_PREBUILT_KERNEL := device/vit/VIT_T4310/prebuilt/kernel

# TARGET IMAGES
TARGET_USERIMAGES_USE_EXT4 := true

# RECOVERY
TARGET_RECOVERY_FSTAB := device/vit/VIT_T4310/recovery/root/twrp.fstab

# PARTTIONS
# We need the partitions size in decimal
# Use cat proc/partitions via adb, then block size * 1024
# 'Tis typical for counterfeit/clone devices to come with a hacked framework
# that is so coded to report a different ROM capacity than what's actually there.
#
# Apparently the userdata partition is set at ~5GB, and system at 1.3GB
# Change these in case you want to port this to your clone or white-box phone.
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11737283584
# For the following line, do KERNEL_PAGE_SIZE * 64 (Most of time it is 2048 * 64)
BOARD_FLASH_BLOCK_SIZE := 131072

# TWRP stuff
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TW_MAX_BRIGHTNESS := 255
TW_INCLUDE_FB2PNG := true
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_REBOOT_BOOTLOADER := true
TW_REBOOT_RECOVERY := true
TW_EXCLUDE_SUPERSU := false
TW_USE_TOOLBOX := true

# Device-specific stuff - the clone I am working on has a flipped framebuffer
# This basically forced me to download BBQLinux and git these source files :P
BOARD_HAS_FLIPPED_SCREEN := true
