{ cc_defaults, cc_library_static, cc_test }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

libwifilogd_flags = cc_defaults {
    name = "libwifilogd_flags";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Weffc++"
        "-Weverything"
        "-Wno-c++98-compat"
        "-Wno-c++98-compat-pedantic"
        "-Wno-padded"
        "-Werror"

    ];
    #include_dirs = ["system/connectivity"];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
    ];

};

#  wifilogd static library
libwifilogd = cc_library_static {
    name = "libwifilogd";
    srcs = [
        "command_processor.cpp"
        "main_loop.cpp"
        "memory_reader.cpp"
        "message_buffer.cpp"
        "os.cpp"
        "raw_os.cpp"
    ];
    defaults = ["libwifilogd_flags"];
};

#  wifilogd unit tests.
wifilogd_unit_test = cc_test {
    name = "wifilogd_unit_test";
    test_suites = ["device-tests"];
    defaults = ["libwifilogd_flags"];
    cppflags = [
        "-Wno-undef"
        "-Wno-missing-noreturn"
        "-Wno-shift-sign-overflow"
        "-Wno-used-but-marked-unused"
        "-Wno-deprecated"
        "-Wno-weak-vtables"
        "-Wno-sign-conversion"
        "-Wno-global-constructors"
        "-Wno-covered-switch-default"
    ];
    srcs = [
        "tests/byte_buffer_unittest.cpp"
        "tests/command_processor_unittest.cpp"
        "tests/local_utils_unittest.cpp"
        "tests/main.cpp"
        "tests/main_loop_unittest.cpp"
        "tests/memory_reader_unittest.cpp"
        "tests/message_buffer_unittest.cpp"
        "tests/mock_command_processor.cpp"
        "tests/mock_os.cpp"
        "tests/mock_raw_os.cpp"
        "tests/os_unittest.cpp"
        "tests/protocol_unittest.cpp"
    ];
    static_libs = [
        "libgmock"
        "libwifilogd"
    ];
};

in { inherit libwifilogd libwifilogd_flags wifilogd_unit_test; }
