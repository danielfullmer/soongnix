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

compatibility-common-util-tests = java_test_host {
    name = "compatibility-common-util-tests";
    defaults = ["cts_error_prone_rules"];

    srcs = [
        "src/com/android/compatibility/common/util/BackupUtilsTest.java"
        "src/com/android/compatibility/common/util/BusinessLogicTest.java"
        "src/com/android/compatibility/common/util/CaseResultTest.java"
        "src/com/android/compatibility/common/util/CrashUtilsTest.java"
        "src/com/android/compatibility/common/util/DynamicConfigTest.java"
        "src/com/android/compatibility/common/util/LightInvocationResultTest.java"
        "src/com/android/compatibility/common/util/MetricsXmlSerializerTest.java"
        "src/com/android/compatibility/common/util/MultipartFormTest.java"
        "src/com/android/compatibility/common/util/ReadElfTest.java"
        "src/com/android/compatibility/common/util/ReportLogTest.java"
        "src/com/android/compatibility/common/util/ResultHandlerTest.java"
        "src/com/android/compatibility/common/util/StatTest.java"
        "src/com/android/compatibility/common/util/TestResultTest.java"
        "src/com/android/compatibility/common/util/UnitTests.java"
    ];

    libs = [
        "junit"
        "kxml2-2.3.0"
        "tradefed"
        "compatibility-common-util-hostsidelib"
    ];

    #  Holds golden sample files in assets for validation
    java_resource_dirs = ["assets/"];
};

in { inherit compatibility-common-util-tests; }
