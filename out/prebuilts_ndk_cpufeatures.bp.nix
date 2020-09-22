{ cc_library_static }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

cpufeatures = cc_library_static {
    name = "cpufeatures";
    vendor_available = true;
    native_bridge_supported = true;
    srcs = ["current/sources/android/cpufeatures/cpu-features.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    sdk_version = "minimum";
    export_include_dirs = ["current/sources/android/cpufeatures"];
};

in { inherit cpufeatures; }
