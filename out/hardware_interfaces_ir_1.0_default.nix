{ cc_binary, cc_library_shared }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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
"android.hardware.ir@1.0-impl" = cc_library_shared {
    name = "android.hardware.ir@1.0-impl";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    proprietary = true;
    srcs = ["ConsumerIr.cpp"];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "libhardware"
        "liblog"
        "libutils"
        "android.hardware.ir@1.0"
    ];
};

"android.hardware.ir@1.0-service" = cc_binary {
    relative_install_path = "hw";
    defaults = ["hidl_defaults"];
    name = "android.hardware.ir@1.0-service";
    proprietary = true;
    init_rc = ["android.hardware.ir@1.0-service.rc"];
    srcs = ["service.cpp"];

    shared_libs = [
        "liblog"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "android.hardware.ir@1.0"
    ];

};

in { inherit "android.hardware.ir@1.0-impl" "android.hardware.ir@1.0-service"; }