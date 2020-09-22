{ cc_library }:
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

libkeymaster4_1support = cc_library {
    name = "libkeymaster4_1support";
    vendor_available = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = [
        "attestation_record.cpp"
        "Keymaster.cpp"
        "Keymaster3.cpp"
        "Keymaster4.cpp"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
        "android.hardware.keymaster@3.0"
        "android.hardware.keymaster@4.0"
        "android.hardware.keymaster@4.1"
        "libbase"
        "libcrypto"
        "libhidlbase"
        "libkeymaster4support"
        "libutils"
    ];
    export_shared_lib_headers = [
        "android.hardware.keymaster@4.1"
        "libkeymaster4support"
    ];
};

in { inherit libkeymaster4_1support; }