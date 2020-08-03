{ art_cc_library, cc_defaults }:
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

#  Build variants {target,host} x {debug,ndebug} x {32,64}

dt_fd_forward-defaults = cc_defaults {
    name = "dt_fd_forward-defaults";
    host_supported = true;
    srcs = ["dt_fd_forward.cc"];
    defaults = ["art_defaults"];

    #  Note that this tool needs to be built for both 32-bit and 64-bit since it needs to be same
    #  ISA as what it is attached to.
    compile_multilib = "both";

    shared_libs = [
        "libbase"
    ];
    target = {
        android = {
        };
        host = {
        };
        darwin = {
            enabled = false;
        };
    };
    header_libs = [
        "javavm_headers"
        "dt_fd_forward_export"
        "art_libartbase_headers" #  For strlcpy emulation.
    ];
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
};

libdt_fd_forward = art_cc_library {
    name = "libdt_fd_forward";
    defaults = ["dt_fd_forward-defaults"];
};

libdt_fd_forwardd = art_cc_library {
    name = "libdt_fd_forwardd";
    defaults = [
        "art_debug_defaults"
        "dt_fd_forward-defaults"
    ];
};

in { inherit dt_fd_forward-defaults libdt_fd_forward libdt_fd_forwardd; }
