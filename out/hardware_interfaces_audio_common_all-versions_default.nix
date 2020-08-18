{ cc_defaults, cc_library_shared }:
let

#
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

"android.hardware.audio.common-util" = cc_library_shared {
    name = "android.hardware.audio.common-util";
    defaults = ["hidl_defaults"];
    vendor_available = true;
    srcs = [
        "EffectMap.cpp"
    ];

    export_include_dirs = ["include"];

    shared_libs = [
        "liblog"
        "libutils"
        "libhidlbase"
    ];

    header_libs = [
        "android.hardware.audio.common.util@all-versions"
        "libaudio_system_headers"
        "libhardware_headers"
    ];
    export_header_lib_headers = [
        "android.hardware.audio.common.util@all-versions"
    ];
};

"android.hardware.audio.common-util_default" = cc_defaults {
    name = "android.hardware.audio.common-util_default";
    defaults = ["hidl_defaults"];

    vendor_available = true;
    srcs = [
        "HidlUtils.cpp"
    ];

    export_include_dirs = ["."];

    shared_libs = [
        "liblog"
        "libutils"
        "libhidlbase"
        "android.hardware.audio.common-util"
    ];
    export_shared_lib_headers = [
        "android.hardware.audio.common-util"
    ];

    header_libs = [
        "libaudio_system_headers"
        "libhardware_headers"
    ];
};

"android.hardware.audio.common@2.0-util" = cc_library_shared {
    name = "android.hardware.audio.common@2.0-util";
    defaults = ["android.hardware.audio.common-util_default"];

    shared_libs = [
        "android.hardware.audio.common@2.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=2"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

"android.hardware.audio.common@4.0-util" = cc_library_shared {
    name = "android.hardware.audio.common@4.0-util";
    defaults = ["android.hardware.audio.common-util_default"];

    shared_libs = [
        "android.hardware.audio.common@4.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=4"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

"android.hardware.audio.common@5.0-util" = cc_library_shared {
    name = "android.hardware.audio.common@5.0-util";
    defaults = ["android.hardware.audio.common-util_default"];

    shared_libs = [
        "android.hardware.audio.common@5.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=5"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

in { inherit "android.hardware.audio.common-util" "android.hardware.audio.common-util_default" "android.hardware.audio.common@2.0-util" "android.hardware.audio.common@4.0-util" "android.hardware.audio.common@5.0-util"; }
