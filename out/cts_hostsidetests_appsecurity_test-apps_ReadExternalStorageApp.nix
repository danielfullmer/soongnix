{ android_test }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

CtsReadExternalStorageApp = android_test {
    name = "CtsReadExternalStorageApp";
    defaults = ["cts_support_defaults"];
    sdk_version = "current";
    static_libs = [
        "androidx.test.rules"
        "CtsExternalStorageTestLib"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/com/android/cts/readexternalstorageapp/ReadExternalStorageTest.java"
        "src/com/android/cts/readexternalstorageapp/ReadGiftTest.java"
        "src/com/android/cts/readexternalstorageapp/ReadMultiViewTest.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsReadExternalStorageApp; }
