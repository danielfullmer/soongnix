{ cc_binary, cc_defaults, cc_library_static, cc_test }:
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

liblshal = cc_library_static {
    name = "liblshal";
    shared_libs = [
        "libbase"
        "libcutils"
        "libutils"
        "libhidlbase"
        "libhidl-gen-hash"
        "libhidl-gen-utils"
        "libvintf"
    ];
    static_libs = [
        "libprocpartition"
    ];
    srcs = [
        "DebugCommand.cpp"
        "HelpCommand.cpp"
        "Lshal.cpp"
        "ListCommand.cpp"
        "PipeRelay.cpp"
        "TableEntry.cpp"
        "TextTable.cpp"
        "utils.cpp"
        "WaitCommand.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

lshal_defaults = cc_defaults {
    name = "lshal_defaults";
    shared_libs = [
        "libbase"
        "libcutils"
        "libutils"
        "libhidlbase"
        "libhidl-gen-hash"
        "libhidl-gen-utils"
        "libvintf"
    ];
    static_libs = [
        "liblshal"
        "libprocpartition"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

lshal = cc_binary {
    name = "lshal";
    defaults = ["lshal_defaults"];
    srcs = [
        "main.cpp"
    ];
};

lshal_test = cc_test {
    name = "lshal_test";
    test_suites = ["device-tests"];
    defaults = ["lshal_defaults"];
    gtest = true;
    static_libs = [
        "android.hardware.tests.baz@1.0"
        "libgmock"
    ];
    shared_libs = [
        "libhidlbase"
        "libvintf"
    ];
    srcs = [
        "test.cpp"
    ];
};

in { inherit liblshal lshal lshal_defaults lshal_test; }
