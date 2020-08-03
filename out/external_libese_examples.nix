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

ese_nxp_sample = cc_binary {
    name = "ese_nxp_sample";
    proprietary = true;
    srcs = ["ese_nxp_sample.c"];
    host_supported = false;
    cflags = [
        "-Wall"
        "-Werror"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
    shared_libs = [
        "liblog"
        "libese"
        "libese-teq1"
        "libese-hw-nxp-pn80t-nq-nci"
    ];
};

in { inherit ese_nxp_sample; }
