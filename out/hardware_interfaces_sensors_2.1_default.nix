{ cc_binary }:
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

"android.hardware.sensors@2.1-service.mock" = cc_binary {
    name = "android.hardware.sensors@2.1-service.mock";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "SensorsV2_1.cpp"
        "service.cpp"
    ];
    init_rc = ["android.hardware.sensors@2.1-service-mock.rc"];
    header_libs = [
        "android.hardware.sensors@2.X-shared-utils"
    ];
    shared_libs = [
        "android.hardware.sensors@1.0"
        "android.hardware.sensors@2.0"
        "android.hardware.sensors@2.1"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "liblog"
        "libpower"
        "libutils"
    ];
    static_libs = [
        "android.hardware.sensors@1.0-convert"
        "android.hardware.sensors@2.X-shared-impl"
    ];
    vintf_fragments = ["android.hardware.sensors@2.1.xml"];
};

in { inherit "android.hardware.sensors@2.1-service.mock"; }