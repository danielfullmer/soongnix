{ cc_binary, cc_library_shared, cc_library_static, prebuilt_usr_share }:
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

fake-nvram = cc_binary {
    name = "fake-nvram";
    srcs = [
        "fake_nvram.cpp"
        "fake_nvram_storage.cpp"
    ];
    clang = true;
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    static_libs = ["libnvram-core"];
    shared_libs = [
        "libnvram-messages"
        "libcrypto"
        "libminijail"
        "liblog"
        "libcutils"
        "libbase"
    ];

    init_rc = ["fake-nvram.rc"];
    required = ["fake-nvram-seccomp.policy"];
};

#  seccomp policy for fake_nvram.
"fake-nvram-seccomp.policy" = prebuilt_usr_share {
    name = "fake-nvram-seccomp.policy";
    sub_dir = "policy";
    arch = {
        arm = {
            src = "fake-nvram-seccomp-arm.policy";
        };
        arm64 = {
            src = "fake-nvram-seccomp-arm64.policy";
        };
        x86 = {
            src = "fake-nvram-seccomp-x86.policy";
        };
        x86_64 = {
            src = "fake-nvram-seccomp-x86_64.policy";
        };
    };
};

in { inherit "fake-nvram-seccomp.policy" "nvram.testing" fake-nvram libnvram-hal; }
