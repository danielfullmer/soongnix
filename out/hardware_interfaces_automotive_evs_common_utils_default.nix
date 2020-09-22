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

"android.hardware.automotive.evs@common-default-lib" = cc_library_static {
    host_supported = true;
    name = "android.hardware.automotive.evs@common-default-lib";
    vendor_available = true;
    relative_install_path = "hw";
    cflags = [
        "-O0"
        "-g"
    ];
    srcs = [
        "FormatConvert.cpp"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
    ];
};

in { inherit "android.hardware.automotive.evs@common-default-lib"; }