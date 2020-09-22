{ cc_binary, cc_defaults, cc_library_static, filegroup, prebuilt_etc }:
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
        "android.hardware.boot@1.0"
        "android.hardware.boot@1.1"
        "libbase"
        "libbootloader_message"
        "libcrypto"
        "libcutils"
        "libfs_mgr"
        "liblp"
        "liblog"
        "libprotobuf-cpp-lite"
        "libziparchive"
    ];

    static_libs = [
        "libc++fs"
        "libinstall"
        "librecovery_fastboot"
        "libminui"
        "librecovery_utils"
        "libotautil"
        "libsnapshot_nobinder"
    ];
};

librecovery = cc_library_static {
    name = "librecovery";
    recovery_available = true;

    defaults = [
        "librecovery_defaults"
    ];

    srcs = [
        "recovery.cpp"
    ];

    shared_libs = [
        "librecovery_ui"
    ];
};

"init_recovery.rc" = prebuilt_etc {
    name = "init_recovery.rc";
    filename = "init.rc";
    src = "etc/init.rc";
    sub_dir = "init/hw";
    recovery = true;
};

recovery = cc_binary {
    name = "recovery";
    recovery = true;

    defaults = [
        "libinstall_defaults"
        "librecovery_defaults"
        "librecovery_utils_defaults"
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
        "init_recovery.rc"
        "librecovery_ui_ext"
        "minadbd"
        "mke2fs.conf.recovery"
        "mke2fs.recovery"
        "recovery_deps"
        "ueventd.rc.recovery"
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
    ];

    static_libs = [
        "librecovery_utils"
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
        "librecovery_utils"
    ];

    init_rc = [
        "recovery-refresh.rc"
    ];
};

res-testdata = filegroup {
    name = "res-testdata";

    srcs = [
        "res-hdpi/images/erasing_text.png"
        "res-hdpi/images/error_text.png"
        "res-hdpi/images/installing_security_text.png"
        "res-hdpi/images/installing_text.png"
        "res-hdpi/images/no_command_text.png"
        "res-mdpi/images/erasing_text.png"
        "res-mdpi/images/error_text.png"
        "res-mdpi/images/installing_security_text.png"
        "res-mdpi/images/installing_text.png"
        "res-mdpi/images/no_command_text.png"
        "res-xhdpi/images/erasing_text.png"
        "res-xhdpi/images/error_text.png"
        "res-xhdpi/images/installing_security_text.png"
        "res-xhdpi/images/installing_text.png"
        "res-xhdpi/images/no_command_text.png"
        "res-xxhdpi/images/erasing_text.png"
        "res-xxhdpi/images/error_text.png"
        "res-xxhdpi/images/installing_security_text.png"
        "res-xxhdpi/images/installing_text.png"
        "res-xxhdpi/images/no_command_text.png"
        "res-xxxhdpi/images/erasing_text.png"
        "res-xxxhdpi/images/error_text.png"
        "res-xxxhdpi/images/installing_security_text.png"
        "res-xxxhdpi/images/installing_text.png"
        "res-xxxhdpi/images/no_command_text.png"
    ];
};

in { inherit "init_recovery.rc" librecovery librecovery_defaults librecovery_fastboot recovery recovery-persist recovery-refresh recovery_defaults res-testdata; }
