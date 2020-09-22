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

"android.hardware.atrace@1.0-service.pixel" = cc_binary {
    name = "android.hardware.atrace@1.0-service.pixel";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.atrace@1.0-service.pixel.rc"];
    vintf_fragments = ["android.hardware.atrace@1.0-service.pixel.xml"];
    srcs = [
        "AtraceDevice.cpp"
        "service.cpp"
    ];
    shared_libs = [
        "liblog"
        "libbase"
        "libutils"
        "libhidlbase"
        "android.hardware.atrace@1.0"
    ];
};

in { inherit "android.hardware.atrace@1.0-service.pixel"; }
