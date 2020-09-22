{ java_test_host }:
let

#  Copyright 2020, The Android Open Source Project
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

CtsIncrementalInstallHostTestCases = java_test_host {
    name = "CtsIncrementalInstallHostTestCases";
    srcs = [
        "src/android/incrementalinstall/cts/IncrementalFeatureTest.java"
        "src/android/incrementalinstall/cts/IncrementalInstallTest.java"
    ];
    libs = [
        "compatibility-host-util"
        "cts-tradefed"
        "tradefed"
        "guava"
    ];
    static_libs = [
        "incremental-install-common-host-lib"
    ];
    test_suites = [
        "cts"
    ];
    data = [
        ":IncrementalTestAppDynamicAsset"
        ":IncrementalTestAppDynamicCode"
        ":IncrementalTestAppCompressedNativeLib"
        ":IncrementalTestAppUncompressedNativeLib"
    ];

};

in { inherit CtsIncrementalInstallHostTestCases; }
