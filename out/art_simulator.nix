{ art_cc_library, cc_defaults, cc_library_headers }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

libart_simulator_headers = cc_library_headers {
    name = "libart_simulator_headers";
    host_supported = true;
    export_include_dirs = ["include"];
};

libart_simulator_defaults = cc_defaults {
    name = "libart_simulator_defaults";
    host_supported = true;
    device_supported = false;

    defaults = ["art_defaults"];
    srcs = [
        "code_simulator.cc"
        "code_simulator_arm64.cc"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    cflags = ["-DVIXL_INCLUDE_SIMULATOR_AARCH64"];

    header_libs = ["libart_simulator_headers"];
};

libart-simulator = art_cc_library {
    name = "libart-simulator";
    defaults = ["libart_simulator_defaults"];
    shared_libs = [
        "libart"
        "libartbase"
        "libvixl"
    ];
};

libartd-simulator = art_cc_library {
    name = "libartd-simulator";
    defaults = [
        "art_debug_defaults"
        "libart_simulator_defaults"
    ];
    shared_libs = [
        "libartd"
        "libartbased"
        "libvixld"
    ];
};

libart_simulator_container_defaults = cc_defaults {
    name = "libart_simulator_container_defaults";
    host_supported = true;

    defaults = ["art_defaults"];
    srcs = [
        "code_simulator_container.cc"
    ];
    shared_libs = [
        "libbase"
    ];

    header_libs = ["libart_simulator_headers"];
    export_include_dirs = ["."]; #  TODO: Consider a proper separation.
};

libart-simulator-container = art_cc_library {
    name = "libart-simulator-container";
    defaults = ["libart_simulator_container_defaults"];
    shared_libs = [
        "libartbase"
        "libart"
    ];
};

libartd-simulator-container = art_cc_library {
    name = "libartd-simulator-container";
    defaults = [
        "art_debug_defaults"
        "libart_simulator_container_defaults"
    ];
    shared_libs = [
        "libartbased"
        "libartd"
    ];
};

in { inherit libart-simulator libart-simulator-container libart_simulator_container_defaults libart_simulator_defaults libart_simulator_headers libartd-simulator libartd-simulator-container; }
