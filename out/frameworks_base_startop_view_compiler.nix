{ cc_binary, cc_binary_host, cc_defaults, cc_library_static, cc_test_host, genrule }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

viewcompiler_defaults = cc_defaults {
    name = "viewcompiler_defaults";
    defaults = ["libdexfile_static_defaults"];
    header_libs = [
        "libbase_headers"
    ];
    shared_libs = [
        "libbase"
        "slicer"
    ];
    static_libs = [
        "libtinyxml2"
        "liblog"
        "libutils"
        "libziparchive"
    ];
    cppflags = ["-std=c++17"];
    target = {
        android = {
            shared_libs = [
                "libandroidfw"
            ];
        };
        host = {
            static_libs = [
                "libandroidfw"
            ];
        };
    };
};

libviewcompiler = cc_library_static {
    name = "libviewcompiler";
    defaults = ["viewcompiler_defaults"];
    srcs = [
        "apk_layout_compiler.cc"
        "dex_builder.cc"
        "dex_layout_compiler.cc"
        "java_lang_builder.cc"
        "tinyxml_layout_parser.cc"
        "util.cc"
        "layout_validation.cc"
    ];
    host_supported = true;
};

viewcompiler = cc_binary {
    name = "viewcompiler";
    defaults = ["viewcompiler_defaults"];
    srcs = [
        "main.cc"
    ];
    static_libs = [
        "libgflags"
        "libviewcompiler"
    ];
    host_supported = true;
};

view-compiler-tests = cc_test_host {
    name = "view-compiler-tests";
    defaults = ["viewcompiler_defaults"];
    srcs = [
        "dex_builder_test.cc"
        "layout_validation_test.cc"
        "util_test.cc"
    ];
    static_libs = [
        "libviewcompiler"
    ];
    test_suites = ["general-tests"];
};

dex_testcase_generator = cc_binary_host {
    name = "dex_testcase_generator";
    defaults = ["viewcompiler_defaults"];
    srcs = ["dex_testcase_generator.cc"];
    static_libs = [
        "libviewcompiler"
    ];
};

generate_dex_testcases = genrule {
    name = "generate_dex_testcases";
    tools = [":dex_testcase_generator"];
    cmd = "$(location :dex_testcase_generator) $(genDir)";
    out = [
        "simple.dex"
        "trivial.dex"
    ];
};

in { inherit dex_testcase_generator generate_dex_testcases libviewcompiler view-compiler-tests viewcompiler viewcompiler_defaults; }
