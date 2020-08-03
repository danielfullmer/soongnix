{ cc_binary, cc_library_shared }:
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

libinputflingerhost = cc_library_shared {
    name = "libinputflingerhost";

    srcs = [
        "InputFlinger.cpp"
        "InputDriver.cpp"
        "InputHost.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libcrypto"
        "libcutils"
        "libinput"
        "liblog"
        "libutils"
        "libhardware"
    ];
    static_libs = [
        "libarect"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        #  TODO: Move inputflinger to its own process and mark it hidden
        # -fvisibility=hidden
    ];

    export_include_dirs = ["."];
};

# #######################################################################
#  build input flinger executable
inputflinger = cc_binary {
    name = "inputflinger";

    srcs = ["main.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbinder"
        "libinputflingerhost"
        "libutils"
    ];
    static_libs = [
        "libarect"
    ];
};

in { inherit inputflinger libinputflingerhost; }
