{ cc_library }:
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

subdirs = [
    "common"
    "i18n"
    "test"
    "tools/ctestfw"
    "tools/toolutil"
];

libicuuc_stubdata = cc_library {
    name = "libicuuc_stubdata";
    host_supported = true;
    native_bridge_supported = true;
    srcs = ["stubdata/stubdata.cpp"];
    header_libs = [
        "libicuuc_headers"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    cppflags = ["-std=c++11"];
    target = {
        windows = {
            enabled = true;
        };
        android = {
            cflags = [
                "-DANDROID_LINK_SHARED_ICU4C"
            ];
        };
    };

    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

in { inherit libicuuc_stubdata; }
