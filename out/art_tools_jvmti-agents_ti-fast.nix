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
tifast-base-defaults = cc_defaults {
    name = "tifast-base-defaults";
    srcs = ["tifast.cc"];
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

tifast-defaults = cc_defaults {
    name = "tifast-defaults";
    host_supported = true;
    shared_libs = [
        "libbase"
    ];
    defaults = ["tifast-base-defaults"];
};

tifast-static-defaults = cc_defaults {
    name = "tifast-static-defaults";
    host_supported = false;
    defaults = ["tifast-base-defaults"];

    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libbase_ndk"
    ];
    sdk_version = "current";
    stl = "c++_static";
};

libtifasts = art_cc_library {
    name = "libtifasts";
    defaults = ["tifast-static-defaults"];
};

libtifast = art_cc_library {
    name = "libtifast";
    defaults = ["tifast-defaults"];
};

libtifastd = art_cc_library {
    name = "libtifastd";
    defaults = [
        "art_debug_defaults"
        "tifast-defaults"
    ];
};

in { inherit libtifast libtifastd libtifasts tifast-base-defaults tifast-defaults tifast-static-defaults; }
