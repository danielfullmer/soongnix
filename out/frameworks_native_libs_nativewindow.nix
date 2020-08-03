{ cc_library, cc_library_headers, llndk_library, ndk_headers, ndk_library }:
let

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

libnativewindow_ndk_headers = ndk_headers {
    name = "libnativewindow_ndk_headers";
    from = "include/android";
    to = "android";
    srcs = ["include/android/*.h"];
    license = "NOTICE";
};

#  TODO(b/118715870): cleanup header files
libnativewindow_headers = cc_library_headers {
    name = "libnativewindow_headers";
    export_include_dirs = ["include"];
    vendor_available = true;
};

libnativewindow = ndk_library {
    name = "libnativewindow";
    symbol_file = "libnativewindow.map.txt";

    #  Android O
    first_version = "26";
};

libnativewindow = cc_library {
    name = "libnativewindow";
    export_include_dirs = [
        "include"
        "include-private"
    ];

    clang = true;

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-enum-compare"
        "-Wno-unused-function"
    ];

    version_script = "libnativewindow.map.txt";

    srcs = [
        "AHardwareBuffer.cpp"
        "ANativeWindow.cpp"
    ];

    shared_libs = [
        "libhardware"
        "libcutils"
        "liblog"
        "libutils"
        "libui"
        "android.hardware.graphics.common@1.1"
    ];

    static_libs = [
        "libarect"
        "libgrallocusage"
    ];

    header_libs = [
        "libnativebase_headers"
        "libnativewindow_headers"
    ];

    #  headers we include in our public headers
    export_static_lib_headers = [
        "libarect"
    ];

    export_header_lib_headers = [
        "libnativebase_headers"
    ];
};

libnativewindow = llndk_library {
    name = "libnativewindow";
    symbol_file = "libnativewindow.map.txt";
    unversioned = true;
    export_include_dirs = ["include"];
};

subdirs = ["tests"];

in { inherit libnativewindow libnativewindow_headers libnativewindow_ndk_headers; }
