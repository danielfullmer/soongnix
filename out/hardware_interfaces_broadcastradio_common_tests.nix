{ cc_test }:
let

#
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

"android.hardware.broadcastradio@common-utils-xx-tests" = cc_test {
    name = "android.hardware.broadcastradio@common-utils-xx-tests";
    vendor = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    cppflags = [
        "-std=c++1z"
    ];
    srcs = [
        "CommonXX_test.cpp"
    ];
    static_libs = [
        "android.hardware.broadcastradio@common-utils-1x-lib"
        "android.hardware.broadcastradio@common-utils-2x-lib"
    ];
    shared_libs = [
        "android.hardware.broadcastradio@1.1"
        "android.hardware.broadcastradio@2.0"
    ];
    test_suites = ["general-tests"];
};

"android.hardware.broadcastradio@common-utils-2x-tests" = cc_test {
    name = "android.hardware.broadcastradio@common-utils-2x-tests";
    vendor = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    cppflags = [
        "-std=c++1z"
    ];
    srcs = [
        "IdentifierIterator_test.cpp"
        "ProgramIdentifier_test.cpp"
    ];
    static_libs = [
        "android.hardware.broadcastradio@common-utils-2x-lib"
    ];
    shared_libs = [
        "libhidlbase"
        "android.hardware.broadcastradio@2.0"
    ];
    test_suites = ["general-tests"];
};

"android.hardware.broadcastradio@common-utils-tests" = cc_test {
    name = "android.hardware.broadcastradio@common-utils-tests";
    vendor = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = [
        "WorkerThread_test.cpp"
    ];
    static_libs = ["android.hardware.broadcastradio@common-utils-lib"];
    test_suites = ["general-tests"];
};

in { inherit "android.hardware.broadcastradio@common-utils-2x-tests" "android.hardware.broadcastradio@common-utils-tests" "android.hardware.broadcastradio@common-utils-xx-tests"; }
