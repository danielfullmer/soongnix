{ cc_library }:
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

#  ==========================================================
#  Native library to write stats log to statsd socket
#  ==========================================================
libstatssocket = cc_library {
    name = "libstatssocket";
    srcs = [
        "stats_event_list.c"
        "statsd_writer.c"
    ];
    host_supported = true;
    cflags = [
        "-Wall"
        "-Werror"
        "-DLIBLOG_LOG_TAG=1006"
        "-DWRITE_TO_STATSD=1"
        "-DWRITE_TO_LOGD=0"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
        "libcutils"
        "liblog"
    ];
};

in { inherit libstatssocket; }
