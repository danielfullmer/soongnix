{ cc_library_shared, cc_library_static }:
let

#
#  Copyright (C) 2016 The Android Open-Source Project
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

subdirs = [
    "tests"
];

#  A static library providing glue logic that simplifies creation of NVRAM HAL
#  modules.
libnvram-hal = cc_library_static {
    name = "libnvram-hal";
    srcs = ["nvram_device_adapter.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    export_include_dirs = ["include"];
    shared_libs = ["libnvram-messages"];
};

#  nvram.testing is the software-only testing NVRAM HAL module backed by the
#  fake_nvram daemon.
"nvram.testing" = cc_library_shared {
    name = "nvram.testing";
    relative_install_path = "hw";
    srcs = [
        "testing_module.c"
        "testing_nvram_implementation.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-fvisibility=hidden"
    ];
    static_libs = ["libnvram-hal"];
    shared_libs = [
        "libnvram-messages"
        "libcutils"
        "libbase"
    ];

};

in { inherit "nvram.testing" libnvram-hal; }
