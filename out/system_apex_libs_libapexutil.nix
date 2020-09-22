{ cc_defaults, cc_library_static, cc_test }:
let

/*
 * Copyright (C) 2020 The Android Open Source Project
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

libapexutil-deps = cc_defaults {
    name = "libapexutil-deps";
    static_libs = [
        "libbase"
        "liblog"
        "libprotobuf-cpp-lite"
        "lib_apex_manifest_proto_lite"
    ];
};

libapexutil = cc_library_static {
    name = "libapexutil";
    defaults = ["libapexutil-deps"];
    export_include_dirs = ["."];
    srcs = ["apexutil.cpp"];
    host_supported = true;
};

libapexutil_tests = cc_test {
    name = "libapexutil_tests";
    srcs = ["apexutil_test.cpp"];
    defaults = ["libapexutil-deps"];
    static_libs = [
        "libapexutil"
        "libgmock"
    ];
    test_suites = [
        "device-tests"
        "general-tests"
    ];
    host_supported = true;
};

in { inherit libapexutil libapexutil-deps libapexutil_tests; }
