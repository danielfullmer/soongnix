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

"android.hardware.bluetooth@1.1-service" = cc_binary {
    name = "android.hardware.bluetooth@1.1-service";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.bluetooth@1.1-service.rc"];
    srcs = [
        "service.cpp"
        "bluetooth_hci.cc"
    ];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhardware"
        "libhidlbase"
        "android.hardware.bluetooth@1.0-impl"
        "android.hardware.bluetooth@1.1"
    ];

    static_libs = [
        "android.hardware.bluetooth-hci"
    ];
};

in { inherit "android.hardware.bluetooth@1.1-service"; }
