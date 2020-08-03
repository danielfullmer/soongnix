{ cc_binary_host, vts_config }:
let

#
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
#

VtsSecuritySelinuxPolicyHostTest = cc_binary_host {

    name = "VtsSecuritySelinuxPolicyHostTest";

    srcs = ["main.cpp"];

    include_dirs = [];

    static_libs = [];

    shared_libs = [];

    cflags = [
        "-Wall"
        "-Werror"
    ];

};

VtsSecuritySelinuxPolicyHost = vts_config {
    name = "VtsSecuritySelinuxPolicyHost";
};

in { inherit VtsSecuritySelinuxPolicyHost VtsSecuritySelinuxPolicyHostTest; }
