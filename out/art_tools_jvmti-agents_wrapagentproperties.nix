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

wrapagentproperties-defaults = cc_defaults {
    name = "wrapagentproperties-defaults";
    host_supported = true;
    srcs = ["wrapagentproperties.cc"];
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

libwrapagentproperties = art_cc_library {
    name = "libwrapagentproperties";
    defaults = ["wrapagentproperties-defaults"];
    shared_libs = [
    ];
};

libwrapagentpropertiesd = art_cc_library {
    name = "libwrapagentpropertiesd";
    defaults = [
        "art_debug_defaults"
        "wrapagentproperties-defaults"
    ];
    shared_libs = [];
};

in { inherit libwrapagentproperties libwrapagentpropertiesd wrapagentproperties-defaults; }
