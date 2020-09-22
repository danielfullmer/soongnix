{ cc_test_library }:
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

#
#  This is the shared library included by the JNI test app.
#

libjvmtiattachingtestagent1 = cc_test_library {
    name = "libjvmtiattachingtestagent1";
    gtest = false;
    srcs = ["agent.c"];
    sdk_version = "current";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-DAGENT_NR=1"
    ];
};

libjvmtiattachingtestagent2 = cc_test_library {
    name = "libjvmtiattachingtestagent2";
    gtest = false;
    srcs = ["agent.c"];
    sdk_version = "current";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-DAGENT_NR=2"
    ];
};

libjvmtiattachingtestagent3 = cc_test_library {
    name = "libjvmtiattachingtestagent3";
    gtest = false;
    srcs = ["agent.c"];
    sdk_version = "current";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-DAGENT_NR=3"
    ];
};

libjvmtiattachingtestagent4 = cc_test_library {
    name = "libjvmtiattachingtestagent4";
    gtest = false;
    srcs = ["agent.c"];
    sdk_version = "current";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-DAGENT_NR=4"
    ];
};

in { inherit libjvmtiattachingtestagent1 libjvmtiattachingtestagent2 libjvmtiattachingtestagent3 libjvmtiattachingtestagent4; }
