{ cc_binary, cc_defaults, cc_library_shared }:
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
#

lp_defaults = cc_defaults {
    name = "lp_defaults";
    cflags = [
        "-Werror"
        "-Wextra"
    ];
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
};

liblpdump = cc_library_shared {
    name = "liblpdump";
    defaults = ["lp_defaults"];
    host_supported = true;
    shared_libs = [
        "libbase"
        "liblog"
        "liblp"
        "libprotobuf-cpp-full"
    ];
    static_libs = [
        "libjsonpbparse"
    ];
    srcs = [
        "lpdump.cc"
        "dynamic_partitions_device_info.proto"
    ];
    proto = {
        type = "full";
    };
    target = {
        android = {
            shared_libs = [
                "libcutils"
                "libfs_mgr"
            ];
        };
    };
};

lpdump = cc_binary {
    name = "lpdump";
    defaults = ["lp_defaults"];
    host_supported = true;
    shared_libs = [
        "libbase"
        "liblog"
        "liblp"
    ];
    static_libs = [
        "libjsonpbparse"
    ];
    target = {
        android = {
            srcs = [
                "lpdump_target.cc"
            ];
            shared_libs = [
                "liblpdump_interface-cpp"
                "libbinder"
                "libutils"
            ];
            required = [
                "lpdumpd"
            ];
        };
        host = {
            srcs = [
                "lpdump_host.cc"
            ];
            shared_libs = [
                "liblpdump"
            ];
        };
    };
};

lpmake = cc_binary {
    name = "lpmake";
    defaults = ["lp_defaults"];
    host_supported = true;
    shared_libs = [
        "libbase"
        "liblog"
        "liblp"
    ];
    srcs = [
        "lpmake.cc"
    ];
};

lpflash = cc_binary {
    name = "lpflash";
    defaults = ["lp_defaults"];
    host_supported = true;
    shared_libs = [
        "libbase"
        "liblog"
        "liblp"
    ];
    srcs = [
        "lpflash.cc"
    ];
};

lpdumpd = cc_binary {
    name = "lpdumpd";
    defaults = ["lp_defaults"];
    init_rc = ["lpdumpd.rc"];
    shared_libs = [
        "libbase"
        "libbinder"
        "liblog"
        "liblp"
        "liblpdump"
        "liblpdump_interface-cpp"
        "libutils"
    ];
    srcs = [
        "lpdumpd.cc"
    ];
};

lpunpack = cc_binary {
    name = "lpunpack";
    defaults = ["lp_defaults"];
    device_supported = false;
    host_supported = true;
    shared_libs = [
        "libbase"
        "liblog"
        "liblp"
        "libsparse"
    ];
    srcs = [
        "lpunpack.cc"
    ];
    cppflags = [
        "-D_FILE_OFFSET_BITS=64"
    ];
};

in { inherit liblpdump lp_defaults lpdump lpdumpd lpflash lpmake lpunpack; }
