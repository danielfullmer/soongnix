{ art_cc_binary, art_cc_defaults }:
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

art_verifier-defaults = art_cc_defaults {
    name = "art_verifier-defaults";
    defaults = [
        "art_defaults"
        "libart_static_defaults"
    ];
    host_supported = true;
    srcs = [
        "art_verifier.cc"
    ];
    header_libs = [
        "art_cmdlineparser_headers"
    ];
    static_libs = [
        "libsigchain_dummy"
    ];
    target = {
        android = {
            static_libs = [
                "libtombstoned_client_static"
            ];
            shared_libs = [
                "libdl_android"
            ];
        };
        darwin = {
            enabled = false;
        };
    };
};

art_verifier = art_cc_binary {
    name = "art_verifier";
    defaults = ["art_verifier-defaults"];
};

in { inherit art_verifier art_verifier-defaults; }
