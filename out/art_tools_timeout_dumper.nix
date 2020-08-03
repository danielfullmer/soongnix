{ art_cc_binary }:
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

timeout_dumper = art_cc_binary {
    name = "timeout_dumper";

    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
        linux_bionic = {
            sanitize = {
                address = false;
            };
        };
    };
    device_supported = false;

    defaults = ["art_defaults"];

    srcs = ["timeout_dumper.cc"];

    shared_libs = [
        "libbacktrace"
        "libbase"
    ];
    sanitize = {
        address = true;
    };
};

in { inherit timeout_dumper; }
