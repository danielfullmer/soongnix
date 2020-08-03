{ java_library_static }:
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

#  temporary compatibility-device-util variant that brings in androidx.test transitively, instead
#  of android.support.test target. Will be removed after androidx.test CTS conversion is complete.
compatibility-device-util-axt = java_library_static {
    name = "compatibility-device-util-axt";
    sdk_version = "test_current";

    srcs = [
        "src/**/*.java"
        "src/**/*.aidl"
    ];

    static_libs = [
        "compatibility-common-util-devicesidelib"
        "androidx.test.rules"
        "ub-uiautomator"
        "mockito-target-minus-junit4"
        "androidx.annotation_annotation"
        "truth-prebuilt"
    ];

    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];

    jarjar_rules = "protobuf-jarjar-rules.txt";
};

in { inherit compatibility-device-util-axt; }
