# Copyright (C) 2017 The Pure Nexus Project
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

LOCAL_PATH := vendor/tormenta

PRODUCT_COPY_FILES += \
    vendor/tormenta/prebuilt/system/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "Tormenta: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "Tormenta: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

# Set Pixel blue light theme on Gboard
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.ime.theme_id=5

DEVICE_PACKAGE_OVERLAYS += vendor/tormenta/overlay/common
