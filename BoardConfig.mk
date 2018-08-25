#
# Copyright (C) 2015 The CyanogenMod Project
#               2017 The LineageOS Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

-include device/motorola/msm8960_jbbl-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/motorola/xt897/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/xt897

# Assert
TARGET_OTA_ASSERT_DEVICE := xt897,asanti_c

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_xt897
TARGET_RECOVERY_DEVICE_MODULES := libinit_xt897

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Recovery
TARGET_RECOVERY_DEVICE_DIRS := device/motorola/xt897

# Storage
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1560281088
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5084790272

# TWRP
DEVICE_RESOLUTION := 540x960
