{ cc_library_shared, ndk_library }:
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

libjnigraphics = cc_library_shared {
    name = "libjnigraphics";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];

    #  our source files
    #
    srcs = ["bitmap.cpp"];

    shared_libs = [
        "libandroid_runtime"
    ];

    arch = {
        arm = {
            #  TODO: This is to work around b/24465209. Remove after root cause is fixed
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];
        };
    };
    version_script = "libjnigraphics.map.txt";
};

#  The headers module is in frameworks/native/Android.bp.
libjnigraphics = ndk_library {
    name = "libjnigraphics";
    symbol_file = "libjnigraphics.map.txt";
    first_version = "9";
    unversioned_until = "current";
};

in { inherit libjnigraphics; }
