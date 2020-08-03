{ cc_binary }:
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

ese-ls-provision = cc_binary {
    name = "ese-ls-provision";
    proprietary = true;
    host_supported = false;
    target = {
        darwin = {
            enabled = false;
        };
    };
    cflags = [
        "-DNXP_LDR_SVC_VER_2=TRUE"
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libese"
        "libese-hw-nxp-pn80t-nq-nci"
        "libese-teq1"
        "libp61-jcop-kit"
    ];
    srcs = ["ese_ls_provision.cpp"];
};

in { inherit ese-ls-provision; }
