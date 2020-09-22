{ cc_library_headers }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

"android.hardware.sensors@2.X-shared-utils" = cc_library_headers {
    name = "android.hardware.sensors@2.X-shared-utils";
    vendor_available = true;
    defaults = ["hidl_defaults"];
    export_include_dirs = ["."];
    shared_libs = [
        "android.hardware.sensors@1.0"
        "android.hardware.sensors@2.0"
        "android.hardware.sensors@2.1"
        "libbinder"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "liblog"
        "libpower"
        "libutils"
    ];
    static_libs = [
        "android.hardware.sensors@1.0-convert"
    ];
};

in { inherit "android.hardware.sensors@2.X-shared-utils"; }