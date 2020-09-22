{ cc_defaults, cc_library, cc_library_headers }:
let

#  Copyright 2019, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

libdataloader_defaults = cc_defaults {
    name = "libdataloader_defaults";
    cpp_std = "c++2a";
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Wno-unused-parameter"
    ];
    defaults = ["linux_bionic_supported"];
    export_include_dirs = ["include/"];
    local_include_dirs = ["include/"];
    shared_libs = [
        "libbase"
        "libincfs"
        "liblog"
        "libnativehelper"
        "libutils"
    ];
    tidy = true;
    tidy_checks = [
        "android-*"
        "cert-*"
        "clang-analyzer-security*"
        "-cert-err34-c"
        "clang-analyzer-security*"
        #  Disabling due to many unavoidable warnings from POSIX API usage.
        "-google-runtime-int"
        "-google-explicit-constructor"
        #  do not define variadic C function - JNI headers
        "-cert-dcl50-cpp"
        #  operator=() does not handle self-assignment properly - all protobuf-generated classes
        "-cert-oop54-cpp"
    ];
};

libdataloader = cc_library {
    name = "libdataloader";
    defaults = ["libdataloader_defaults"];
    srcs = [
        "dataloader_ndk.c"
        "DataLoaderConnector.cpp"
        "ManagedDataLoader.cpp"
    ];
};

libdataloader_headers = cc_library_headers {
    name = "libdataloader_headers";
    export_include_dirs = ["include/"];
};

in { inherit libdataloader libdataloader_defaults libdataloader_headers; }
