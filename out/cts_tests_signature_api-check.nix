{ cc_library_shared, java_library }:
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
    srcs = ["src/java/**/*.java"];
    sdk_version = "test_current";
    static_libs = [
        "cts-signature-common"
        "repackaged.android.test.base"
        "repackaged.android.test.runner"
    ];
};

in { inherit cts-api-signature-test libclassdescriptors; }
