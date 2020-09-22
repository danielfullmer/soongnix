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
#

"android.hardware.graphics.composer@2.4-service-sm8150" = cc_binary {
    name = "android.hardware.graphics.composer@2.4-service-sm8150";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = ["service.cpp"];
    init_rc = ["android.hardware.graphics.composer@2.4-service-sm8150.rc"];
    header_libs = [
        "android.hardware.graphics.composer@2.4-passthrough"
    ];
    shared_libs = [
        "android.hardware.graphics.composer@2.1"
        "android.hardware.graphics.composer@2.1-resources"
        "android.hardware.graphics.composer@2.2"
        "android.hardware.graphics.composer@2.3"
        "android.hardware.graphics.composer@2.4"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "libbase"
        "libbinder"
        "libcutils"
        "libfmq"
        "libhardware"
        "libhidlbase"
        "libhwc2on1adapter"
        "libhwc2onfbadapter"
        "liblog"
        "libsync"
        "libutils"
    ];
};

in { inherit "android.hardware.graphics.composer@2.4-service-sm8150"; }
