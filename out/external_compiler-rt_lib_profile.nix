{ cc_library_static }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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
#

# =====================================================================
#  Static Library: libprofile_rt
# =====================================================================

libprofile_rt = cc_library_static {
    name = "libprofile_rt";
    host_supported = true;

    cflags = [
        "-Werror"
        "-Wall"
    ];
    srcs = [
        "GCDAProfiling.c"
        "InstrProfiling.c"
        "InstrProfilingBuffer.c"
        "InstrProfilingFile.c"
        "InstrProfilingPlatformDarwin.c"
        "InstrProfilingPlatformOther.c"
        "InstrProfilingRuntime.cc"
        "InstrProfilingUtil.c"
    ];

    sanitize = {
        never = true;
    };
    compile_multilib = "both";
    stl = "none";
    sdk_version = "21";
};

in { inherit libprofile_rt; }
