{ cc_binary_host, cc_defaults, cc_library_host_static, cc_test_host }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

dicttoolkit_defaults = cc_defaults {
    name = "dicttoolkit_defaults";

    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Weffc++"
        "-Wformat=2"
        "-Wcast-qual"
        "-Wcast-align"
        "-Wwrite-strings"
        "-Wfloat-equal"
        "-Wpointer-arith"
        "-Winit-self"
        "-Wredundant-decls"
        "-Woverloaded-virtual"
        "-Wsign-promo"
        "-Wno-system-headers"

        #  To suppress compiler warnings for unused variables/functions used for debug features etc.
        "-Wno-unused-parameter"
        "-Wno-unused-function"
    ];

    local_include_dirs = ["src"];
    #  TODO
    include_dirs = ["packages/inputmethods/LatinIME/native/jni/src"];

    product_variables = {
        unbundled_build = {
            enabled = false;
        };
    };
};

liblatinime_dicttoolkit = cc_library_host_static {
    name = "liblatinime_dicttoolkit";
    defaults = ["dicttoolkit_defaults"];

    srcs = [
        "src/command_executors/diff_executor.cpp"
        "src/command_executors/header_executor.cpp"
        "src/command_executors/help_executor.cpp"
        "src/command_executors/info_executor.cpp"
        "src/command_executors/makedict_executor.cpp"
        "src/offdevice_intermediate_dict/offdevice_intermediate_dict.cpp"
        "src/utils/arguments_parser.cpp"
        "src/utils/command_utils.cpp"
        "src/utils/utf8_utils.cpp"

        ":LATIN_IME_CORE_SRC_FILES"
    ];
};

dicttoolkit = cc_binary_host {
    name = "dicttoolkit";
    defaults = ["dicttoolkit_defaults"];

    srcs = ["dict_toolkit_main.cpp"];
    static_libs = ["liblatinime_dicttoolkit"];
};

dicttoolkit_unittests = cc_test_host {
    name = "dicttoolkit_unittests";
    defaults = ["dicttoolkit_defaults"];

    srcs = [
        "tests/command_executors/diff_executor_test.cpp"
        "tests/command_executors/header_executor_test.cpp"
        "tests/command_executors/info_executor_test.cpp"
        "tests/command_executors/makedict_executor_test.cpp"
        "tests/dict_toolkit_defines_test.cpp"
        "tests/offdevice_intermediate_dict/offdevice_intermediate_dict_test.cpp"
        "tests/utils/arguments_parser_test.cpp"
        "tests/utils/command_utils_test.cpp"
        "tests/utils/utf8_utils_test.cpp"
    ];
    static_libs = ["liblatinime_dicttoolkit"];
};

in { inherit dicttoolkit dicttoolkit_defaults dicttoolkit_unittests liblatinime_dicttoolkit; }
