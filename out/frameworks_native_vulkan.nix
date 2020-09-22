{ cc_library_headers }:
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

#  This module makes the Vulkan libhardware HAL headers available, for
#  the loader and for HAL/driver implementations.
hwvulkan_headers = cc_library_headers {
    name = "hwvulkan_headers";
    vendor_available = true;
    header_libs = [
        "libcutils_headers"
        "libhardware_headers"
    ];
    export_header_lib_headers = [
        "libcutils_headers"
        "libhardware_headers"
    ];
    export_include_dirs = ["include"];
};

subdirs = [
    "nulldrv"
    "libvulkan"
    "vkjson"
];

in { inherit hwvulkan_headers; }
