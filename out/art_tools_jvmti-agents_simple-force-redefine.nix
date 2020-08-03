{ art_cc_library, cc_defaults }:
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
forceredefine-defaults = cc_defaults {
    name = "forceredefine-defaults";
    host_supported = true;
    srcs = ["forceredefine.cc"];
    defaults = ["art_defaults"];

    #  Note that this tool needs to be built for both 32-bit and 64-bit since it requires
    #  to be same ISA as what it is attached to.
    compile_multilib = "both";

    shared_libs = [
        "libz"
        "liblog"
    ];
    header_libs = [
        "libopenjdkjvmti_headers"
        #  Annoyingly you aren't allowed to include even header-only non-ndk libs into an ndk build.
        #  Instead we put the directories this would bring in below in 'include_dirs'
        #  "libnativehelper_header_only",
    ];
    include_dirs = [
        #  NDK headers aren't available in platform NDK builds.
        "libnativehelper/include_jni"
        "libnativehelper/header_only_include"
    ];
    sdk_version = "current";
    stl = "libc++_static";
    target = {
        android = {
            static_libs = [
                "slicer_ndk_no_rtti"
                "libbase_ndk"
            ];
        };
        host = {
            static_libs = [
                "slicer_no_rtti"
            ];
            shared_libs = [
                "libbase"
            ];
        };
    };
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

libforceredefine = art_cc_library {
    name = "libforceredefine";
    defaults = ["forceredefine-defaults"];
};

libforceredefined = art_cc_library {
    name = "libforceredefined";
    defaults = [
        "art_debug_defaults"
        "forceredefine-defaults"
    ];
};

in { inherit forceredefine-defaults libforceredefine libforceredefined; }
