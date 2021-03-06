{ java_library_host }:
let

#  Copyright (C) 2009 The Android Open Source Project
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

hosttestlib = java_library_host {
    name = "hosttestlib";

    #  Only compile source java files in this lib.
    srcs = [
        "src/com/android/hosttest/DeviceConnector.java"
        "src/com/android/hosttest/DeviceTest.java"
        "src/com/android/hosttest/DeviceTestCase.java"
        "src/com/android/hosttest/DeviceTestRunner.java"
        "src/com/android/hosttest/DeviceTestSuite.java"
    ];

    libs = [
        "ddmlib-prebuilt"
        "junit"
    ];
};

in { inherit hosttestlib; }
