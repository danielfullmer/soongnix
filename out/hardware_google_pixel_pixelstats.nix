{ cc_library, java_library }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

pixelatoms-cpp = cc_library {
    name = "pixelatoms-cpp";
    vendor = true;
    proto = {
        type = "lite";
        export_proto_headers = true;
    };
    srcs = [
        "pixelatoms.proto"
    ];
};

pixelatoms-java = java_library {
    name = "pixelatoms-java";
    vendor = true;
    proto = {
        type = "lite";
    };
    srcs = [
        "pixelatoms.proto"
    ];
};

libpixelstats = cc_library {
    name = "libpixelstats";
    vendor = true;
    export_include_dirs = ["include"];

    srcs = [
        "DropDetect.cpp"
        "SysfsCollector.cpp"
        "UeventListener.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "android.frameworks.stats@1.0"
        "libbase"
        "libbinder"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "pixelatoms-cpp"
    ];
    export_shared_lib_headers = [
        "android.frameworks.stats@1.0"
    ];
    static_libs = [
        "chre_client"
    ];
    header_libs = ["chre_api"];
};

in { inherit libpixelstats pixelatoms-cpp pixelatoms-java; }
