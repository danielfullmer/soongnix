{ cc_binary, cc_library_headers }:
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

pixel_power_headers = cc_library_headers {
    name = "pixel_power_headers";
    vendor_available = true;
    export_include_dirs = ["."];
};

"android.hardware.power@1.3-service.pixel-libperfmgr" = cc_binary {
    name = "android.hardware.power@1.3-service.pixel-libperfmgr";
    relative_install_path = "hw";
    vintf_fragments = ["android.hardware.power@1.3-service.pixel.xml"];
    init_rc = ["android.hardware.power@1.3-service.pixel-libperfmgr.rc"];
    srcs = [
        "service.cpp"
        "Power.cpp"
        "InteractionHandler.cpp"
        "display-helper.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "libcutils"
        "android.hardware.power@1.0"
        "android.hardware.power@1.1"
        "android.hardware.power@1.2"
        "android.hardware.power@1.3"
        "libperfmgr"
    ];
    proprietary = true;
};

in { inherit "android.hardware.power@1.3-service.pixel-libperfmgr" pixel_power_headers; }
