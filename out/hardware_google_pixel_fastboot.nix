{ cc_library }:
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

"android.hardware.fastboot@1.0-impl.pixel" = cc_library {
    name = "android.hardware.fastboot@1.0-impl.pixel";
    recovery = true;
    srcs = [
        "Fastboot.cpp"
    ];
    relative_install_path = "hw";
    export_include_dirs = ["include"];
    shared_libs = [
        "libbase"
        "libhidlbase"
        "libutils"
        "libcutils"
        "android.hardware.fastboot@1.0"
    ];
};

in { inherit "android.hardware.fastboot@1.0-impl.pixel"; }
