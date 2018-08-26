#
# Copyright (C) 2015 The CyanogenMod Project
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

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/motorola/msm8960_jbbl-common

# msm8960_jbbl-common specific overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8960

# Doze
PRODUCT_PACKAGES += \
    MotoDoze

# Camera
PRODUCT_PACKAGES += \
    Snap

# HAL
PRODUCT_PACKAGES += \
    camera.msm8960 \
    copybit.msm8960 \
    gps.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    lights.MSM8960 \
    memtrack.msm8960 \
    power.msm8960

# Filesystem
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    e2fsck \
    make_ext4fs \
    setup_fs

# Motorola
PRODUCT_PACKAGES += \
    batt_health \
    charge_only_mode \
    graphicsd \
    mot_boot_mode

# Camera compatibility libs
PRODUCT_PACKAGES += \
    libcamera_motocl \
    libmotou \
    libshim_cam

# Misc
PRODUCT_PACKAGES += \
    sqlite3

# Symlinks
PRODUCT_PACKAGES += \
    mbhc.bin \
    wcd9310_anc.bin

# GPS configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wlan/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wlan/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# Init scripts
PRODUCT_PACKAGES += \
    init.qcom.post_boot.sh \
    init.qcom.sh

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.usb.rc:root/init.recovery.usb.rc

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/config/media_codecs_aosp.xml:system/etc/media_codecs.xml

# SELinux execmod workaround
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/scripts/execmod-wrapper.sh:system/bin/mm-qcamera-daemon \
    $(LOCAL_PATH)/scripts/execmod-wrapper.sh:system/bin/mpdecision \
    $(LOCAL_PATH)/scripts/execmod-wrapper.sh:system/bin/qdumpd \
    $(LOCAL_PATH)/scripts/execmod-wrapper.sh:system/bin/qmuxd \
    $(LOCAL_PATH)/scripts/execmod-wrapper.sh:system/bin/rmt_storage \
    $(LOCAL_PATH)/scripts/execmod-wrapper.sh:system/bin/sensors.qcom \
    $(LOCAL_PATH)/scripts/execmod-wrapper.sh:system/bin/thermald \
    $(LOCAL_PATH)/scripts/execmod-wrapper.sh:system/bin/whisperd

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.usb.mtp=0x2e62 \
    ro.usb.mtp_adb=0x2e63 \
    ro.usb.ptp=0x2e64 \
    ro.usb.ptp_adb=0x2e65 \
    ro.usb.bpt=0x2e28 \
    ro.usb.bpt_adb=0x2e29 \
    ro.usb.bpteth=0x2e2a \
    ro.usb.bpteth_adb=0x2e2b \
    ro.hdmi.enable=true

# Opengles version 2
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.no_wait_for_card=1 \
    persist.radio.dfr_mode_set=1 \
    persist.radio.eons.enabled= true \
    persist.radio.call_type=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.timed.enable=true

# Radio and Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=MotorolaQualcommRIL \
    ro.telephony.ril.config=setPrefNwTypeOnUnsolConnected

# SDCARDFS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=30

# Force old camera api
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# I/O scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

$(call inherit-product, device/motorola/qcom-common/qcom-common.mk)
$(call inherit-product, device/motorola/qcom-common/idc/idc.mk)
$(call inherit-product, device/motorola/qcom-common/keychars/keychars.mk)
$(call inherit-product, device/motorola/qcom-common/keylayout/keylayout.mk)
$(call inherit-product, vendor/motorola/msm8960_jbbl-common/msm8960_jbbl-common-vendor.mk)
