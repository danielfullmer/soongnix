{ art_cc_library, cc_defaults }:
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

#  Build variants {target,host} x {debug,ndebug} x {32,64}

tracefast-defaults = cc_defaults {
    name = "tracefast-defaults";
    host_supported = true;
    srcs = ["tracefast.cc"];
    defaults = ["art_defaults"];

    #  Note that this tool needs to be built for both 32-bit and 64-bit since it requires
    #  to be same ISA as what it is attached to.
    compile_multilib = "both";

    shared_libs = [
        "libbase"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
    header_libs = [
        "libnativehelper_header_only"
    ];
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    symlink_preferred_arch = true;
};

tracefast-interpreter-defaults = cc_defaults {
    name = "tracefast-interpreter-defaults";
    defaults = ["tracefast-defaults"];
    cflags = ["-DTRACEFAST_INTERPRETER=1"];
};

tracefast-trampoline-defaults = cc_defaults {
    name = "tracefast-trampoline-defaults";
    defaults = ["tracefast-defaults"];
    cflags = ["-DTRACEFAST_TRAMPOLINE=1"];
};

libtracefast-interpreter = art_cc_library {
    name = "libtracefast-interpreter";
    defaults = ["tracefast-interpreter-defaults"];
    shared_libs = [
        "libart"
        "libartbase"
    ];
};

libtracefast-interpreterd = art_cc_library {
    name = "libtracefast-interpreterd";
    defaults = [
        "art_debug_defaults"
        "tracefast-interpreter-defaults"
    ];
    shared_libs = [
        "libartd"
        "libartbased"
    ];
};

libtracefast-trampoline = art_cc_library {
    name = "libtracefast-trampoline";
    defaults = ["tracefast-trampoline-defaults"];
    shared_libs = [
        "libart"
        "libartbase"
    ];
};

libtracefast-trampolined = art_cc_library {
    name = "libtracefast-trampolined";
    defaults = [
        "art_debug_defaults"
        "tracefast-trampoline-defaults"
    ];
    shared_libs = [
        "libartd"
        "libartbased"
    ];
};

in { inherit libtracefast-interpreter libtracefast-interpreterd libtracefast-trampoline libtracefast-trampolined tracefast-defaults tracefast-interpreter-defaults tracefast-trampoline-defaults; }
