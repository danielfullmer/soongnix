{ android_test }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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
#

CtsDocumentProvider = android_test {
    name = "CtsDocumentProvider";
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
    ];
    srcs = [
        "src/com/android/cts/documentprovider/GetContentActivity.java"
        "src/com/android/cts/documentprovider/MyDocumentsProvider.java"
        "src/com/android/cts/documentprovider/WebLinkActivity.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "mts"
    ];
    certificate = ":cts-testkey1";
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsDocumentProvider; }
