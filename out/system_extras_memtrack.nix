{ cc_binary, cc_defaults }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

memtrack_defaults = cc_defaults {
    name = "memtrack_defaults";

    srcs = ["memtrack.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

memtrack_share = cc_binary {
    name = "memtrack_share";
    defaults = ["memtrack_defaults"];

    shared_libs = ["liblog"];
};

memtrack = cc_binary {
    name = "memtrack";
    defaults = ["memtrack_defaults"];

    static_executable = true;
    static_libs = [
        "libc"
        "liblog"
        "libc++abi"
        "libdl"
    ];

    stl = "libc++_static";

    #  Bug: 18389563 - Today, libc++_static and libgcc have duplicate sybols for
    #  __aeabi_uidiv(). Allowing multiple definitions lets the build proceed, but
    #  updating compiler-rt to be a superset of libgcc will allow this WAR to be
    #  removed.
    ldflags = ["-Wl,-z,muldefs"];
};

in { inherit memtrack memtrack_defaults memtrack_share; }
