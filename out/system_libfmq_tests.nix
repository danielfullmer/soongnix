{ cc_test }:
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

mq_test_client = cc_test {
    name = "mq_test_client";
    srcs = ["msgq_test_client.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "liblog"
        "libutils"
    ];

    #  Allow dlsym'ing self for statically linked passthrough implementations
    ldflags = ["-rdynamic"];

    #  These are static libs only for testing purposes and portability. Shared
    #  libs should be used on device.
    static_libs = ["android.hardware.tests.msgq@1.0"];
    whole_static_libs = ["android.hardware.tests.msgq@1.0-impl"];
};

mq_test = cc_test {
    name = "mq_test";

    srcs = ["mq_test.cpp"];
    shared_libs = [
        "libbase"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "liblog"
        "libutils"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit mq_test mq_test_client; }
