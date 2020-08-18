{ cc_defaults, cc_library }:
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

#  Utility code common for all HAL versions.
VtsHalNetNetdTestUtils = cc_library {
    name = "VtsHalNetNetdTestUtils";
    srcs = [
        "VtsHalNetNetdTestUtils.cpp"
    ];
    export_include_dirs = ["."];
    shared_libs = [
        "libandroid_net"
        "libbase"
    ];
    cflags = [
        "-Og"
        "-Wall"
        "-Werror"
    ];
};

#  Common build settings for all HAL versions.
VtsHalNetNetdTestDefaults = cc_defaults {
    name = "VtsHalNetNetdTestDefaults";
    shared_libs = [
        "libandroid_net"
        "libbase"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "VtsHalHidlTargetTestBase"
        "VtsHalNetNetdTestUtils"
    ];
    cflags = [
        "-Og"
        "-Wall"
        "-Werror"
    ];
    defaults = ["VtsHalTargetTestDefaults"];
};

in { inherit VtsHalNetNetdTestDefaults VtsHalNetNetdTestUtils; }