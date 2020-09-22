{ cc_defaults, cc_test }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

gmock_test_defaults = cc_defaults {
    name = "gmock_test_defaults";
    host_supported = true;
    gtest = false;
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-Wno-unused-private-field"
    ];
    include_dirs = [
        "external/googletest/googlemock"
        "external/googletest/googletest"
    ];
    static_libs = [
        "libgmock_main"
        "libgmock"
        "libgtest"
    ];
};

gmock_tests = cc_test {
    name = "gmock_tests";
    defaults = ["gmock_test_defaults"];
    test_per_src = true;
    srcs = [
        "gmock-actions_test.cc"
        "gmock-cardinalities_test.cc"

        #  Test is disabled because Android doesn't build gmock with exceptions.
        # "gmock_ex_test.cc",

        "gmock-generated-actions_test.cc"
        "gmock-generated-function-mockers_test.cc"
        "gmock-generated-matchers_test.cc"
        "gmock-internal-utils_test.cc"
        "gmock-matchers_test.cc"
        "gmock-more-actions_test.cc"
        "gmock-nice-strict_test.cc"
        "gmock-port_test.cc"
        "gmock-spec-builders_test.cc"
        "gmock_test.cc"
    ];
};

gmock_link_test = cc_test {
    name = "gmock_link_test";
    defaults = ["gmock_test_defaults"];
    relative_install_path = "gmock_tests";
    no_named_install_directory = true;
    srcs = [
        "gmock_link_test.cc"
        "gmock_link2_test.cc"
    ];
};

in { inherit gmock_link_test gmock_test_defaults gmock_tests; }
