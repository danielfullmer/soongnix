{ cc_binary_host }:
let

#
#  Copyright (C) 2012 The Android Open Source Project
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

#  Executable for host
#  ========================================================
bcc_compat = cc_binary_host {
    name = "bcc_compat";
    defaults = ["libbcc-defaults"];

    srcs = ["Main.cpp"];

    target = {
        windows = {
            enabled = true;
        };
    };

    shared_libs = [
        "libbcc"
        "libbcinfo"
        "libLLVM_android"
    ];

    header_libs = ["slang_headers"];

    product_variables = {
        unbundled_build = {
            #  Don't build for unbundled branches
            enabled = false;
        };
    };
};

in { inherit bcc_compat; }
