{ cc_binary }:
let

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

mtpd = cc_binary {
    name = "mtpd";
    srcs = [
        "mtpd.c"
        "l2tp.c"
        "pptp.c"
    ];
    shared_libs = [
        "libcrypto"
        "libcutils"
        "liblog"
        "libnetd_client"
    ];
    cflags = [
        "-DANDROID_CHANGES"
        "-Wall"
        "-Werror"
    ];
    init_rc = ["mtpd.rc"];
};

in { inherit mtpd; }
