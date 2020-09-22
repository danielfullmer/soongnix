{ cc_defaults, cc_library, cc_library_headers, cc_library_static, cc_test, filegroup }:
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

"service.incremental-proto-defaults" = cc_defaults {
    name = "service.incremental-proto-defaults";

    cpp_std = "c++2a";
    proto = {
        type = "lite";
    };
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

"service.incremental-defaults" = cc_defaults {
    name = "service.incremental-defaults";
    defaults = ["service.incremental-proto-defaults"];
    local_include_dirs = ["include/"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
    ];

    static_libs = [
        "libbase"
        "libext2_uuid"
        "libdataloader_aidl-cpp"
        "libincremental_aidl-cpp"
        "libincremental_manager_aidl-cpp"
        "libnativehelper"
        "libprotobuf-cpp-lite"
        "service.incremental.proto"
        "libutils"
        "libvold_binder"
        "libc++fs"
    ];
    shared_libs = [
        "libandroidfw"
        "libbinder"
        "libcrypto"
        "libcutils"
        "libincfs"
        "liblog"
        "libz"
        "libziparchive"
    ];
};

"service.incremental_srcs" = filegroup {
    name = "service.incremental_srcs";
    srcs = [
        "incremental_service.c"
        "IncrementalService.cpp"
        "IncrementalServiceValidation.cpp"
        "BinderIncrementalService.cpp"
        "path.cpp"
        "ServiceWrappers.cpp"
    ];
};

"service.incremental" = cc_library {
    name = "service.incremental";
    defaults = [
        "service.incremental-defaults"
    ];

    export_include_dirs = ["include/"];
    srcs = [
        ":service.incremental_srcs"
    ];
};

"service.incremental_headers" = cc_library_headers {
    name = "service.incremental_headers";
    export_include_dirs = ["include/"];
};

"service.incremental.proto" = cc_library_static {
    name = "service.incremental.proto";
    defaults = ["service.incremental-proto-defaults"];
    proto = {
        export_proto_headers = true;
    };

    srcs = [
        "Metadata.proto"
    ];
};

"service.incremental_test" = cc_test {
    name = "service.incremental_test";
    defaults = ["service.incremental-defaults"];
    test_suites = ["device-tests"];
    srcs = [
        ":service.incremental_srcs"
        "test/IncrementalServiceTest.cpp"
        "test/path_test.cpp"
    ];
    static_libs = [
        "libgmock"
    ];
};

in { inherit "service.incremental" "service.incremental-defaults" "service.incremental-proto-defaults" "service.incremental.proto" "service.incremental_headers" "service.incremental_srcs" "service.incremental_test"; }
