{ android_test_helper_app }:
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

CtsErrorsApp = android_test_helper_app {
    name = "CtsErrorsApp";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/server/cts/errors/ANRActivity.java"
        "src/com/android/server/cts/errors/ErrorsTests.java"
        "src/com/android/server/cts/errors/ExceptionActivity.java"
        "src/com/android/server/cts/errors/NativeActivity.java"
        "src/com/android/server/cts/errors/Receiver.java"
    ];
    compile_multilib = "both";
    libs = [
        "android.test.runner.stubs"
        "junit"
    ];
    #  Includes the jni code as a shared library
    jni_libs = ["libcrash-jni"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "androidx.legacy_legacy-support-v4"
    ];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsErrorsApp; }
