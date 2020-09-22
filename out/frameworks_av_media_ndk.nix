{ cc_library, cc_library_headers, cc_library_shared, cc_test }:
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

#  for use with header_libs
media_ndk_headers = cc_library_headers {
    name = "media_ndk_headers";
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    apex_available = [
        "//apex_available:platform"
        "com.android.media"
        "com.android.media.swcodec"
    ];
    min_sdk_version = "29";
    export_include_dirs = ["include"];
};

libmediandk = cc_library_shared {
    name = "libmediandk";

    srcs = [
        "NdkJavaVMHelper.cpp"
        "NdkMediaCodec.cpp"
        "NdkMediaCrypto.cpp"
        "NdkMediaDataSource.cpp"
        "NdkMediaExtractor.cpp"
        "NdkMediaFormat.cpp"
        "NdkMediaMuxer.cpp"
        "NdkMediaDrm.cpp"
        "NdkImage.cpp"
        "NdkImageReader.cpp"
    ];

    include_dirs = [
        "frameworks/base/core/jni"
        "frameworks/native/include/media/openmax"
        "system/media/camera/include"
    ];

    cflags = [
        "-DEXPORT=__attribute__((visibility(\"default\")))"
        "-Werror"
        "-Wall"
    ];

    static_libs = [
        "libgrallocusage"
    ];

    header_libs = [
        "libmediadrm_headers"
        "libmediametrics_headers"
    ];

    shared_libs = [
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hidl.token@1.0-utils"
        "libandroid_runtime_lazy"
        "libbase"
        "libdatasource"
        "libmedia"
        "libmediadrm"
        "libmedia_omx"
        "libmedia_jni_utils"
        "libstagefright"
        "libstagefright_foundation"
        "liblog"
        "libutils"
        "libcutils"
        "libnativewindow"
        "libhidlbase"
        "libgui"
        "libui"
        "libmediandk_utils"
        "libnativehelper"
    ];

    export_include_dirs = ["include"];

    export_shared_lib_headers = [
        "libgui"
    ];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    version_script = "libmediandk.map.txt";
    stubs = {
        symbol_file = "libmediandk.map.txt";
        versions = ["29"];
    };
};

libmediandk_utils = cc_library {
    name = "libmediandk_utils";

    srcs = [
        "NdkMediaDataSourceCallbacks.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright/include"
        "frameworks/av/media/ndk/include"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    header_libs = [
        "libmedia_headers"
    ];

    shared_libs = [
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

AImageReaderWindowHandleTest = cc_test {
    name = "AImageReaderWindowHandleTest";
    srcs = ["tests/AImageReaderWindowHandleTest.cpp"];
    shared_libs = [
        "libbinder"
        "libmediandk"
        "libmediautils"
        "libnativewindow"
        "libgui"
        "libutils"
        "libui"
        "libcutils"
        "android.hardware.graphics.bufferqueue@1.0"
    ];
    header_libs = [
        "libstagefright_foundation_headers"
    ];

    cflags = [
        "-D__ANDROID_VNDK__"
    ];
    include_dirs = [
        "frameworks/av/media/ndk/"
    ];
};

in { inherit AImageReaderWindowHandleTest libmediandk libmediandk_utils media_ndk_headers; }
