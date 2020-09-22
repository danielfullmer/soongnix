{ java_library }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

tests-tests-networksecurityconfig-lib = java_library {
    name = "tests-tests-networksecurityconfig-lib";
    srcs = [
        "src/android/security/net/config/cts/BaseTestCase.java"
        "src/android/security/net/config/cts/TestUtils.java"
    ];
    defaults = ["cts_defaults"];
    libs = [
        "compatibility-device-util-axt"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
};

in { inherit tests-tests-networksecurityconfig-lib; }