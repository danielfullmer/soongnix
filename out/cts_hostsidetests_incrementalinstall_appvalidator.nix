{ android_test_helper_app }:
let

#  Copyright (C) 2020 Google Inc.
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

IncrementalTestAppValidator = android_test_helper_app {
    name = "IncrementalTestAppValidator";
    srcs = [
        "src/android/incrementalinstall/inrementaltestappvalidation/AppValidationTest.java"
        "src/android/incrementalinstall/inrementaltestappvalidation/PathChecker.java"
        "src/android/incrementalinstall/inrementaltestappvalidation/StatusReceiver.java"
    ];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    test_suites = [
        "cts"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "platform-test-annotations"
        "incremental-install-common-lib"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    jni_libs = [
        "libpath_checker_jni"
        "libc++"
    ];
    compile_multilib = "both";
    platform_apis = true;
    export_package_resources = true;
    aapt_include_all_resources = true;
};

in { inherit IncrementalTestAppValidator; }
