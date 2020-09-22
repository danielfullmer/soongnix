{ aidl_interface, aidl_interfaces_metadata, bootstrap_go_package, cc_defaults, filegroup, java_defaults }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

aidl-soong-rules = bootstrap_go_package {
    name = "aidl-soong-rules";
    pkgPath = "android/soong/aidl";
    deps = [
        "blueprint"
        "soong"
        "soong-android"
        "soong-cc"
        "soong-genrule"
        "soong-phony"
        "soong-java"
    ];
    srcs = [
        "aidl_interface.go"
        "properties.go"
    ];
    testSrcs = [
        "aidl_test.go"
    ];
    pluginFor = ["soong_build"];
};

aidl_metadata_json = aidl_interfaces_metadata {
    name = "aidl_metadata_json";
    visibility = ["//system/tools/aidl:__subpackages__"];
};

#  These configurations are inherited by all aidl-gen modules

aidl-cpp-module-defaults = cc_defaults {
    name = "aidl-cpp-module-defaults";
    #  TODO(b/31559095): remove when host bionic is available
    defaults = ["libbinder_ndk_host_user"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra-semi"
    ];
};

aidl-java-module-defaults = java_defaults {
    name = "aidl-java-module-defaults";
};

#  Tests

aidl-test-filegroup = filegroup {
    name = "aidl-test-filegroup";
    srcs = [
        "tests_1/some_package/IFoo.aidl"
        "tests_1/some_package/Thing.aidl"
        "tests_1/some_package/sub_package/IFoo.aidl"
        "tests_1/some_package/sub_package/SubThing.aidl"
    ];
};

#  Copy of test-piece-1 as test only. Creating a separate library because 'vendor_available' is
#  contagious.
test-variants = aidl_interface {
    name = "test-variants";
    unstable = true;
    local_include_dir = "tests_1";
    vendor_available = true;
    host_supported = true;
    srcs = [
        ":aidl-test-filegroup"
    ];
};

test-piece-1 = aidl_interface {
    name = "test-piece-1";
    local_include_dir = "tests_1";
    srcs = [
        "tests_1/some_package/IFoo.aidl"
        "tests_1/some_package/Thing.aidl"
        "tests_1/some_package/sub_package/IFoo.aidl" #  testing glob w/o filegroup
        "tests_1/some_package/sub_package/SubThing.aidl"
    ];
    versions = [
        "1"
        "2"
        "3"
    ];
};

test-piece-2 = aidl_interface {
    name = "test-piece-2";
    local_include_dir = "tests_1";
    srcs = [
        "tests_1/INoPackage.aidl"
        "tests_1/some_package/IBar.aidl"
    ];
    imports = [
        "test-piece-1"
    ];
    versions = ["1"];
};

test-piece-3 = aidl_interface {
    name = "test-piece-3";
    local_include_dir = "tests_1";
    srcs = [
        "tests_1/other_package/IBaz.aidl"
    ];
    imports = [
        "test-piece-2"
    ];
    versions = ["1"];
};

test-piece-4 = aidl_interface {
    name = "test-piece-4";
    local_include_dir = "tests_2";
    srcs = [
        "tests_2/another_package/IFaz.aidl"
    ];
    imports = [
        "test-piece-1"
    ];
    versions = ["1"];
};

test-root-package = aidl_interface {
    name = "test-root-package";
    srcs = [
        "test_package/IBaz.aidl"
    ];
    imports = [
        "test-piece-2"
    ];
    versions = [
        "1"
        "2"
    ];
};

in { inherit aidl-cpp-module-defaults aidl-java-module-defaults aidl-soong-rules aidl-test-filegroup aidl_metadata_json test-piece-1 test-piece-2 test-piece-3 test-piece-4 test-root-package test-variants; }
