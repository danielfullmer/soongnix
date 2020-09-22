{ cc_library_static }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

"android.hardware.gnss@common-default-lib" = cc_library_static {
    name = "android.hardware.gnss@common-default-lib";
    vendor_available = true;
    relative_install_path = "hw";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = [
        "Utils.cpp"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
        "libhidlbase"
        "libutils"
        "android.hardware.gnss@1.0"
        "android.hardware.gnss@2.0"
        "android.hardware.gnss@2.1"
    ];
};

in { inherit "android.hardware.gnss@common-default-lib"; }
