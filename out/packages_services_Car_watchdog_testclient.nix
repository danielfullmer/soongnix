{ cc_binary }:
let

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

carwatchdog_testclient = cc_binary {
    name = "carwatchdog_testclient";
    srcs = [
        "src/WatchdogClient.cpp"
        "src/main.cpp"
    ];
    cflags = [
        "-Wall"
        "-Wno-missing-field-initializers"
        "-Werror"
        "-Wno-unused-variable"
        "-Wunused-parameter"
    ];
    shared_libs = [
        "carwatchdog_aidl_interface-ndk_platform"
        "libbase"
        "libbinder_ndk"
        "liblog"
        "libutils"
    ];
    vendor = true;
};

in { inherit carwatchdog_testclient; }
