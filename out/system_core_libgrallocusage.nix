{ cc_library }:
let

#  Copyright 2017 The Android Open Source Project
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

libgrallocusage = cc_library {
    name = "libgrallocusage";
    vendor_available = true;
    cflags = [
        "-Wall"
        "-Werror"
    ];
    cppflags = [
        "-Wextra"
    ];
    srcs = ["GrallocUsageConversion.cpp"];
    export_include_dirs = ["include"];
    shared_libs = ["android.hardware.graphics.allocator@2.0"];
    header_libs = ["libhardware_headers"];
    min_sdk_version = "29";
};

in { inherit libgrallocusage; }
