{ cc_binary_host, cc_defaults, cc_test_host }:
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

sysprop_test = cc_test_host {
    name = "sysprop_test";
    defaults = ["sysprop-defaults"];
    srcs = [
        "CppGen.cpp"
        "JavaGen.cpp"
        "tests/CodeWriterUnitTest.cpp"
        "tests/CppGenTest.cpp"
        "tests/DirectoryUtilUnitTest.cpp"
        "tests/InvalidSyspropTest.cpp"
        "tests/JavaGenTest.cpp"
    ];
};

in { inherit sysprop-defaults sysprop_cpp sysprop_java sysprop_test; }
