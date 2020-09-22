{ cc_binary, cc_defaults }:
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

esed_defaults = cc_defaults {
    name = "esed_defaults";
    proprietary = true;
    cflags = [
        "-pedantic"
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    host_supported = false;
    target = {
        darwin = {
            enabled = false;
        };
    };
};

esed = cc_binary {
    name = "esed";
    srcs = [
        "esed.cpp"
        "Weaver.cpp"
    ];
    init_rc = ["esed.rc"];
    defaults = ["esed_defaults"];
    shared_libs = [
        "android.hardware.weaver@1.0"
        "libese"
        "libbase"
        "libese-app-boot"
        "libese_cpp_nxp_pn80t_nq_nci"
        "libese-app-weaver"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
};

in { inherit esed esed_defaults; }
