{ cc_defaults, cc_library_static }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

libbnnmlowp-defaults = cc_defaults {
    name = "libbnnmlowp-defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=#warnings"
        "-Wno-unused-parameter"
        #  b/130573439, disable the META_FASTPATH.
        #  "-DGEMMLOWP_USE_META_FASTPATH",
    ];

    srcs = ["eight_bit_int_gemm.cc"];
    export_include_dirs = ["."];
};

libbnnmlowp = cc_library_static {
    name = "libbnnmlowp";
    vendor_available = true;
    defaults = ["libbnnmlowp-defaults"];
};

libbnnmlowpV8 = cc_library_static {
    name = "libbnnmlowpV8";
    defaults = ["libbnnmlowp-defaults"];

    sdk_version = "9";

    #  Always build gemmlowpV8 for armv7 using NEON,
    #  alternate non-SIMD route is built in libRSSupport.
    arch = {
        arm = {
            cflags = ["-mfpu=neon"];
        };
    };

    stl = "c++_static";
};

in { inherit libbnnmlowp libbnnmlowp-defaults libbnnmlowpV8; }
