{ java_library_host }:
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

vts10-tradefed-tests = java_library_host {
    name = "vts10-tradefed-tests";

    srcs = [
        "src/com/android/compatibility/common/tradefed/VtsUnitTests.java"
        "src/com/android/compatibility/common/tradefed/config/ConfigurationFactoryTest.java"
        "src/com/android/compatibility/common/tradefed/util/VtsRetryFilterHelperTest.java"
        "src/com/android/tradefed/VtsUnitTests.java"
        "src/com/android/tradefed/device/metric/VtsCoverageCollectorTest.java"
        "src/com/android/tradefed/device/metric/VtsHalTraceCollectorTest.java"
        "src/com/android/tradefed/module/VtsHalAdapterModuleControllerTest.java"
        "src/com/android/tradefed/presubmit/VtsConfigLoadingTest.java"
        "src/com/android/tradefed/targetprep/VtsCoveragePreparerTest.java"
        "src/com/android/tradefed/targetprep/VtsDevicePreparerTest.java"
        "src/com/android/tradefed/targetprep/VtsHalAdapterPreparerTest.java"
        "src/com/android/tradefed/targetprep/VtsPythonVirtualenvPreparerTest.java"
        "src/com/android/tradefed/targetprep/VtsTraceCollectPreparerTest.java"
        "src/com/android/tradefed/testtype/VtsFuzzTestResultParserTest.java"
        "src/com/android/tradefed/testtype/VtsFuzzTestTest.java"
        "src/com/android/tradefed/testtype/VtsMultiDeviceTestResultParserTest.java"
        "src/com/android/tradefed/testtype/VtsMultiDeviceTestTest.java"
        "src/com/android/tradefed/util/CmdUtilTest.java"
        "src/com/android/tradefed/util/OutputUtilTest.java"
        "src/com/android/tradefed/util/ProcessHelperTest.java"
        "src/com/android/tradefed/util/VtsDashboardApiTransportTest.java"
        "src/com/android/tradefed/util/VtsPythonRunnerHelperTest.java"
    ];

    static_libs = [
        "easymock"
        "mockito-host"
        "objenesis"
    ];
    libs = [
        "tradefed"
        "vts10-tradefed"
    ];
    java_resource_dirs = ["res"];
};

in { inherit vts10-tradefed-tests; }
