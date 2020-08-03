{ android_test_helper_app, cc_library_shared, genrule }:
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

liblmkhelper = cc_library_shared {
    name = "liblmkhelper";
    srcs = ["jni/alloc_stress_activity.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["liblog"];
    stl = "c++_static";
    sdk_version = "current";
};

CtsStatsdApp = android_test_helper_app {
    name = "CtsStatsdApp";
    defaults = ["cts_defaults"];
    platform_apis = true;
    min_sdk_version = "24";
    srcs = [
        "src/**/*.java"
        ":statslog-statsd-cts-java-gen"
    ];
    libs = [
        "android.test.runner.stubs"
        "junit"
        "org.apache.http.legacy"
    ];
    privileged = true;
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "androidx.legacy_legacy-support-v4"
        "androidx.test.rules"
    ];
    jni_libs = ["liblmkhelper"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    compile_multilib = "both";
};

statslog-statsd-cts-java-gen = genrule {
    name = "statslog-statsd-cts-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module cts --javaPackage com.android.server.cts.device.statsd --javaClass StatsLogStatsdCts";
    out = ["com/android/server/cts/device/statsd/StatsLogStatsdCts.java"];
};

in { inherit CtsStatsdApp liblmkhelper statslog-statsd-cts-java-gen; }
