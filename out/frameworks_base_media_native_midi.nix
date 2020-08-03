{ cc_library_shared, ndk_headers, ndk_library }:
let

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

libamidi = cc_library_shared {
    name = "libamidi";

    srcs = [
        "amidi.cpp"
        ":IMidiDeviceServer.aidl"
    ];

    aidl = {
        include_dirs = ["frameworks/base/media/java"];
        export_aidl_headers = false;
    };

    cflags = [
        "-Wall"
        "-Werror"
        "-fvisibility=hidden"
    ];

    shared_libs = [
        "liblog"
        "libbinder"
        "libutils"
        "libmedia"
        "libmediandk"
        "libandroid_runtime"
    ];

    export_include_dirs = ["include"];
};

amidi = ndk_headers {
    name = "amidi";

    from = "include";

    to = "";

    srcs = ["include/amidi/AMidi.h"];
    license = "include/amidi/NOTICE";
};

libamidi = ndk_library {
    name = "libamidi";

    symbol_file = "libamidi.map.txt";

    first_version = "29";
};

in { inherit amidi libamidi; }
