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

breakpointlogger-defaults = cc_defaults {
    name = "breakpointlogger-defaults";
    host_supported = true;
    srcs = ["breakpoint_logger.cc"];
    defaults = ["art_defaults"];

    #  Note that this tool needs to be built for both 32-bit and 64-bit since it requires
    #  to be same ISA as what it is attached to.
    compile_multilib = "both";

    shared_libs = [
        "libbase"
    ];
    target = {
        android = {
        };
        host = {
        };
    };
    header_libs = [
        "libopenjdkjvmti_headers"
    ];
};

libbreakpointlogger = art_cc_library {
    name = "libbreakpointlogger";
    defaults = ["breakpointlogger-defaults"];
    shared_libs = [
    ];
};

libbreakpointloggerd = art_cc_library {
    name = "libbreakpointloggerd";
    defaults = [
        "art_debug_defaults"
        "breakpointlogger-defaults"
    ];
    shared_libs = [];
};

in { inherit breakpointlogger-defaults libbreakpointlogger libbreakpointloggerd; }
