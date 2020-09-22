{ cc_binary_host, cc_defaults, cc_test_host, java_defaults, java_library }:
let

/*
 * Copyright (C) 2018 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

sysprop-defaults = cc_defaults {
    name = "sysprop-defaults";
    srcs = [
        "sysprop.proto"
        "Common.cpp"
        "CodeWriter.cpp"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    static_libs = ["libc++fs"];
    proto = {
        type = "full";
    };
    local_include_dirs = ["include"];
};

sysprop_cpp = cc_binary_host {
    name = "sysprop_cpp";
    defaults = ["sysprop-defaults"];
    srcs = [
        "CppGen.cpp"
        "CppMain.cpp"
    ];
};

sysprop_java = cc_binary_host {
    name = "sysprop_java";
    defaults = ["sysprop-defaults"];
    srcs = [
        "JavaGen.cpp"
        "JavaMain.cpp"
    ];
};

sysprop_api_checker = cc_binary_host {
    name = "sysprop_api_checker";
    defaults = ["sysprop-defaults"];
    srcs = [
        "ApiChecker.cpp"
        "ApiCheckerMain.cpp"
    ];
};

sysprop_api_dump = cc_binary_host {
    name = "sysprop_api_dump";
    defaults = ["sysprop-defaults"];
    srcs = ["ApiDumpMain.cpp"];
};

sysprop_test = cc_test_host {
    name = "sysprop_test";
    defaults = ["sysprop-defaults"];
    srcs = [
        "ApiChecker.cpp"
        "CppGen.cpp"
        "JavaGen.cpp"
        "tests/ApiCheckerTest.cpp"
        "tests/CodeWriterUnitTest.cpp"
        "tests/CppGenTest.cpp"
        "tests/InvalidSyspropTest.cpp"
        "tests/JavaGenTest.cpp"
    ];
    test_suites = ["general-tests"];
};

sysprop-library-stub-defaults = java_defaults {
    name = "sysprop-library-stub-defaults";
    srcs = [
        "stub/android/os/SystemProperties.java"
    ];
    installable = false;
    sdk_version = "core_current";
};

sysprop-library-stub-platform = java_library {
    name = "sysprop-library-stub-platform";
    defaults = ["sysprop-library-stub-defaults"];
};

sysprop-library-stub-vendor = java_library {
    name = "sysprop-library-stub-vendor";
    defaults = ["sysprop-library-stub-defaults"];
    soc_specific = true;
};

in { inherit sysprop-defaults sysprop-library-stub-defaults sysprop-library-stub-platform sysprop-library-stub-vendor sysprop_api_checker sysprop_api_dump sysprop_cpp sysprop_java sysprop_test; }
