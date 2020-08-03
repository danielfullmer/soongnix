{ art_cc_binary, art_cc_test, cc_defaults }:
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

dexanalyze-defaults = cc_defaults {
    name = "dexanalyze-defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "dexanalyze.cc"
        "dexanalyze_bytecode.cc"
        "dexanalyze_experiments.cc"
        "dexanalyze_strings.cc"
    ];
    header_libs = [
        "art_cmdlineparser_headers"
    ];
};

dexanalyze = art_cc_binary {
    name = "dexanalyze";
    defaults = ["dexanalyze-defaults"];
    shared_libs = [
        "libdexfile"
        "libartbase"
        "libbase"
    ];
};

art_dexanalyze_tests = art_cc_test {
    name = "art_dexanalyze_tests";
    required = ["dexanalyze"];
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = [
        "dexanalyze_test.cc"
    ];
};

in { inherit art_dexanalyze_tests dexanalyze dexanalyze-defaults; }
