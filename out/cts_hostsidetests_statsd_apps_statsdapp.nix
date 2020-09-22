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
        "src/com/android/server/cts/device/statsd/ANRActivity.java"
        "src/com/android/server/cts/device/statsd/AtomTests.java"
        "src/com/android/server/cts/device/statsd/Checkers.java"
        "src/com/android/server/cts/device/statsd/DaveyActivity.java"
        "src/com/android/server/cts/device/statsd/DaveyView.java"
        "src/com/android/server/cts/device/statsd/DirectoryTests.java"
        "src/com/android/server/cts/device/statsd/DummyCallscreeningService.java"
        "src/com/android/server/cts/device/statsd/HiddenApiUsedActivity.java"
        "src/com/android/server/cts/device/statsd/IsolatedProcessService.java"
        "src/com/android/server/cts/device/statsd/StatsdAuthenticator.java"
        "src/com/android/server/cts/device/statsd/StatsdCtsBackgroundService.java"
        "src/com/android/server/cts/device/statsd/StatsdCtsForegroundActivity.java"
        "src/com/android/server/cts/device/statsd/StatsdCtsForegroundService.java"
        "src/com/android/server/cts/device/statsd/StatsdJobService.java"
        "src/com/android/server/cts/device/statsd/StatsdProvider.java"
        "src/com/android/server/cts/device/statsd/StatsdSyncAdapter.java"
        "src/com/android/server/cts/device/statsd/StatsdSyncService.java"
        "src/com/android/server/cts/device/statsd/VideoPlayerActivity.java"
        "src/com/android/server/cts/device/statsd/WakelockLoadTestRunnable.java"
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
        "cts-net-utils"
        "BlobStoreTestUtils"
    ];
    jni_libs = ["liblmkhelper"];
    compile_multilib = "both";
};

statslog-statsd-cts-java-gen = genrule {
    name = "statslog-statsd-cts-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module cts --javaPackage com.android.server.cts.device.statsd --javaClass StatsLogStatsdCts";
    out = ["com/android/server/cts/device/statsd/StatsLogStatsdCts.java"];
};

in { inherit CtsStatsdApp liblmkhelper statslog-statsd-cts-java-gen; }
