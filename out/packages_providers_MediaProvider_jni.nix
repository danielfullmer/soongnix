{ cc_library_shared, cc_test }:
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

libfuse_jni = cc_library_shared {
    name = "libfuse_jni";

    srcs = [
        "jni_init.cpp"
        "com_android_providers_media_FuseDaemon.cpp"
        "FuseDaemon.cpp"
        "FuseUtils.cpp"
        "MediaProviderWrapper.cpp"
        "ReaddirHelper.cpp"
        "RedactionInfo.cpp"
        "node.cpp"
    ];

    header_libs = [
        "libnativehelper_header_only"
    ];

    export_include_dirs = ["include"];

    shared_libs = [
        "liblog"
        "libfuse"
        "libandroid"
    ];

    static_libs = [
        "libbase_ndk"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
        "-Wthread-safety"

        "-D_FILE_OFFSET_BITS=64"
        "-DFUSE_USE_VERSION=34"
    ];

    tidy = true;
    tidy_checks = [
        "-google-runtime-int"
    ];

    sdk_version = "current";
    stl = "c++_static";
};

fuse_node_test = cc_test {
    name = "fuse_node_test";
    test_suites = [
        "device-tests"
        "mts"
    ];
    test_config = "fuse_node_test.xml";

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    srcs = [
        "node_test.cpp"
        "node.cpp"
        "ReaddirHelper.cpp"
        "RedactionInfo.cpp"
    ];

    local_include_dirs = ["include"];

    static_libs = [
        "libbase_ndk"
    ];

    shared_libs = [
        "liblog"
    ];

    tidy = true;

    sdk_version = "current";
    stl = "c++_static";
};

RedactionInfoTest = cc_test {
    name = "RedactionInfoTest";
    test_suites = [
        "device-tests"
        "mts"
    ];
    test_config = "RedactionInfoTest.xml";

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    srcs = [
        "RedactionInfoTest.cpp"
        "RedactionInfo.cpp"
    ];

    local_include_dirs = ["include"];

    static_libs = [
        "libbase_ndk"
    ];

    shared_libs = [
        "liblog"
    ];

    tidy = true;

    sdk_version = "current";
    stl = "c++_static";
};

FuseUtilsTest = cc_test {
    name = "FuseUtilsTest";
    test_suites = [
        "device-tests"
        "mts"
    ];
    test_config = "FuseUtilsTest.xml";

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    srcs = [
        "FuseUtilsTest.cpp"
        "FuseUtils.cpp"
    ];

    header_libs = [
        "libnativehelper_header_only"
    ];

    local_include_dirs = ["include"];

    static_libs = [
        "libbase_ndk"
    ];

    shared_libs = [
        "liblog"
    ];

    tidy = true;

    sdk_version = "current";
    stl = "c++_static";
};

in { inherit FuseUtilsTest RedactionInfoTest fuse_node_test libfuse_jni; }
