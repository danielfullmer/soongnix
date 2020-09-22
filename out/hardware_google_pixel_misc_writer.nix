{ cc_binary, cc_defaults, cc_library_static, cc_test }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

misc_writer_defaults = cc_defaults {
    name = "misc_writer_defaults";
    vendor = true;
    cpp_std = "experimental";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbase"
    ];

    static_libs = [
        "libbootloader_message_vendor"
        "libfstab"
    ];
};

#  TODO(xunchang) Remove duplicates after we convert the device specific librecovery_ui to recovery
#  module. Then libmisc_writer can build as a vendor module available in recovery.
libmisc_writer = cc_library_static {
    name = "libmisc_writer";
    cpp_std = "experimental";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbase"
    ];

    static_libs = [
        "libbootloader_message"
        "libfstab"
    ];

    srcs = [
        "misc_writer.cpp"
    ];

    export_include_dirs = [
        "include"
    ];
};

libmisc_writer_vendor = cc_library_static {
    name = "libmisc_writer_vendor";
    defaults = [
        "misc_writer_defaults"
    ];

    srcs = [
        "misc_writer.cpp"
    ];

    export_include_dirs = [
        "include"
    ];
};

misc_writer = cc_binary {
    name = "misc_writer";
    defaults = [
        "misc_writer_defaults"
    ];

    srcs = [
        "misc_writer_main.cpp"
    ];

    static_libs = [
        "libmisc_writer_vendor"
    ];
};

misc_writer_test = cc_test {
    name = "misc_writer_test";
    defaults = [
        "misc_writer_defaults"
    ];

    srcs = [
        "misc_writer_test.cpp"
    ];
    test_suites = ["device-tests"];

    static_libs = [
        "libmisc_writer_vendor"
    ];
};

in { inherit libmisc_writer libmisc_writer_vendor misc_writer misc_writer_defaults misc_writer_test; }
