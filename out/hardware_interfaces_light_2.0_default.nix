{ cc_binary, cc_defaults, cc_library_shared }:
let

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

"android.hardware.light@2.0-impl" = cc_library_shared {
    name = "android.hardware.light@2.0-impl";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = ["Light.cpp"];

    shared_libs = [
        "libbase"
        "liblog"
        "libhidlbase"
        "libhardware"
        "libutils"
        "android.hardware.light@2.0"
    ];

};

light_service_defaults = cc_defaults {
    name = "light_service_defaults";
    relative_install_path = "hw";
    defaults = ["hidl_defaults"];
    vendor = true;

    shared_libs = [
        "liblog"
        "libbase"
        "libdl"
        "libutils"
        "libhardware"
        "libhidlbase"
        "android.hardware.light@2.0"
    ];
};

"android.hardware.light@2.0-service" = cc_binary {
    name = "android.hardware.light@2.0-service";
    defaults = ["light_service_defaults"];
    init_rc = ["android.hardware.light@2.0-service.rc"];
    srcs = ["service.cpp"];
};

"android.hardware.light@2.0-service-lazy" = cc_binary {
    name = "android.hardware.light@2.0-service-lazy";
    overrides = ["android.hardware.light@2.0-service"];
    defaults = ["light_service_defaults"];
    init_rc = ["android.hardware.light@2.0-service-lazy.rc"];
    srcs = ["serviceLazy.cpp"];
};

in { inherit "android.hardware.light@2.0-impl" "android.hardware.light@2.0-service" "android.hardware.light@2.0-service-lazy" light_service_defaults; }
