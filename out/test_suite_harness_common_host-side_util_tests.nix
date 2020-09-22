{ java_test_host }:
let

#  Copyright (C) 2015 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

compatibility-host-util-tests = java_test_host {
    name = "compatibility-host-util-tests";
    defaults = ["cts_error_prone_rules"];

    srcs = [
        "src/com/android/compatibility/common/util/BusinessLogicHostExecutorTest.java"
        "src/com/android/compatibility/common/util/DynamicConfigHandlerTest.java"
        "src/com/android/compatibility/common/util/HostUnitTests.java"
        "src/com/android/compatibility/common/util/ModuleResultTest.java"
        "src/com/android/compatibility/common/util/PollingCheckTest.java"
        "src/com/android/compatibility/common/util/TestFilterTest.java"
    ];

    static_libs = [
        "objenesis-host"
        "mockito-host"
    ];

    libs = [
        "compatibility-host-util"
        "easymock"
        "junit"
        "json-prebuilt"
        "tradefed"
    ];
};

in { inherit compatibility-host-util-tests; }
