{ cc_binary }:
let

#
#  Copyright (C) 2010 The Android Open Source Project
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

drmserver = cc_binary {
    name = "drmserver";

    srcs = [
        "main_drmserver.cpp"
        "DrmManager.cpp"
        "DrmManagerService.cpp"
    ];

    shared_libs = [
        "libmediametrics"
        "libmediautils"
        "libcutils"
        "libutils"
        "liblog"
        "libbinder"
        "libdl"
        "libselinux"
        "libstagefright_foundation"
    ];

    static_libs = ["libdrmframeworkcommon"];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    compile_multilib = "32";

    init_rc = ["drmserver.rc"];
};

in { inherit drmserver; }
