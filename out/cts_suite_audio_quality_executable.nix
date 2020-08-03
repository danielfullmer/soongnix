{ cc_binary_host }:
let

#
#  Copyright (C) 2012 The Android Open Source Project
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

cts_audio_quality = cc_binary_host {
    name = "cts_audio_quality";
    srcs = ["src/main.cpp"];
    static_libs = [
        "libbase"
        "libutils"
        "liblog"
        "libcutils"
        "libtinyalsa"
        "libtinyxml2"
    ];
    whole_static_libs = ["libcts_audio_quality"];
    cflags = [
        "-Wall"
        "-Werror"
        "-g"
        "-fno-exceptions"
    ];
    ldflags = [
        "-g"
        "-fno-exceptions"
    ];
    stl = "libc++_static";
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit cts_audio_quality; }
