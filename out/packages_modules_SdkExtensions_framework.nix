{ filegroup, java_sdk_library, package }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

_missingName = package {
    default_visibility = [":__pkg__"];
};

framework-sdkextensions-sources = filegroup {
    name = "framework-sdkextensions-sources";
    srcs = [
        "java/android/os/ext/SdkExtensions.java"
    ];
    path = "java";
    visibility = [
        "//frameworks/base" #  For the "global" stubs.
        "//packages/modules/SdkExtensions"
    ];
};

framework-sdkextensions = java_sdk_library {
    name = "framework-sdkextensions";
    srcs = [":framework-sdkextensions-sources"];
    defaults = ["framework-module-defaults"];

    permitted_packages = ["android.os.ext"];
    installable = true;
    visibility = [
        "//packages/modules/SdkExtensions"
        "//packages/modules/SdkExtensions/testing"
    ];
    hostdex = true; #  for hiddenapi check
    apex_available = [
        "com.android.sdkext"
        "test_com.android.sdkext"
    ];
};

in { inherit _missingName framework-sdkextensions framework-sdkextensions-sources; }