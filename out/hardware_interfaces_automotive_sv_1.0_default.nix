{ cc_binary }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

"android.hardware.automotive.sv@1.0-service" = cc_binary {
    name = "android.hardware.automotive.sv@1.0-service";
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "service.cpp"
        "SurroundViewService.cpp"
        "SurroundView2dSession.cpp"
        "SurroundView3dSession.cpp"
    ];
    init_rc = ["android.hardware.automotive.sv@1.0-service.rc"];
    vintf_fragments = ["android.hardware.automotive.sv@1.0-service.xml"];
    shared_libs = [
        "android.hardware.automotive.sv@1.0"
        "android.hidl.memory@1.0"
        "libbase"
        "libbinder"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libui"
        "libutils"
        "libhidlmemory"
    ];

    cflags = [
        "-O0"
        "-g"
    ];
};

in { inherit "android.hardware.automotive.sv@1.0-service"; }
