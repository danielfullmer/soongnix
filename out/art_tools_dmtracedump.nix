{ art_cc_binary }:
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

#  Java method trace dump tool

dmtracedump = art_cc_binary {
    name = "dmtracedump";
    host_supported = true;
    device_supported = false;
    srcs = ["tracedump.cc"];
    cflags = [
        "-O0"
        "-g"
        "-Wall"
        "-Werror"
    ];
    target = {
        windows = {
            enabled = true;
        };
    };
};

create_test_dmtrace = art_cc_binary {
    name = "create_test_dmtrace";
    host_supported = true;
    device_supported = false;
    srcs = ["createtesttrace.cc"];
    cflags = [
        "-O0"
        "-g"
        "-Wall"
        "-Werror"
    ];
};

in { inherit create_test_dmtrace dmtracedump; }
