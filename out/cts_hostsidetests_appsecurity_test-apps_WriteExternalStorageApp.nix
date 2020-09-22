{ android_test_helper_app, java_library }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

CtsWriteExternalStorageApp = android_test_helper_app {
    name = "CtsWriteExternalStorageApp";
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    static_libs = [
        "CtsWriteExternalStorageWriteGiftLib"
        "androidx.test.rules"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/com/android/cts/writeexternalstorageapp/ChangeDefaultUris.java"
        "src/com/android/cts/writeexternalstorageapp/WriteExternalStorageTest.java"
        "src/com/android/cts/writeexternalstorageapp/WriteGiftTest.java"
    ];
    exclude_srcs = ["src/com/android/cts/writeexternalstorageapp/WriteGiftTest.java"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsWriteExternalStorageWriteGiftLib = java_library {
    name = "CtsWriteExternalStorageWriteGiftLib";
    srcs = ["src/com/android/cts/writeexternalstorageapp/WriteGiftTest.java"];
    static_libs = ["CtsExternalStorageTestLib"];
    libs = [
        "android.test.base.stubs"
        "android.test.runner.stubs"
    ];
};

in { inherit CtsWriteExternalStorageApp CtsWriteExternalStorageWriteGiftLib; }
