{ art_cc_library, cc_defaults, cc_library }:
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
fieldnull-base-defaults = cc_defaults {
    name = "fieldnull-base-defaults";
    srcs = ["fieldnull.cc"];
    defaults = ["art_defaults"];

    #  Note that this tool needs to be built for both 32-bit and 64-bit since it requires
    #  to be same ISA as what it is attached to.
    compile_multilib = "both";
    header_libs = [
        "libopenjdkjvmti_headers"
    ];
};

fieldnull-defaults = cc_defaults {
    name = "fieldnull-defaults";
    host_supported = true;
    shared_libs = [
        "libbase"
    ];
    defaults = ["fieldnull-base-defaults"];
};

fieldnull-static-defaults = cc_defaults {
    name = "fieldnull-static-defaults";
    host_supported = false;
    defaults = ["fieldnull-base-defaults"];

    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libbase_ndk"
    ];
    sdk_version = "current";
    stl = "c++_static";
};

libfieldnulls = cc_library {
    name = "libfieldnulls";
    defaults = ["fieldnull-static-defaults"];
};

libfieldnull = art_cc_library {
    name = "libfieldnull";
    defaults = ["fieldnull-defaults"];
};

libfieldnulld = art_cc_library {
    name = "libfieldnulld";
    defaults = [
        "art_debug_defaults"
        "fieldnull-defaults"
    ];
};

in { inherit fieldnull-base-defaults fieldnull-defaults fieldnull-static-defaults libfieldnull libfieldnulld libfieldnulls; }
