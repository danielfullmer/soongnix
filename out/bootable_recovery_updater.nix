{ cc_binary_host, cc_defaults, cc_library_host_static, cc_library_static }:
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
#  limitations under the License.

libupdater_static_libs = cc_defaults {
    name = "libupdater_static_libs";

    static_libs = [
        "libapplypatch"
        "libbootloader_message"
        "libbspatch"
        "libedify"
        "libotautil"
        "libext4_utils"
        "libdm"
        "libfec"
        "libfec_rs"
        "libavb"
        "libverity_tree"
        "libgtest_prod"
        "liblog"
        "liblp"
        "libselinux"
        "libsparse"
        "libsquashfs_utils"
        "libbrotli"
        "libbz"
        "libziparchive"
        "libz"
        "libbase"
        "libcrypto_utils"
        "libcutils"
        "libutils"
    ];
};

libupdater_defaults = cc_defaults {
    name = "libupdater_defaults";

    defaults = [
        "recovery_defaults"
        "libupdater_static_libs"
    ];

    shared_libs = [
        "libcrypto"
    ];
};

libupdater_device_defaults = cc_defaults {
    name = "libupdater_device_defaults";

    static_libs = [
        "libfs_mgr"
        "libtune2fs"

        "libext2_com_err"
        "libext2_blkid"
        "libext2_quota"
        "libext2_uuid"
        "libext2_e2p"
        "libext2fs"
    ];
};

libupdater_core = cc_library_static {
    name = "libupdater_core";

    host_supported = true;

    defaults = [
        "recovery_defaults"
        "libupdater_defaults"
    ];

    srcs = [
        "blockimg.cpp"
        "commands.cpp"
        "install.cpp"
        "mounts.cpp"
        "updater.cpp"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };

    export_include_dirs = [
        "include"
    ];
};

libupdater_device = cc_library_static {
    name = "libupdater_device";

    defaults = [
        "recovery_defaults"
        "libupdater_defaults"
        "libupdater_device_defaults"
    ];

    srcs = [
        "dynamic_partitions.cpp"
        "updater_runtime.cpp"
        "updater_runtime_dynamic_partitions.cpp"
    ];

    static_libs = [
        "libupdater_core"
    ];

    include_dirs = [
        "external/e2fsprogs/misc"
    ];

    export_include_dirs = [
        "include"
    ];
};

libupdater_host = cc_library_host_static {
    name = "libupdater_host";

    defaults = [
        "recovery_defaults"
        "libupdater_defaults"
    ];

    srcs = [
        "build_info.cpp"
        "dynamic_partitions.cpp"
        "simulator_runtime.cpp"
        "target_files.cpp"
    ];

    static_libs = [
        "libupdater_core"
        "libfstab"
        "libc++fs"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };

    export_include_dirs = [
        "include"
    ];
};

update_host_simulator = cc_binary_host {
    name = "update_host_simulator";
    defaults = ["libupdater_static_libs"];

    srcs = ["update_simulator_main.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    static_libs = [
        "libupdater_host"
        "libupdater_core"
        "libcrypto_static"
        "libfstab"
        "libc++fs"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit libupdater_core libupdater_defaults libupdater_device libupdater_device_defaults libupdater_host libupdater_static_libs update_host_simulator; }
