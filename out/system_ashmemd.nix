{ aidl_interface, cc_binary, cc_defaults, cc_library, cc_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

ashmemd_aidl_interface = aidl_interface {
    name = "ashmemd_aidl_interface";
    local_include_dir = "aidl";
    srcs = [
        "aidl/android/ashmemd/IAshmemDeviceService.aidl"
    ];
};

ashmemd_defaults = cc_defaults {
    name = "ashmemd_defaults";
    shared_libs = [
        "ashmemd_aidl_interface-cpp"
        "libbase"
        "libbinder"
        "libutils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

ashmemd = cc_binary {
    name = "ashmemd";
    defaults = ["ashmemd_defaults"];
    srcs = ["ashmemd.cpp"];
    init_rc = ["ashmemd.rc"];
};

#  This library is used to communicate with ashmemd using dlopen/dlsym. We do
#  this to avoid shared library dependecy cycles.
libashmemd_client = cc_library {
    name = "libashmemd_client";
    defaults = ["ashmemd_defaults"];
    srcs = ["ashmemd_client.cpp"];
    cflags = [
        "-Wexit-time-destructors"
        "-fno-c++-static-destructors"
    ];
};

ashmemd_test = cc_test {
    name = "ashmemd_test";
    defaults = ["ashmemd_defaults"];
    srcs = ["tests/ashmemd_test.cpp"];
    test_suites = ["device-tests"];
};

in { inherit ashmemd ashmemd_aidl_interface ashmemd_defaults ashmemd_test libashmemd_client; }
