{ java_test_host, tradefed_binary_host }:
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

compatibility-tradefed-tests = java_test_host {
    name = "compatibility-tradefed-tests";
    defaults = ["tradefed_errorprone_defaults"];

    srcs = [
        "src/com/android/compatibility/common/tradefed/UnitTests.java"
        "src/com/android/compatibility/common/tradefed/build/CompatibilityBuildHelperTest.java"
        "src/com/android/compatibility/common/tradefed/build/CompatibilityBuildProviderTest.java"
        "src/com/android/compatibility/common/tradefed/command/CompatibilityConsoleTest.java"
        "src/com/android/compatibility/common/tradefed/config/ConfigurationFactoryTest.java"
        "src/com/android/compatibility/common/tradefed/presubmit/ApkPackageNameCheck.java"
        "src/com/android/compatibility/common/tradefed/presubmit/CtsConfigLoadingTest.java"
        "src/com/android/compatibility/common/tradefed/presubmit/DupFileTest.java"
        "src/com/android/compatibility/common/tradefed/presubmit/IntegrationTest.java"
        "src/com/android/compatibility/common/tradefed/presubmit/PresubmitSetupValidation.java"
        "src/com/android/compatibility/common/tradefed/presubmit/ValidateTestsAbi.java"
        "src/com/android/compatibility/common/tradefed/result/ChecksumReporterTest.java"
        "src/com/android/compatibility/common/tradefed/result/ConsoleReporterTest.java"
        "src/com/android/compatibility/common/tradefed/result/MetadataReporterTest.java"
        "src/com/android/compatibility/common/tradefed/result/ResultReporterBuildInfoTest.java"
        "src/com/android/compatibility/common/tradefed/result/ResultReporterTest.java"
        "src/com/android/compatibility/common/tradefed/result/SubPlanHelperTest.java"
        "src/com/android/compatibility/common/tradefed/result/suite/CertificationChecksumHelperTest.java"
        "src/com/android/compatibility/common/tradefed/result/suite/CertificationSuiteResultReporterTest.java"
        "src/com/android/compatibility/common/tradefed/result/suite/PreviousResultLoaderTest.java"
        "src/com/android/compatibility/common/tradefed/result/suite/PreviousSessionFileCopierTest.java"
        "src/com/android/compatibility/common/tradefed/targetprep/BusinessLogicPreparerTest.java"
        "src/com/android/compatibility/common/tradefed/targetprep/DeviceInfoCollectorTest.java"
        "src/com/android/compatibility/common/tradefed/targetprep/DeviceInteractionHelperInstallerTest.java"
        "src/com/android/compatibility/common/tradefed/targetprep/DynamicConfigPusherTest.java"
        "src/com/android/compatibility/common/tradefed/targetprep/MediaPreparerTest.java"
        "src/com/android/compatibility/common/tradefed/targetprep/PropertyCheckTest.java"
        "src/com/android/compatibility/common/tradefed/targetprep/SettingsPreparerTest.java"
        "src/com/android/compatibility/common/tradefed/targetprep/VtsDeviceInfoCollectorTest.java"
        "src/com/android/compatibility/common/tradefed/testtype/CompatibilityTestTest.java"
        "src/com/android/compatibility/common/tradefed/testtype/JarHostTestTest.java"
        "src/com/android/compatibility/common/tradefed/testtype/ModuleDefTest.java"
        "src/com/android/compatibility/common/tradefed/testtype/ModuleRepoTest.java"
        "src/com/android/compatibility/common/tradefed/testtype/ShardableTestStub.java"
        "src/com/android/compatibility/common/tradefed/testtype/SimpleTestStub.java"
        "src/com/android/compatibility/common/tradefed/testtype/SubPlanTest.java"
        "src/com/android/compatibility/common/tradefed/testtype/TestStub.java"
        "src/com/android/compatibility/common/tradefed/testtype/retry/RetryFactoryTestTest.java"
        "src/com/android/compatibility/common/tradefed/util/CollectorUtilTest.java"
        "src/com/android/compatibility/common/tradefed/util/DynamicConfigFileReaderTest.java"
        "src/com/android/compatibility/common/tradefed/util/OptionHelperTest.java"
        "src/com/android/compatibility/common/tradefed/util/RetryFilterHelperTest.java"
        "src/com/android/compatibility/common/tradefed/util/UniqueModuleCountUtilTest.java"
    ];
    java_resource_dirs = ["res"];

    libs = [
        "tradefed"
        "compatibility-mock-tradefed"
        "junit-host"
        "compatibility-host-util"
        "easymock"
        "objenesis-host"
        "mockito-host"
    ];
};

compatibility-mock-tradefed = tradefed_binary_host {
    name = "compatibility-mock-tradefed";
    short_name = "TESTS";
    full_name = "Compatibility Tests";
    version = "1";
    static_libs = ["cts-tradefed-harness"];
};

in { inherit compatibility-mock-tradefed compatibility-tradefed-tests; }
