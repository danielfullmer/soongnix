{ aidl_interface, android_app, cc_binary, cc_binary_host, cc_defaults, cc_library_shared, cc_library_static, cc_test }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

aidl_defaults = cc_defaults {
    name = "aidl_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    whole_static_libs = ["libgtest_prod"];
    static_libs = [
        "libbase"
        "libcutils"
    ];
    target = {
        windows = {
            enabled = true;
        };
    };
};

#  Logic shared between aidl and its unittests
libaidl-common = cc_library_static {
    name = "libaidl-common";
    defaults = ["aidl_defaults"];
    host_supported = true;

    srcs = [
        "aidl.cpp"
        "aidl_apicheck.cpp"
        "aidl_language.cpp"
        "aidl_language_l.ll"
        "aidl_language_y.yy"
        "aidl_typenames.cpp"
        "aidl_to_cpp.cpp"
        "aidl_to_java.cpp"
        "aidl_to_ndk.cpp"
        "ast_cpp.cpp"
        "ast_java.cpp"
        "code_writer.cpp"
        "generate_cpp.cpp"
        "aidl_to_cpp_common.cpp"
        "generate_ndk.cpp"
        "generate_java.cpp"
        "generate_java_binder.cpp"
        "generate_aidl_mappings.cpp"
        "import_resolver.cpp"
        "line_reader.cpp"
        "io_delegate.cpp"
        "options.cpp"
        "type_cpp.cpp"
        "type_java.cpp"
        "type_namespace.cpp"
    ];
};

#  aidl executable
aidl = cc_binary_host {
    name = "aidl";
    defaults = ["aidl_defaults"];
    srcs = ["main.cpp"];
    static_libs = [
        "libaidl-common"
        "libbase"
    ];
};

#  aidl-cpp executable
aidl-cpp = cc_binary_host {
    name = "aidl-cpp";
    defaults = ["aidl_defaults"];
    srcs = ["main_cpp.cpp"];
    static_libs = [
        "libaidl-common"
        "libbase"
    ];
};

#  Unit tests
aidl_unittests = cc_test {
    name = "aidl_unittests";
    host_supported = true;

    test_suites = ["device-tests"];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-g"
        "-DUNIT_TEST"
    ];

    srcs = [
        "aidl_unittest.cpp"
        "ast_cpp_unittest.cpp"
        "ast_java_unittest.cpp"
        "code_writer_unittest.cpp"
        "generate_cpp_unittest.cpp"
        "io_delegate_unittest.cpp"
        "options_unittest.cpp"
        "tests/end_to_end_tests.cpp"
        "tests/fake_io_delegate.cpp"
        "tests/main.cpp"
        "tests/test_data_example_interface.cpp"
        "tests/test_data_ping_responder.cpp"
        "tests/test_data_string_constants.cpp"
        "tests/test_util.cpp"
        "type_cpp_unittest.cpp"
        "type_java_unittest.cpp"
    ];

    static_libs = [
        "libaidl-common"
        "libbase"
        "libcutils"
    ];
    target = {
        host = {
            static_libs = ["libgmock_host"];
        };
        android = {
            static_libs = [
                "libgmock"
                "liblog"
            ];
        };
    };
};

#
#  Everything below here is used for integration testing of generated AIDL code.
#
aidl_test_sentinel_searcher = cc_binary {
    name = "aidl_test_sentinel_searcher";
    srcs = ["tests/aidl_test_sentinel_searcher.cpp"];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

aidl_test_defaults = cc_defaults {
    name = "aidl_test_defaults";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "liblog"
        "libutils"
    ];
};

libaidl-integration-test = cc_library_shared {
    name = "libaidl-integration-test";
    defaults = ["aidl_test_defaults"];
    aidl = {
        export_aidl_headers = true;
        local_include_dirs = ["tests"];
        include_dirs = ["frameworks/native/aidl/binder"];
    };
    srcs = [
        "tests/android/aidl/tests/INamedCallback.aidl"
        "tests/android/aidl/tests/ITestService.aidl"
        "tests/android/aidl/tests/SimpleParcelable.aidl"
        "tests/android/aidl/tests/StructuredParcelable.aidl"
        "tests/simple_parcelable.cpp"
    ];
};

aidl_test_service = cc_binary {
    name = "aidl_test_service";
    defaults = ["aidl_test_defaults"];
    shared_libs = ["libaidl-integration-test"];
    srcs = ["tests/aidl_test_service.cpp"];
};

aidl_test_client = cc_binary {
    name = "aidl_test_client";
    defaults = ["aidl_test_defaults"];
    shared_libs = ["libaidl-integration-test"];
    srcs = [
        "tests/aidl_test_client.cpp"
        "tests/aidl_test_client_file_descriptors.cpp"
        "tests/aidl_test_client_parcelables.cpp"
        "tests/aidl_test_client_nullables.cpp"
        "tests/aidl_test_client_primitives.cpp"
        "tests/aidl_test_client_utf8_strings.cpp"
        "tests/aidl_test_client_service_exceptions.cpp"
        "tests/aidl_test_client_defaultimpl.cpp"
    ];
};

aidl_test_services = android_app {
    name = "aidl_test_services";
    platform_apis = true;
    #  Turn off Java optimization tools to speed up our test iterations.
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
    certificate = "platform";
    manifest = "tests/java_app/AndroidManifest.xml";
    resource_dirs = ["tests/java_app/resources"];
    srcs = [
        "tests/android/aidl/tests/ITestService.aidl"
        "tests/android/aidl/tests/INamedCallback.aidl"
        "tests/android/aidl/tests/StructuredParcelable.aidl"
        "tests/java_app/src/android/aidl/tests/NullableTests.java"
        "tests/java_app/src/android/aidl/tests/SimpleParcelable.java"
        "tests/java_app/src/android/aidl/tests/TestFailException.java"
        "tests/java_app/src/android/aidl/tests/TestLogger.java"
        "tests/java_app/src/android/aidl/tests/TestServiceClient.java"
    ];
    aidl = {
        include_dirs = [
            "system/tools/aidl/tests/"
            "frameworks/native/aidl/binder"
        ];
    };
};

aidl_test_loggable_interface = aidl_interface {
    name = "aidl_test_loggable_interface";
    local_include_dir = "tests";
    srcs = [
        "tests/android/aidl/loggable/ILoggableInterface.aidl"
    ];
    backend = {
        cpp = {
            gen_log = true;
        };
        ndk = {
            enabled = false;
        };
    };
};

aidl_test_loggable_interface_ndk = aidl_interface {
    name = "aidl_test_loggable_interface_ndk";
    local_include_dir = "tests";
    srcs = [
        "tests/android/aidl/loggable/ILoggableInterfaceNdk.aidl"
    ];
    backend = {
        ndk = {
            gen_log = true;
        };
    };
};

in { inherit aidl aidl-cpp aidl_defaults aidl_test_client aidl_test_defaults aidl_test_loggable_interface aidl_test_loggable_interface_ndk aidl_test_sentinel_searcher aidl_test_service aidl_test_services aidl_unittests libaidl-common libaidl-integration-test; }
