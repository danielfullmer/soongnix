{ android_test, cc_library_shared }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

LibStatsPullTests = android_test {
    name = "LibStatsPullTests";
    static_libs = [
        "androidx.test.rules"
        "platformprotoslite"
        "statsdprotolite"
        "truth-prebuilt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    jni_libs = [
        "libstatspull_testhelper"
    ];
    srcs = [
        "src/com/android/internal/os/statsd/libstats/LibStatsPullTests.java"
        "src/com/android/internal/os/statsd/libstats/StatsConfigUtils.java"
        "protos/test_atoms.proto"
    ];
    test_suites = [
        "device-tests"
        "mts"
    ];
    platform_apis = true;
    privileged = true;
    certificate = "platform";
    compile_multilib = "both";
};

libstatspull_testhelper = cc_library_shared {
    name = "libstatspull_testhelper";
    srcs = ["jni/stats_pull_helper.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbinder_ndk"
        "statsd-aidl-ndk_platform"
    ];
    static_libs = [
        "libstatspull_private"
        "libstatssocket_private"
        "libutils"
        "libcutils"
    ];
};

in { inherit LibStatsPullTests libstatspull_testhelper; }
