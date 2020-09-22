{ art_cc_library, cc_defaults, cc_library }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

chainagents-base-defaults = cc_defaults {
    name = "chainagents-base-defaults";
    srcs = ["chainagents.cc"];
    defaults = ["art_defaults"];

    #  Note that this tool needs to be built for both 32-bit and 64-bit since it requires
    #  to be same ISA as what it is attached to.
    compile_multilib = "both";

    header_libs = [
        "libopenjdkjvmti_headers"
        "libnativehelper_header_only"
        "jni_headers"
    ];
};

chainagents-defaults = cc_defaults {
    name = "chainagents-defaults";
    host_supported = true;
    shared_libs = [
        "libbase"
    ];
    defaults = ["chainagents-base-defaults"];
};

libchainagents = art_cc_library {
    name = "libchainagents";
    defaults = ["chainagents-defaults"];
};

libchainagentsd = art_cc_library {
    name = "libchainagentsd";
    defaults = [
        "art_debug_defaults"
        "chainagents-defaults"
    ];
};

chainagents-static-defaults = cc_defaults {
    name = "chainagents-static-defaults";
    host_supported = false;
    defaults = ["chainagents-base-defaults"];

    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libbase_ndk"
    ];
    sdk_version = "current";
    stl = "c++_static";
};

libchainagentss = cc_library {
    name = "libchainagentss";
    defaults = ["chainagents-static-defaults"];
};

in { inherit chainagents-base-defaults chainagents-defaults chainagents-static-defaults libchainagents libchainagentsd libchainagentss; }
