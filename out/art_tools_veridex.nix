{ cc_binary }:
let

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

veridex = cc_binary {
    name = "veridex";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "flow_analysis.cc"
        "hidden_api.cc"
        "hidden_api_finder.cc"
        "precise_hidden_api_finder.cc"
        "resolver.cc"
        "veridex.cc"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    static_libs = [
        "libdexfile"
        "libartbase"
        "libbase"
        "liblog"
        "libz"
        "libziparchive"
    ];
    stl = "libc++_static";
    header_libs = [
        "art_libartbase_headers"
    ];
    target = {
        darwin = {
            enabled = true;
        };
    };
};

in { inherit veridex; }
