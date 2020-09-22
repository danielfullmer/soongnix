{ cc_defaults, cc_library_shared, cc_library_static }:
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

libboot_control_defaults = cc_defaults {
    name = "libboot_control_defaults";
    vendor = true;
    recovery_available = true;
    relative_install_path = "hw";

    cflags = [
        "-D_FILE_OFFSET_BITS=64"
        "-Werror"
        "-Wall"
        "-Wextra"
    ];

    shared_libs = [
        "android.hardware.boot@1.1"
        "libbase"
        "liblog"
    ];
    static_libs = [
        "libbootloader_message_vendor"
        "libfstab"
    ];
};

libboot_control = cc_library_static {
    name = "libboot_control";
    defaults = ["libboot_control_defaults"];
    export_include_dirs = ["include"];

    srcs = ["libboot_control.cpp"];
};

"bootctrl.default" = cc_library_shared {
    name = "bootctrl.default";
    defaults = ["libboot_control_defaults"];

    srcs = ["legacy_boot_control.cpp"];

    static_libs = [
        "libboot_control"
    ];
    shared_libs = [
        "libhardware"
    ];
};

in { inherit "bootctrl.default" libboot_control libboot_control_defaults; }
