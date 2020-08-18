{ cc_binary }:
let

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

"android.hardware.power.stats@1.0-service.mock" = cc_binary {
    name = "android.hardware.power.stats@1.0-service.mock";
    relative_install_path = "hw";
    init_rc = ["android.hardware.power.stats@1.0-service.rc"];
    srcs = [
        "service.cpp"
        "PowerStats.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "android.hardware.power.stats@1.0"
    ];
    vendor = true;
    vintf_fragments = ["android.hardware.power.stats@1.0-service-mock.xml"];
};

in { inherit "android.hardware.power.stats@1.0-service.mock"; }
