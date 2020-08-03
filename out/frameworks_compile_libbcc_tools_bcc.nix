{ cc_binary, cc_library }:
let

#
#  Copyright (C) 2010-2012 The Android Open Source Project
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

bcc = cc_binary {
    name = "bcc";
    host_supported = true;
    defaults = ["libbcc-defaults"];

    shared_libs = [
        "libbcc"
        "libbcinfo"
        "libLLVM_android"
    ];

    target = {
        android = {
            shared_libs = [
                "liblog"
                "libvndksupport"
            ];
        };
    };

    whole_static_libs = ["libbcc_binary"];
};

#  libbcc_binary is used to compile vendor modules - should not be removed
libbcc_binary = cc_library {
    name = "libbcc_binary";
    host_supported = true;
    vendor_available = true;
    defaults = ["libbcc-defaults"];

    srcs = ["Main.cpp"];

    shared_libs = [
        "libbcc"
        "libbcinfo"
        "libLLVM_android"
    ];

    header_libs = ["slang_headers"];

    target = {
        android = {
            shared_libs = [
                "liblog"
                "libvndksupport"
            ];
        };
    };
};

in { inherit bcc libbcc_binary; }
