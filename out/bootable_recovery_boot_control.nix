{ cc_library_shared }:
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

"bootctrl.default" = cc_library_shared {
    name = "bootctrl.default";
    recovery_available = true;
    relative_install_path = "hw";

    srcs = ["boot_control.cpp"];

    cflags = [
        "-D_FILE_OFFSET_BITS=64"
        "-Werror"
        "-Wall"
        "-Wextra"
    ];

    shared_libs = [
        "libbase"
        "libbootloader_message"
        "libfs_mgr"
        "liblog"
    ];
};

in { inherit "bootctrl.default"; }
