{ java_test_host }:
let

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

CtsSampleHostTestCases = java_test_host {
    name = "CtsSampleHostTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/sample/cts/SampleHostDeviceInfo.java"
        "src/android/sample/cts/SampleHostJUnit4DeviceTest.java"
        "src/android/sample/cts/SampleHostJUnit4Test.java"
        "src/android/sample/cts/SampleHostResultTest.java"
        "src/android/sample/cts/SampleHostTest.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = [
        "cts-tradefed"
        "tradefed"
        "compatibility-host-util"
    ];
    data = [
        ":CtsSampleDeviceApp"
        ":CtsSampleDeviceApp2"
    ];
};

in { inherit CtsSampleHostTestCases; }
