{ android_test, cc_test_library }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

libCtsAppOpsTestCases_jni = cc_test_library {
    name = "libCtsAppOpsTestCases_jni";

    stl = "libc++_static";
    gtest = false;
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];

    srcs = ["jni/android/app/appops/cts/AppOpsLoggingTest.cpp"];

    shared_libs = [
        "libbinder"
        "libutils"
        "liblog"
    ];
};

CtsAppOpsTestCases = android_test {
    name = "CtsAppOpsTestCases";

    compile_multilib = "both";

    srcs = [
        "src/android/app/appops/cts/AppOpEventCollectionTest.kt"
        "src/android/app/appops/cts/AppOpsLoggingTest.kt"
        "src/android/app/appops/cts/AppOpsTest.kt"
        "src/android/app/appops/cts/AttributionTest.kt"
        "src/android/app/appops/cts/ForegroundModeTest.kt"
        "src/android/app/appops/cts/HistoricalAppopsTest.kt"
        "src/android/app/appops/cts/RuntimeMessageCollectionTest.kt"
        "src/android/app/appops/cts/UidStateForceActivity.kt"
    ];

    static_libs = [
        "bluetooth-test-util-lib"
        "appops-test-util-lib"
        "AppOpsUserServiceAidl"
        "AppOpsForegroundControlServiceAidl"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "androidx.legacy_legacy-support-v4"
        "platform-test-annotations"
        "truth-prebuilt"
        "androidx.test.uiautomator_uiautomator"
    ];

    jni_libs = [
        "ld-android"
        "libbacktrace"
        "libbase"
        "libbinder"
        "libbpf"
        "libbpf_android"
        "libc++"
        "libcgrouprc"
        "libcrypto"
        "libcutils"
        "libdl_android"
        "libhidl-gen-utils"
        "libhidlbase"
        "libjsoncpp"
        "liblog"
        "liblzma"
        "libnativehelper"
        "libnetdbpf"
        "libnetdutils"
        "libnetworkstatsfactorytestjni"
        "libpackagelistparser"
        "libpcre2"
        "libprocessgroup"
        "libselinux"
        "libtinyxml2"
        "libui"
        "libunwindstack"
        "libutils"
        "libutilscallstack"
        "libvndksupport"
        "libziparchive"
        "libz"
        "libCtsAppOpsTestCases_jni"
    ];

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsAppOpsTestCases libCtsAppOpsTestCases_jni; }
