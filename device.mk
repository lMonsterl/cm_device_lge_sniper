# XXX: should be full_base_telephony?
$(call inherit-product, build/target/product/full.mk)

$(call inherit-product, build/target/product/languages_small.mk)
$(call inherit-product, vendor/cm/config/common.mk)

$(call inherit-product-if-exists, vendor/lge/sniper/sniper-vendor.mk)

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi 

PRODUCT_LOCALES := en_US es_ES

# PicoTTS
PRODUCT_REMOVE_FILES += \
	system/tts/lang_pico/de-DE_gl0_sg.bin \
	system/tts/lang_pico/de-DE_ta.bin \
	system/tts/lang_pico/en-GB_kh0_sg.bin \
	system/tts/lang_pico/en-GB_ta.bin \
	system/tts/lang_pico/fr-FR_nk0_sg.bin \
	system/tts/lang_pico/fr-FR_ta.bin \
	system/tts/lang_pico/it-IT_cm0_sg.bin \
	system/tts/lang_pico/it-IT_ta.bin

# Wallpapers and Media
PRODUCT_REMOVE_FILES += \
	system/app/HoloSpiralWallpaper.apk \
	system/app/LiveWallpapers.apk \
	system/app/MagicSmokeWallpapers.apk \
	system/app/PhaseBeam.apk \
	system/app/VisualizationWallpapers.apk \
	system/media/audio/ringtones/CyanTone.ogg

# Recent additions
PRODUCT_REMOVE_FILES += \
	system/media/audio/notifications/Doink.ogg \
	system/media/audio/notifications/Rang.ogg \
	system/media/audio/notifications/Stone.ogg \
	system/media/audio/ringtones/Bongo.ogg \
	system/media/audio/ringtones/Boxbeat.ogg \
	system/media/audio/ringtones/Gigolo.ogg \
	system/media/audio/ringtones/House_of_house.ogg \
	system/media/audio/ringtones/Silmarillia.ogg
	
# Other
PRODUCT_REMOVE_FILES += \
	system/app/VideoEditor.apk \
#	system/lib/libvideoeditor_jni.so \
#	system/lib/libvideoeditorplayer.so
	
DEVICE_PACKAGE_OVERLAYS += device/lge/sniper/overlay

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Use dalvik parameters for a 512 MB device
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Front camera
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

PRODUCT_COPY_FILES += \
    device/lge/sniper/init.rc:root/init.rc \
    device/lge/sniper/ueventd.rc:root/ueventd.rc \
    device/lge/sniper/ueventd.lgesniperboard.rc:root/ueventd.lgesniperboard.rc \
    device/lge/sniper/init.ls855.usb.rc:root/init.ls855.usb.rc

#    device/lge/sniper/prebuilt/initlogo.rle:root/initlogo.rle

# configs
PRODUCT_COPY_FILES += device/lge/sniper/configs/AudioFilter.csv:system/etc/AudioFilter.csv 
PRODUCT_COPY_FILES += device/lge/sniper/configs/media_profiles.xml:system/etc/media_profiles.xml 
PRODUCT_COPY_FILES += device/lge/sniper/configs/adreno_config.txt:system/etc/adreno_config.txt 	

# Offmode charging 
# PRODUCT_PACKAGES += charger
# PRODUCT_PACKAGES += charger_res_images 

# FOP alsa config
PRODUCT_COPY_FILES += \
    device/lge/sniper/configs/asound.conf:system/etc/asound.conf \
    device/lge/sniper/audio/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
    device/lge/sniper/audio/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    device/lge/sniper/audio/alsa/init/00main:system/usr/share/alsa/init/00main \
    device/lge/sniper/audio/alsa/init/default:system/usr/share/alsa/init/default \
    device/lge/sniper/audio/alsa/init/hda:system/usr/share/alsa/init/hda \
    device/lge/sniper/audio/alsa/init/help:system/usr/share/alsa/init/help \
    device/lge/sniper/audio/alsa/init/info:system/usr/share/alsa/init/info \
    device/lge/sniper/audio/alsa/init/test:system/usr/share/alsa/init/test \
    device/lge/sniper/audio/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    device/lge/sniper/audio/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    device/lge/sniper/audio/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    device/lge/sniper/audio/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    device/lge/sniper/audio/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    device/lge/sniper/audio/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    device/lge/sniper/audio/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    device/lge/sniper/audio/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    device/lge/sniper/audio/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    device/lge/sniper/audio/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    device/lge/sniper/audio/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    device/lge/sniper/audio/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    device/lge/sniper/audio/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    device/lge/sniper/audio/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    device/lge/sniper/audio/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf

#PRODUCT_PACKAGES += getbaseband

# ICS sound
PRODUCT_PACKAGES += \
	hcitool hciattach hcidump \
	libaudioutils \
	audio.a2dp.default \
	audio_policy.omap3 \
	libaudiohw_legacy \
	audio.primary.omap3

# HWComposer
PRODUCT_PACKAGES += hwcomposer.default

# Camera
PRODUCT_PACKAGES += camera.sniper

# OMX stuff
PRODUCT_PACKAGES += dspexec libOMX_Core

# Misc
PRODUCT_PACKAGES += \
	lights.sniper \
	com.android.future.usb.accessory \
	Apollo \

PRODUCT_PACKAGES += \
    flash_image \
    erase_image \
    dump_image \
    sniper_keypad.kcm.bin \

PRODUCT_PACKAGES += \
    Provision \
    GoogleSearch \
    LatinIME \
    QuickSearchBox \
    FileManager \
    Torch


# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml 

#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.sf.lcd_density=240 \
#    persist.sys.use_16bpp_alpha




PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=Quattrimus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.clientidbase=android-lge \
    ro.com.google.clientidbase.gmm=android-lge \
    gsm.operator.iso-country=us
