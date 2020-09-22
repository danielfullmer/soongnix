{ android_app, java_test_host }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

sdkextensions_e2e_tests = java_test_host {
    name = "sdkextensions_e2e_tests";
    srcs = ["test-src/com/android/tests/apex/sdkextensions/SdkExtensionsHostTest.java"];
    libs = ["tradefed"];
    static_libs = ["apex_e2e_base_test"];
    data = [
        ":sdkextensions_e2e_test_app"
        ":test_com.android.media"
        ":test_com.android.sdkext"
    ];
    test_config = "sdkextensions-e2e-tests.xml";
    test_suites = ["device-tests"];
};

sdkextensions_e2e_test_app = android_app {
    name = "sdkextensions_e2e_test_app";
    srcs = ["app-src/com/android/tests/apex/sdkextensions/Receiver.java"];
    libs = ["test_framework-sdkextensions-stubs"];
    sdk_version = "system_current";
};

in { inherit sdkextensions_e2e_test_app sdkextensions_e2e_tests; }
