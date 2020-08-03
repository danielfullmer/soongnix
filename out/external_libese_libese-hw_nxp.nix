{ cc_defaults, cc_library }:
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

libese-hw-nxp-pn80t-common = cc_library {
    name = "libese-hw-nxp-pn80t-common";
    proprietary = true;
    defaults = ["libese-defaults"];
    srcs = ["pn80t/common.c"];
    shared_libs = [
        "liblog"
        "libese"
        "libese-teq1"
        "libese-sysdeps"
    ];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=unused-variable"
        "-Wno-format"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

pn80t_platform = cc_defaults {
    name = "pn80t_platform";
    proprietary = true;
    defaults = ["libese-api-defaults"];
    target = {
        darwin = {
            enabled = false;
        };
    };
    shared_libs = [
        "liblog"
        "libese"
        "libese-teq1"
        "libese-sysdeps"
    ];
    static_libs = ["libese-hw-nxp-pn80t-common"];
};

libese-hw-nxp-pn80t-spidev = cc_library {
    name = "libese-hw-nxp-pn80t-spidev";
    defaults = ["pn80t_platform"];
    srcs = ["pn80t/linux_spidev.c"];
    cflags = [
        "-Wno-format"
    ];
};

libese-hw-nxp-pn80t-nq-nci = cc_library {
    name = "libese-hw-nxp-pn80t-nq-nci";
    defaults = ["pn80t_platform"];
    srcs = ["pn80t/nq_nci.c"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=unused-variable"
        "-Wno-format"
    ];
};

in { inherit libese-hw-nxp-pn80t-common libese-hw-nxp-pn80t-nq-nci libese-hw-nxp-pn80t-spidev pn80t_platform; }
