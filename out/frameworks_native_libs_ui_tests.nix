{ cc_test }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

Region_test = cc_test {
    name = "Region_test";
    shared_libs = ["libui"];
    srcs = ["Region_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

colorspace_test = cc_test {
    name = "colorspace_test";
    shared_libs = ["libui"];
    srcs = ["colorspace_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

GraphicBufferAllocator_test = cc_test {
    name = "GraphicBufferAllocator_test";
    header_libs = [
        "libnativewindow_headers"
    ];
    static_libs = [
        "libgmock"
    ];
    shared_libs = [
        "libhidlbase"
        "liblog"
        "libui"
    ];
    srcs = [
        "GraphicBufferAllocator_test.cpp"
        "mock/MockGrallocAllocator.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

GraphicBuffer_test = cc_test {
    name = "GraphicBuffer_test";
    header_libs = [
        "libnativewindow_headers"
    ];
    shared_libs = [
        "libcutils"
        "libhidlbase"
        "libui"
        "libutils"
    ];
    srcs = ["GraphicBuffer_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

#  This test has a main method, and requires a separate binary to be built.
GraphicBufferOverBinder_test = cc_test {
    name = "GraphicBufferOverBinder_test";
    srcs = ["GraphicBufferOverBinder_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbinder"
        "libgui"
        "liblog"
        "libui"
        "libutils"
    ];
};

Size_test = cc_test {
    name = "Size_test";
    test_suites = ["device-tests"];
    shared_libs = ["libui"];
    srcs = ["Size_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit GraphicBufferAllocator_test GraphicBufferOverBinder_test GraphicBuffer_test Region_test Size_test colorspace_test; }
