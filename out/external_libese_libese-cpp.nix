{ cc_defaults, cc_library_headers, cc_library_shared, cc_test_library }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

libese_cpp_defaults = cc_defaults {
    name = "libese_cpp_defaults";
    proprietary = true;
    cflags = [
        "-pedantic"
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

libese_cpp = cc_library_headers {
    name = "libese_cpp";
    defaults = ["libese_cpp_defaults"];
    export_include_dirs = ["include"];
};

libese_cpp_nxp_pn80t_nq_nci = cc_library_shared {
    name = "libese_cpp_nxp_pn80t_nq_nci";
    defaults = ["libese_cpp_defaults"];
    srcs = [
        "NxpPn80tNqNci.cpp"
    ];
    export_include_dirs = ["include"];
    header_libs = ["libese_cpp"];
    shared_libs = [
        "libese"
        "libese-hw-nxp-pn80t-nq-nci"
    ];
    export_shared_lib_headers = [
        "libese"
    ];
    host_supported = false;
};

libese_cpp_mock = cc_test_library {
    name = "libese_cpp_mock";
    defaults = ["libese_cpp_defaults"];
    export_include_dirs = ["tests/include"];
};

in { inherit libese_cpp libese_cpp_defaults libese_cpp_mock libese_cpp_nxp_pn80t_nq_nci; }
