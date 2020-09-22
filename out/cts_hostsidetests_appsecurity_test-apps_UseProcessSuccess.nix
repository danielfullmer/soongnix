{ android_test_helper_app }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

CtsUseProcessSuccess = android_test_helper_app {
    name = "CtsUseProcessSuccess";
    defaults = ["cts_support_defaults"];
    srcs = [
        "src/com/android/cts/useprocess/AccessNetworkTest.java"
        "src/com/android/cts/useprocess/ActivityWithNetwork1.java"
        "src/com/android/cts/useprocess/ActivityWithNetwork2.java"
        "src/com/android/cts/useprocess/ActivityWithoutNetwork1.java"
        "src/com/android/cts/useprocess/BaseNetworkService.java"
        "src/com/android/cts/useprocess/ProviderWithNetwork1.java"
        "src/com/android/cts/useprocess/ProviderWithNetwork2.java"
        "src/com/android/cts/useprocess/ProviderWithoutNetwork1.java"
        "src/com/android/cts/useprocess/ServiceWithNetwork1.java"
        "src/com/android/cts/useprocess/ServiceWithNetwork2.java"
        "src/com/android/cts/useprocess/ServiceWithNetwork3.java"
        "src/com/android/cts/useprocess/ServiceWithoutNetwork1.java"
        "src/com/android/cts/useprocess/ServiceWithoutNetwork2.java"
    ];
    sdk_version = "current";
    static_libs = ["androidx.test.rules"];
    libs = ["android.test.base.stubs"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    certificate = ":cts-testkey1";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsUseProcessSuccess; }
