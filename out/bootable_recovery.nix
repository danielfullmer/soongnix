{ cc_binary, cc_defaults, cc_library_static, filegroup }:
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

recovery_defaults = cc_defaults {
    name = "recovery_defaults";

    cflags = [
        "-D_FILE_OFFSET_BITS=64"

        #  Must be the same as RECOVERY_API_VERSION.
        "-DRECOVERY_API_VERSION=3"

        "-Wall"
        "-Werror"
    ];
};

librecovery_fastboot = cc_library_static {
    name = "librecovery_fastboot";
    recovery_available = true;
    defaults = [
        "recovery_defaults"
    ];

    srcs = [
        "fastboot/fastboot.cpp"
    ];

    shared_libs = [
        "libbase"
        "libbootloader_message"
        "libcutils"
        "liblog"
        "librecovery_ui"
    ];

    static_libs = [
        "librecovery_ui_default"
    ];
};

librecovery_defaults = cc_defaults {
    name = "librecovery_defaults";

    defaults = [
        "recovery_defaults"
    ];

    shared_libs = [
        "android.hardware.health@2.0"
        "libbase"
        "libbootloader_message"
        "libcrypto"
        "libcutils"
        "libfs_mgr"
        "liblog"
        "libziparchive"
    ];

    static_libs = [
        "libc++fs"
        "libinstall"
        "librecovery_fastboot"
        "libminui"
        "libotautil"

        #  external dependencies
        "libhealthhalutils"
        "libfstab"
    ];
};

librecovery = cc_library_static {
    name = "librecovery";
    recovery_available = true;

    defaults = [
        "librecovery_defaults"
    ];

    srcs = [
        "fsck_unshare_blocks.cpp"
        "recovery.cpp"
    ];

    shared_libs = [
        "libfusesideload"
        "librecovery_ui"
    ];
};

recovery = cc_binary {
    name = "recovery";
    recovery = true;

    defaults = [
        "libinstall_defaults"
        "librecovery_defaults"
    ];

    srcs = [
        "recovery_main.cpp"
    ];

    shared_libs = [
        "librecovery_ui"
    ];

    static_libs = [
        "librecovery"
        "librecovery_ui_default"
    ];

    required = [
        "e2fsdroid.recovery"
        "librecovery_ui_ext"
        "minadbd"
        "mke2fs.conf.recovery"
        "mke2fs.recovery"
        "recovery_deps"
    ];
};

#  The dynamic executable that runs after /data mounts.
recovery-persist = cc_binary {
    name = "recovery-persist";

    defaults = [
        "recovery_defaults"
    ];

    srcs = [
        "recovery-persist.cpp"
    ];

    shared_libs = [
        "libbase"
        "liblog"
        "libmetricslogger"
    ];

    static_libs = [
        "libotautil"
        "libfstab"
    ];

    init_rc = [
        "recovery-persist.rc"
    ];
};

#  The dynamic executable that runs at init.
recovery-refresh = cc_binary {
    name = "recovery-refresh";

    defaults = [
        "recovery_defaults"
    ];

    srcs = [
        "recovery-refresh.cpp"
    ];

    shared_libs = [
        "libbase"
        "liblog"
    ];

    static_libs = [
        "libotautil"
        "libfstab"
    ];

    init_rc = [
        "recovery-refresh.rc"
    ];
};

res-testdata = filegroup {
    name = "res-testdata";

    srcs = [
        "res-*/images/*_text.png"
    ];
};

in { inherit librecovery librecovery_defaults librecovery_fastboot recovery recovery-persist recovery-refresh recovery_defaults res-testdata; }
