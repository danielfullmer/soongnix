{ cc_library_shared }:
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

#  Headers module is in external/vulkan-headers/Android.bp.

libvulkan = cc_library_shared {
    name = "libvulkan";
    clang = true;
    sanitize = {
        misc_undefined = ["integer"];
    };

    cflags = [
        "-DLOG_TAG=\"vulkan\""
        "-DVK_USE_PLATFORM_ANDROID_KHR"
        "-DVK_NO_PROTOTYPES"
        "-fvisibility=hidden"
        "-fstrict-aliasing"
        "-Weverything"
        "-Werror"
        "-Wno-padded"
        "-Wno-switch-enum"
        "-Wno-undef"

        #  Have clang emit complete debug_info.
        "-fstandalone-debug"

        # "-DLOG_NDEBUG=0",
    ];

    cppflags = [
        "-Wno-c99-extensions"
        "-Wno-c++98-compat-pedantic"
        "-Wno-exit-time-destructors"
        "-Wno-float-equal"
        "-Wno-global-constructors"
        "-Wno-zero-length-array"
    ];

    srcs = [
        "api.cpp"
        "api_gen.cpp"
        "debug_report.cpp"
        "driver.cpp"
        "driver_gen.cpp"
        "layers_extensions.cpp"
        "stubhal.cpp"
        "swapchain.cpp"
    ];

    header_libs = [
        "hwvulkan_headers"
        "vulkan_headers"
    ];
    export_header_lib_headers = ["vulkan_headers"];
    shared_libs = [
        "android.hardware.configstore@1.0"
        "android.hardware.configstore-utils"
        "libziparchive"
        "libhardware"
        "libsync"
        "libbase"
        "libdl_android"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libui"
        "libgraphicsenv"
        "libutils"
        "libcutils"
        "libz"
        "libnativebridge_lazy"
        "libnativeloader_lazy"
        "libnativewindow"
        "android.hardware.graphics.common@1.0"
    ];
    static_libs = ["libgrallocusage"];
};

in { inherit libvulkan; }
