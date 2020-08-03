{ cc_binary, cc_defaults, cc_library_shared }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

bootio_defaults = cc_defaults {
    name = "bootio_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "libprotobuf-cpp-lite"
    ];
};

#  bootio library
#  -----------------------------------------------------------------------------

libbootio = cc_library_shared {
    name = "libbootio";
    defaults = ["bootio_defaults"];

    include_dirs = ["system/extras/boottime_tools"];

    export_include_dirs = ["."];
    proto = {
        canonical_path_from_root = false;
        type = "lite";
    };
    srcs = [
        "protos.proto"
        "bootio_collector.cpp"
    ];
};

#  bootio binary
#  -----------------------------------------------------------------------------

bootio = cc_binary {
    name = "bootio";
    defaults = ["bootio_defaults"];
    shared_libs = ["libbootio"];

    init_rc = ["bootio.rc"];
    srcs = ["bootio.cpp"];
};

in { inherit bootio bootio_defaults libbootio; }
