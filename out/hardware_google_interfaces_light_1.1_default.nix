{ cc_binary, cc_defaults }:
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

"hardware.google.light_defaults-1.1" = cc_defaults {
    name = "hardware.google.light_defaults-1.1";
    relative_install_path = "hw";
    vendor = true;
    srcs = [
        "Light.cpp"
        "LightExt.cpp"
    ];
    shared_libs = [
        "liblog"
        "libbase"
        "libutils"
        "libhardware"
        "libhidlbase"
        "android.hardware.light@2.0"
        "hardware.google.light@1.0"
        "hardware.google.light@1.1"
    ];
};

"hardware.google.light@1.1-service" = cc_binary {
    name = "hardware.google.light@1.1-service";
    defaults = [
        "hardware.google.light_defaults-1.1"
        "hidl_defaults"
    ];
    init_rc = ["hardware.google.light@1.1-service.rc"];
    srcs = [
        "service.cpp"
    ];
};

in { inherit "hardware.google.light@1.1-service" "hardware.google.light_defaults-1.1"; }
