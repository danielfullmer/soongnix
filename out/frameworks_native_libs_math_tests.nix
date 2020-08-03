{ cc_test }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

vec_test = cc_test {
    name = "vec_test";
    srcs = ["vec_test.cpp"];
    static_libs = ["libmath"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

mat_test = cc_test {
    name = "mat_test";
    srcs = ["mat_test.cpp"];
    static_libs = ["libmath"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

half_test = cc_test {
    name = "half_test";
    srcs = ["half_test.cpp"];
    static_libs = ["libmath"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

quat_test = cc_test {
    name = "quat_test";
    srcs = ["quat_test.cpp"];
    static_libs = ["libmath"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit half_test mat_test quat_test vec_test; }
