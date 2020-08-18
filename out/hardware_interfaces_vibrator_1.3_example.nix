{ cc_binary }:
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

"android.hardware.vibrator@1.3-service.example" = cc_binary {
    name = "android.hardware.vibrator@1.3-service.example";
    vendor = true;
    relative_install_path = "hw";
    init_rc = ["android.hardware.vibrator@1.3-service.example.rc"];
    vintf_fragments = ["android.hardware.vibrator@1.3-service.example.xml"];
    srcs = [
        "service.cpp"
        "Vibrator.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "android.hardware.vibrator@1.0"
        "android.hardware.vibrator@1.1"
        "android.hardware.vibrator@1.2"
        "android.hardware.vibrator@1.3"
    ];
};

in { inherit "android.hardware.vibrator@1.3-service.example"; }