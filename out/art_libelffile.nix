{ art_cc_defaults, art_cc_library_static }:
let

#
#  Copyright (C) 2011 The Android Open Source Project
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

libelffile-defaults = art_cc_defaults {
    name = "libelffile-defaults";
    host_supported = true;
    export_include_dirs = ["."];
    srcs = [
        "elf/xz_utils.cc"
        "stream/buffered_output_stream.cc"
        "stream/file_output_stream.cc"
        "stream/output_stream.cc"
        "stream/vector_output_stream.cc"
    ];
    shared_libs = [
        "libartbase"
        "libbase"
    ];
};

libelffile = art_cc_library_static {
    name = "libelffile";
    defaults = [
        "art_defaults"
        "libelffile-defaults"
    ];
};

libelffiled = art_cc_library_static {
    name = "libelffiled";
    defaults = [
        "art_debug_defaults"
        "libelffile-defaults"
    ];
};

in { inherit libelffile libelffile-defaults libelffiled; }
