{ cc_library_host_static }:
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

libcts_audio_quality = cc_library_host_static {
    name = "libcts_audio_quality";
    srcs = ["**/*.cpp"];
    export_include_dirs = [
        "include"
        "src"
    ];
    static_libs = [
        "libbase"
        "libutils"
        "liblog"
        "libtinyalsa"
        "libcutils"
        "libtinyxml2"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-g"
        "-fno-exceptions"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
        "-Wno-format"
    ];
    ldflags = [
        "-fno-exceptions"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit libcts_audio_quality; }
