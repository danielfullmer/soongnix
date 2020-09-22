{ cc_binary, cc_defaults, cc_library, cc_test }:
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

libperfmgr_defaults = cc_defaults {
    name = "libperfmgr_defaults";
    local_include_dirs = ["include"];
    shared_libs = [
        "libbase"
        "libcutils"
        "libutils"
    ];
    static_libs = [
        "libjsoncpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    tidy = true;
    tidy_checks = [
        "android-*"
        "cert-*"
        "clang-analyzer-security*"
    ];
    tidy_flags = [
        "-warnings-as-errors=android-*,clang-analyzer-security*,cert-*"
    ];
};

libperfmgr = cc_library {
    name = "libperfmgr";
    vendor_available = true;
    defaults = ["libperfmgr_defaults"];
    export_include_dirs = ["include"];
    srcs = [
        "RequestGroup.cc"
        "Node.cc"
        "FileNode.cc"
        "PropertyNode.cc"
        "NodeLooperThread.cc"
        "HintManager.cc"
    ];
};

libperfmgr_test = cc_test {
    name = "libperfmgr_test";
    defaults = ["libperfmgr_defaults"];
    static_libs = ["libperfmgr"];
    srcs = [
        "tests/RequestGroupTest.cc"
        "tests/FileNodeTest.cc"
        "tests/PropertyNodeTest.cc"
        "tests/NodeLooperThreadTest.cc"
        "tests/HintManagerTest.cc"
    ];
};

perfmgr_config_verifier = cc_binary {
    name = "perfmgr_config_verifier";
    defaults = ["libperfmgr_defaults"];
    static_libs = ["libperfmgr"];
    srcs = [
        "tools/ConfigVerifier.cc"
    ];
};

in { inherit libperfmgr libperfmgr_defaults libperfmgr_test perfmgr_config_verifier; }
