{ cc_library_shared, hiddenapi_flags, java_defaults, java_library }:
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

libclassdescriptors = cc_library_shared {
    name = "libclassdescriptors";

    srcs = ["src/jni/classdescriptors.cpp"];
    header_libs = ["libopenjdkjvmti_headers"];
    sdk_version = "current";
    stl = "c++_static";
};

cts-api-signature-test = java_library {
    name = "cts-api-signature-test";
    srcs = [
        "src/java/android/signature/cts/api/AbstractApiTest.java"
        "src/java/android/signature/cts/api/BaseKillswitchTest.java"
        "src/java/android/signature/cts/api/BootClassPathClassesProvider.java"
        "src/java/android/signature/cts/api/DebugClassHiddenApiTest.java"
        "src/java/android/signature/cts/api/DebugClassKillswitchTest.java"
        "src/java/android/signature/cts/api/HiddenApiTest.java"
        "src/java/android/signature/cts/api/SignatureTest.java"
        "src/java/android/signature/cts/api/TestResultObserver.java"
        "src/java/android/signature/cts/api/WhitelistKillswitchTest.java"
        "src/java/android/signature/cts/api/WildcardKillswitchTest.java"
    ];
    sdk_version = "test_current";
    static_libs = [
        "cts-signature-common"
        "repackaged.android.test.base"
        "repackaged.android.test.runner"
    ];
};

#  Defaults for signature api checks.
signature-api-check-defaults = java_defaults {
    name = "signature-api-check-defaults";
    defaults = ["cts_defaults"];
    srcs = [
        "src/java/android/signature/cts/api/AbstractApiTest.java"
        "src/java/android/signature/cts/api/BaseKillswitchTest.java"
        "src/java/android/signature/cts/api/BootClassPathClassesProvider.java"
        "src/java/android/signature/cts/api/DebugClassHiddenApiTest.java"
        "src/java/android/signature/cts/api/DebugClassKillswitchTest.java"
        "src/java/android/signature/cts/api/HiddenApiTest.java"
        "src/java/android/signature/cts/api/SignatureTest.java"
        "src/java/android/signature/cts/api/TestResultObserver.java"
        "src/java/android/signature/cts/api/WhitelistKillswitchTest.java"
        "src/java/android/signature/cts/api/WildcardKillswitchTest.java"
    ];
    static_libs = [
        "cts-api-signature-test"
    ];
    jni_libs = [
        "libclassdescriptors"
    ];
    sdk_version = "test_current";
    compile_multilib = "both";
};

#  Defaults for hiddenapi killswitch checks.
hiddenapi-killswitch-check-defaults = java_defaults {
    name = "hiddenapi-killswitch-check-defaults";
    defaults = ["cts_defaults"];

    compile_multilib = "both";
    jni_libs = [
        "libcts_dexchecker"
        "libclassdescriptors"
    ];
    stl = "c++_static";

    #  Tag this module as a cts test artifact
    sdk_version = "test_current";
    static_libs = ["cts-api-signature-test"];
};

#  Access the hiddenapi-flags.csv file produced by the build.
cts-hiddenapi-flags-csv = hiddenapi_flags {
    name = "cts-hiddenapi-flags-csv";
    filename = "hiddenapi-flags.csv";
};

#  Defaults for hiddenapi blacklist checks.
hiddenapi-blacklist-check-defaults = java_defaults {
    name = "hiddenapi-blacklist-check-defaults";
    defaults = ["signature-api-check-defaults"];
    java_resources = [
        ":cts-hiddenapi-flags-csv"
    ];
    jni_libs = [
        "libcts_dexchecker"
    ];
};

in { inherit cts-api-signature-test cts-hiddenapi-flags-csv hiddenapi-blacklist-check-defaults hiddenapi-killswitch-check-defaults libclassdescriptors signature-api-check-defaults; }
