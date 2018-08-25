# Copyright (C) 2015 The CyanogenMod Project
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

LOCAL_PATH := $(call my-dir)/../../../../frameworks/av/camera

include $(CLEAR_VARS)

LOCAL_AIDL_INCLUDES := \
    frameworks/av/camera/aidl \
    frameworks/base/core/java \
    frameworks/native/aidl/gui

# AIDL files for camera interfaces
# The headers for these interfaces will be available to any modules that
# include libcamera_client, at the path "aidl/package/path/BnFoo.h"

LOCAL_SRC_FILES := \
    aidl/android/hardware/ICameraService.aidl \
    aidl/android/hardware/ICameraServiceListener.aidl \
    aidl/android/hardware/camera2/ICameraDeviceCallbacks.aidl \
    aidl/android/hardware/camera2/ICameraDeviceUser.aidl

# Source for camera interface parcelables, and manually-written interfaces

LOCAL_SRC_FILES += \
	Camera.cpp \
	CameraMetadata.cpp \
	CameraParameters.cpp \
	CaptureResult.cpp \
	CameraParameters2.cpp \
	ICamera.cpp \
	ICameraClient.cpp \
	ICameraServiceProxy.cpp \
	ICameraRecordingProxy.cpp \
	ICameraRecordingProxyListener.cpp \
	camera2/CaptureRequest.cpp \
	camera2/OutputConfiguration.cpp \
	camera2/SubmitInfo.cpp \
	CameraBase.cpp \
	CameraUtils.cpp \
	VendorTagDescriptor.cpp

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libmotou \
	liblog \
	libbinder \
	libhardware \
	libui \
	libgui \
	libcamera_metadata \

LOCAL_C_INCLUDES += \
	system/media/camera/include \
	system/media/private/camera/include \
	frameworks/native/include/media/openmax \
	frameworks/av/include/camera

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	system/media/camera/include \
	frameworks/av/include/camera

LOCAL_CFLAGS += -Werror -Wall -Wextra

LOCAL_MODULE:= libcamera_motocl

include $(BUILD_SHARED_LIBRARY)