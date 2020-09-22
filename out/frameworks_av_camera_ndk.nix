{ cc_library_shared, cc_test }:
let

#  Copyright (C) 2016 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  Headers module is in frameworks/av/Android.bp because modules are not allowed
#  to refer to headers in parent directories and the headers live in
#  frameworks/av/include.

libcamera2ndk = cc_library_shared {
    name = "libcamera2ndk";
    srcs = [
        "NdkCameraManager.cpp"
        "NdkCameraMetadata.cpp"
        "NdkCameraDevice.cpp"
        "NdkCaptureRequest.cpp"
        "NdkCameraCaptureSession.cpp"
        "impl/ACameraManager.cpp"
        "impl/ACameraMetadata.cpp"
        "impl/ACameraDevice.cpp"
        "impl/ACameraCaptureSession.cpp"
    ];
    shared_libs = [
        "libbinder"
        "liblog"
        "libgui"
        "libutils"
        "libandroid_runtime"
        "libcamera_client"
        "libstagefright_foundation"
        "libcutils"
        "libcamera_metadata"
        "libmediandk"
        "libnativewindow"
    ];
    header_libs = [
        "jni_headers"
    ];
    cflags = [
        "-fvisibility=hidden"
        "-DEXPORT=__attribute__ ((visibility (\"default\")))"
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    #  TODO: jchowdhary@, use header_libs instead b/131165718
    include_dirs = [
        "system/media/private/camera/include"
    ];
    export_include_dirs = ["include"];
    export_shared_lib_headers = [
        "libnativewindow"
    ];
    version_script = "libcamera2ndk.map.txt";
};

libcamera2ndk_vendor = cc_library_shared {
    name = "libcamera2ndk_vendor";
    vendor = true;
    srcs = [
        "ndk_vendor/impl/ACameraDevice.cpp"
        "ndk_vendor/impl/ACameraManager.cpp"
        "ndk_vendor/impl/utils.cpp"
        "impl/ACameraMetadata.cpp"
        "impl/ACameraCaptureSession.cpp"
        "NdkCameraMetadata.cpp"
        "NdkCameraCaptureSession.cpp"
        "NdkCameraManager.cpp"
        "NdkCameraDevice.cpp"
        "NdkCaptureRequest.cpp"
    ];

    export_include_dirs = ["include"];
    export_shared_lib_headers = [
        "libcutils"
    ];
    local_include_dirs = [
        "."
        "include"
        "impl"
    ];
    cflags = [
        "-fvisibility=hidden"
        "-DEXPORT=__attribute__((visibility(\"default\")))"
        "-D__ANDROID_VNDK__"
    ];

    shared_libs = [
        "libfmq"
        "libhidlbase"
        "libhardware"
        "libnativewindow"
        "liblog"
        "libutils"
        "libstagefright_foundation"
        "libcutils"
        "libcamera_metadata"
        "libmediandk"
        "android.frameworks.cameraservice.device@2.0"
        "android.frameworks.cameraservice.common@2.0"
        "android.frameworks.cameraservice.service@2.0"
        "android.frameworks.cameraservice.service@2.1"
    ];
    static_libs = [
        "android.hardware.camera.common@1.0-helper"
        "libarect"
    ];
    #  TODO: jchowdhary@, use header_libs instead b/131165718
    include_dirs = [
        "system/media/private/camera/include"
    ];
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

ACameraNdkVendorTest = cc_test {
    name = "ACameraNdkVendorTest";
    vendor = true;
    srcs = [
        "ndk_vendor/tests/AImageReaderVendorTest.cpp"
        "ndk_vendor/tests/ACameraManagerTest.cpp"
    ];
    shared_libs = [
        "libcamera2ndk_vendor"
        "libcamera_metadata"
        "libmediandk"
        "libnativewindow"
        "libutils"
        "libui"
        "libcutils"
        "liblog"
    ];
    static_libs = [
        "android.hardware.camera.common@1.0-helper"
    ];
    cflags = [
        "-D__ANDROID_VNDK__"
    ];
};

in { inherit ACameraNdkVendorTest libcamera2ndk libcamera2ndk_vendor; }
