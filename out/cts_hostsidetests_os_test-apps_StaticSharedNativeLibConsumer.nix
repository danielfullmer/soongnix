{ android_test_helper_app, cc_test_library }:
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

CtsStaticSharedNativeLibConsumer = android_test_helper_app {
    name = "CtsStaticSharedNativeLibConsumer";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/os/lib/consumer/UseSharedLibraryTest.java"];
    static_libs = ["androidx.test.rules"];
    jni_libs = ["libstaticsharednativelibconsumerjni"];
    sdk_version = "current";
    compile_multilib = "both";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

libstaticsharednativelibconsumerjni = cc_test_library {
    name = "libstaticsharednativelibconsumerjni";
    gtest = false;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = ["jni/version.cpp"];
    shared_libs = [
        "liblog"
        "libstaticsharednativelibprovider"
    ];
    sdk_version = "current";
    stl = "none";
};

in { inherit CtsStaticSharedNativeLibConsumer libstaticsharednativelibconsumerjni; }