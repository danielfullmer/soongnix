{ filegroup, genrule, java_library_static, java_sdk_library, package }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

_missingName = package {
    default_visibility = [":__pkg__"];
};

statslog-statsd-java-gen = genrule {
    name = "statslog-statsd-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module statsd" +
        " --javaPackage com.android.internal.statsd --javaClass StatsdStatsLog";
    out = ["com/android/internal/statsd/StatsdStatsLog.java"];
};

statslog-statsd = java_library_static {
    name = "statslog-statsd";
    srcs = [
        ":statslog-statsd-java-gen"
    ];
    visibility = [
        "//cts/hostsidetests/statsd/apps:__subpackages__"
    ];
};

framework-statsd-sources = filegroup {
    name = "framework-statsd-sources";
    srcs = [
        "java/android/app/StatsManager.java"
        "java/android/os/StatsDimensionsValue.java"
        "java/android/os/StatsFrameworkInitializer.java"
        "java/android/util/StatsEvent.java"
        "java/android/util/StatsLog.java"
        ":framework-statsd-aidl-sources"
        ":statslog-statsd-java-gen"
    ];
    visibility = [
        "//frameworks/base" #  For the "global" stubs.
        "//frameworks/base/apex/statsd:__subpackages__"
    ];
};

framework-statsd = java_sdk_library {
    name = "framework-statsd";
    defaults = ["framework-module-defaults"];
    installable = true;

    srcs = [
        ":framework-statsd-sources"
    ];

    permitted_packages = [
        "android.app"
        "android.os"
        "android.util"
        #  From :statslog-statsd-java-gen
        "com.android.internal.statsd"
    ];

    api_packages = [
        "android.app"
        "android.os"
        "android.util"
    ];

    hostdex = true; #  for hiddenapi check

    visibility = [
        "//frameworks/base" #  Framework
        "//frameworks/base/apex/statsd:__subpackages__" #  statsd apex
        "//frameworks/base/packages/Tethering" #  Tethering
        "//frameworks/opt/net/wifi/service" #  wifi service
        "//packages/providers/MediaProvider" #  MediaProvider apk
    ];

    #  Restrict access to implementation library.
    impl_library_visibility = [
        "//visibility:override" #  Ignore the visibility property.
        "//frameworks/base/apex/statsd:__subpackages__" #  statsd apex
    ];

    apex_available = [
        "com.android.os.statsd"
        "test_com.android.os.statsd"
    ];
};

in { inherit _missingName framework-statsd framework-statsd-sources statslog-statsd statslog-statsd-java-gen; }
