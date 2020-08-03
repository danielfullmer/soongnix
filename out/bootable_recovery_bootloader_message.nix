{ cc_defaults, cc_library, cc_library_static }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

libbootloader_message_defaults = cc_defaults {
    name = "libbootloader_message_defaults";
    srcs = ["bootloader_message.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
    ];
    static_libs = [
        "libfstab"
    ];
    export_include_dirs = ["include"];
};

libbootloader_message = cc_library {
    name = "libbootloader_message";
    defaults = [
        "libbootloader_message_defaults"
    ];
    recovery_available = true;
};

libbootloader_message_vendor = cc_library_static {
    name = "libbootloader_message_vendor";
    defaults = [
        "libbootloader_message_defaults"
    ];
    vendor = true;
};

in { inherit libbootloader_message libbootloader_message_defaults libbootloader_message_vendor; }
