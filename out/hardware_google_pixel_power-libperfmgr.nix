{ cc_binary, cc_library, cc_library_headers }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

libdisppower-pixel = cc_library {
    name = "libdisppower-pixel";
    proprietary = true;
    srcs = [
        "disp-power/DisplayLowPower.cpp"
        "disp-power/InteractionHandler.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "libperfmgr"
        "libutils"
    ];
};

pixel_power_headers = cc_library_headers {
    name = "pixel_power_headers";
    vendor = true;
    export_include_dirs = ["hidl"];
};

"android.hardware.power@1.3-service.pixel-libperfmgr" = cc_binary {
    name = "android.hardware.power@1.3-service.pixel-libperfmgr";
    relative_install_path = "hw";
    vintf_fragments = ["hidl/android.hardware.power@1.3-service.pixel.xml"];
    init_rc = ["hidl/android.hardware.power@1.3-service.pixel-libperfmgr.rc"];
    srcs = [
        "hidl/service.cpp"
        "hidl/Power.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libhidlbase"
        "liblog"
        "libutils"
        "libcutils"
        "android.hardware.power@1.0"
        "android.hardware.power@1.1"
        "android.hardware.power@1.2"
        "android.hardware.power@1.3"
        "libdisppower-pixel"
        "libperfmgr"
    ];
    proprietary = true;
};

"android.hardware.power-service.pixel-libperfmgr" = cc_binary {
    name = "android.hardware.power-service.pixel-libperfmgr";
    relative_install_path = "hw";
    init_rc = ["aidl/android.hardware.power-service.pixel-libperfmgr.rc"];
    vintf_fragments = ["aidl/android.hardware.power-service.pixel.xml"];
    vendor = true;
    shared_libs = [
        "android.hardware.power-ndk_platform"
        "libbase"
        "libcutils"
        "liblog"
        "libutils"
        "libbinder_ndk"
        "libdisppower-pixel"
        "libperfmgr"
        "pixel-power-ext-ndk_platform"
    ];
    srcs = [
        "aidl/service.cpp"
        "aidl/Power.cpp"
        "aidl/PowerExt.cpp"
    ];
};

in { inherit "android.hardware.power-service.pixel-libperfmgr" "android.hardware.power@1.3-service.pixel-libperfmgr" libdisppower-pixel pixel_power_headers; }
