#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Get minimum languages available
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/logan2g/logan2g-vendor.mk)

# Use the Dalvik VM specific for devices with 512 MB of RAM
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/logan2g/overlay

PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Set local path
LOCAL_PATH := device/samsung/logan2g

# Softlink sh
$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin ../../sbin/sh)

# Files to be copied
# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.sc6820i:root/fstab.sc6820i \
    $(LOCAL_PATH)/rootdir/init.bt.rc:root/init.bt.rc \
    $(LOCAL_PATH)/rootdir/init.sc6820i.rc:root/init.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/init.sc6820i.usb.rc:root/init.sc6820i.usb.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sc6820i.rc:root/ueventd.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/bin/charge:root/bin/charge \
    $(LOCAL_PATH)/rootdir/bin/poweroff_alarm:root/bin/poweroff_alarm \
    $(LOCAL_PATH)/rootdir/bin/rawdatad:root/bin/rawdatad \
    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc

# Idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/Zinitix_tsp.idc:system/usr/idc/Zinitix_tsp.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayouts/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/default_gain.conf:system/etc/default_gain.conf \
    $(LOCAL_PATH)/configs/audio/devicevolume.xml:system/etc/devicevolume.xml \
    $(LOCAL_PATH)/configs/audio/formatvolume.xml:system/etc/formatvolume.xml

# Hw Params
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_para:system/etc/audio_para \
    $(LOCAL_PATH)/configs/audio/codec_pga.xml:system/etc/codec_pga.xml\
    $(LOCAL_PATH)/configs/audio/tiny_hw.xml:system/etc/tiny_hw.xml \
    $(LOCAL_PATH)/configs/audio/audio_hw.xml:system/etc/audio_hw.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
 	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
 	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml\


# Filesystem
PRODUCT_PACKAGES += \
    setup_fs \

# Wi-Fi
PRODUCT_PACKAGES += \
    macloader \
    dhcpcd.conf \
    hostapd \
    libnetcmdiface \
    wpa_supplicant \
    wpa_supplicant.conf

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwui.drop_shadow_cache_size=1 \
	ro.hwui.gradient_cache_size=0.2 \
	ro.hwui.layer_cache_size=6 \
	ro.hwui.path_cache_size=2 \
	ro.hwui.r_buffer_cache_size=1 \
	ro.hwui.texture_cache_size=8    

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libtinyalsa \
	tinymix \
    	libatchannel \
	libatchannel_wrapper \
	audio.primary.sc6820i \
	audio_policy.sc6820i \
	libaudiopolicy \
	libvbeffect \
	libvbpga \
	audio_vbc_eq 

PRODUCT_PACKAGES += \
	libengclient

# MemoryHeapIon needed by camera and HWC
PRODUCT_PACKAGES += \
	libmemoryheapion

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Service mode
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images
