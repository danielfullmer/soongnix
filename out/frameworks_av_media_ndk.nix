{ cc_library, cc_library_headers, cc_library_shared, cc_test, llndk_library, ndk_headers, ndk_library }:
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

libmediandk = ndk_library {
    name = "libmediandk";
    symbol_file = "libmediandk.map.txt";
    first_version = "21";
    unversioned_until = "current";
};

libmediandk_headers = ndk_headers {
    name = "libmediandk_headers";
    from = "include/media";
    to = "media";
    srcs = ["include/media/**/*.h"];
    license = "NOTICE";
};

#  for use with header_libs
media_ndk_headers = cc_library_headers {
    name = "media_ndk_headers";
    vendor_available = true;
    export_include_dirs = ["include"];
};

libmediandk = cc_library_shared {
    name = "libmediandk";

    srcs = [
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
        "bionic/libc/private"
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

    shared_libs = [
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hidl.token@1.0-utils"
        "libandroid_runtime_lazy"
        "libbase"
        "libbinder"
        "libmedia"
        "libmedia_omx"
        "libmedia_jni_utils"
        "libmediadrm"
        "libstagefright"
        "libstagefright_foundation"
        "liblog"
        "libutils"
        "libcutils"
        "libnativewindow"
        "libbinder"
        "libhidlbase"
        "libgui"
        "libui"
        "libmedia2_jni_core"
        "libmediandk_utils"
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

libmediandk = llndk_library {
    name = "libmediandk";
    symbol_file = "libmediandk.map.txt";
    export_include_dirs = [
        "include"
    ];
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
    cflags = [
        "-D__ANDROID_VNDK__"
    ];
    include_dirs = [
        "frameworks/av/media/ndk/"
    ];
};

in { inherit AImageReaderWindowHandleTest libmediandk libmediandk_headers libmediandk_utils media_ndk_headers; }
