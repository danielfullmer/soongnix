{ android_test_helper_app }:
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

CtsPerfettoDebuggableApp = android_test_helper_app {
    name = "CtsPerfettoDebuggableApp";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    manifest = "AndroidManifest_debuggable.xml";

    compile_multilib = "both";
    srcs = [
        "src/android/perfetto/cts/app/BusyWaitActivity.java"
        "src/android/perfetto/cts/app/MainActivity.java"
    ];
    sdk_version = "current";
    jni_libs = [
        "libperfettocts_native"
        "libnativehelper_compat_libc++"
    ];
    jni_uses_platform_apis = true;
};

CtsPerfettoReleaseApp = android_test_helper_app {
    name = "CtsPerfettoReleaseApp";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    manifest = "AndroidManifest_release.xml";

    compile_multilib = "both";
    srcs = [
        "src/android/perfetto/cts/app/BusyWaitActivity.java"
        "src/android/perfetto/cts/app/MainActivity.java"
    ];
    sdk_version = "current";
    jni_libs = [
        "libperfettocts_native"
        "libnativehelper_compat_libc++"
    ];
    jni_uses_platform_apis = true;
};

CtsPerfettoProfileableApp = android_test_helper_app {
    name = "CtsPerfettoProfileableApp";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    manifest = "AndroidManifest_profileable.xml";

    compile_multilib = "both";
    srcs = [
        "src/android/perfetto/cts/app/BusyWaitActivity.java"
        "src/android/perfetto/cts/app/MainActivity.java"
    ];
    sdk_version = "current";
    jni_libs = [
        "libperfettocts_native"
        "libnativehelper_compat_libc++"
    ];
    jni_uses_platform_apis = true;
};

in { inherit CtsPerfettoDebuggableApp CtsPerfettoProfileableApp CtsPerfettoReleaseApp; }
