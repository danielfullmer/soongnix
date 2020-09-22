{ cc_library_headers }:
let

#
#  Copyright 2019 The Android Open Source Project
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
#

"android.hardware.graphics.composer@2.4-passthrough" = cc_library_headers {
    name = "android.hardware.graphics.composer@2.4-passthrough";
    defaults = ["hidl_defaults"];
    vendor = true;
    header_libs = [
        "android.hardware.graphics.composer@2.3-passthrough"
        "android.hardware.graphics.composer@2.4-hal"
    ];
    export_header_lib_headers = [
        "android.hardware.graphics.composer@2.3-passthrough"
        "android.hardware.graphics.composer@2.4-hal"
    ];
    export_include_dirs = ["include"];
};

in { inherit "android.hardware.graphics.composer@2.4-passthrough"; }
