{ cc_library, cc_library_headers }:
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

#  TODO(b/118715870): cleanup header files
libnativewindow_headers = cc_library_headers {
    name = "libnativewindow_headers";
    export_include_dirs = ["include"];
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    min_sdk_version = "29";
};

#  Android O

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

    stubs = {
        symbol_file = "libnativewindow.map.txt";
        versions = ["29"];
    };
};

subdirs = ["tests"];

in { inherit libnativewindow libnativewindow_headers; }
