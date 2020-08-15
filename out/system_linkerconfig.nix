{ cc_defaults, cc_library_headers, cc_library_static, cc_test }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
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

linkerconfig_defaults = cc_defaults {
    name = "linkerconfig_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    static_libs = [
        "libbase"
        "liblog"
    ];
    header_libs = ["linkerconfig_headers"];
};

linkerconfig_headers = cc_library_headers {
    name = "linkerconfig_headers";
    export_include_dirs = ["include"];
};

linkerconfig_modules = cc_library_static {
    name = "linkerconfig_modules";
    defaults = ["linkerconfig_defaults"];
    srcs = [
        "modules/configwriter.cc"
        "modules/link.cc"
        "modules/namespace.cc"
        "modules/section.cc"
        "modules/variables.cc"
    ];
};

linkerconfig_modules_unittest = cc_test {
    name = "linkerconfig_modules_unittest";
    defaults = ["linkerconfig_defaults"];
    srcs = [
        "modules/tests/configwriter_test.cc"
        "modules/tests/link_test.cc"
        "modules/tests/namespace_test.cc"
        "modules/tests/section_test.cc"
        "modules/tests/variables_test.cc"
    ];
    static_libs = [
        "linkerconfig_modules"
    ];
    cflags = [
        "-g"
        "-Wunused"
    ];
    test_suites = ["general-tests"];
};

in { inherit linkerconfig_defaults linkerconfig_headers linkerconfig_modules linkerconfig_modules_unittest; }
