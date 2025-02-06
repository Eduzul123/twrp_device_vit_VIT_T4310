#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from VIT_T4310 device
$(call inherit-product, device/vit/VIT_T4310/device.mk)

PRODUCT_DEVICE := VIT_T4310
PRODUCT_NAME := omni_VIT_T4310
PRODUCT_BRAND := VIT T4310
PRODUCT_MODEL := VIT T4310
PRODUCT_MANUFACTURER := vit

PRODUCT_GMS_CLIENTID_BASE := alps-full_joyasz8321_femmc-{country}

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_joyasz8321_femmc-user 5.1 LMY47I 1520325298 dev-keys"

BUILD_FINGERPRINT := alps/full_joyasz8321_femmc/joyasz8321_femmc:5.1/LMY47I/1520325298:user/dev-keys
