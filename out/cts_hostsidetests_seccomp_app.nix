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

CtsSeccompDeviceApp = android_test_helper_app {
    name = "CtsSeccompDeviceApp";
    compile_multilib = "both";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
    ];
    jni_libs = [
        "libctsseccomp_jni"
        "libcts_jni"
        "libnativehelper_compat_libc++"
    ];
    srcs = [
        "src/android/seccomp/cts/app/IsolatedService.java"
        "src/android/seccomp/cts/app/SeccompDeviceTest.java"
        "src/android/seccomp/cts/app/ZygotePreload.java"
    ];
    asset_dirs = ["assets"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsSeccompDeviceApp; }
