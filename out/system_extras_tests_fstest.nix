{ cc_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

recovery_test = cc_test {
    name = "recovery_test";
    srcs = ["recovery_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libcutils"
        "libutils"
        "libbase"
        "liblog"
        "liblogwrap"
        "libext4_utils"
    ];
    static_libs = [
        "libtestUtil"
        "libfs_mgr"
    ];
};

in { inherit recovery_test; }
