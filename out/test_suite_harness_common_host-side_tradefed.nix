{ java_library_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

compatibility-tradefed = java_library_host {
    name = "compatibility-tradefed";
    srcs = [
        "src/com/android/compatibility/common/tradefed/build/CompatibilityBuildHelper.java"
        "src/com/android/compatibility/common/tradefed/build/CompatibilityBuildProvider.java"
        "src/com/android/compatibility/common/tradefed/command/CompatibilityConsole.java"
        "src/com/android/compatibility/common/tradefed/result/ConsoleReporter.java"
        "src/com/android/compatibility/common/tradefed/result/IModuleListener.java"
        "src/com/android/compatibility/common/tradefed/result/InvocationFailureHandler.java"
        "src/com/android/compatibility/common/tradefed/result/MetadataReporter.java"
        "src/com/android/compatibility/common/tradefed/result/ModuleListener.java"
        "src/com/android/compatibility/common/tradefed/result/ResultReporter.java"
        "src/com/android/compatibility/common/tradefed/result/SubPlanHelper.java"
        "src/com/android/compatibility/common/tradefed/result/TestRunHandler.java"
        "src/com/android/compatibility/common/tradefed/result/suite/CertificationChecksumHelper.java"
        "src/com/android/compatibility/common/tradefed/result/suite/CertificationResultXml.java"
        "src/com/android/compatibility/common/tradefed/result/suite/CertificationSuiteResultReporter.java"
        "src/com/android/compatibility/common/tradefed/result/suite/CompatibilityProtoResultReporter.java"
        "src/com/android/compatibility/common/tradefed/result/suite/PreviousResultLoader.java"
        "src/com/android/compatibility/common/tradefed/result/suite/PreviousSessionFileCopier.java"
        "src/com/android/compatibility/common/tradefed/targetprep/ApkInstaller.java"
        "src/com/android/compatibility/common/tradefed/targetprep/ApkInstrumentationPreparer.java"
        "src/com/android/compatibility/common/tradefed/targetprep/ApkPreconditionCheck.java"
        "src/com/android/compatibility/common/tradefed/targetprep/BuildFingerPrintPreparer.java"
        "src/com/android/compatibility/common/tradefed/targetprep/BusinessLogicPreparer.java"
        "src/com/android/compatibility/common/tradefed/targetprep/CrashReporter.java"
        "src/com/android/compatibility/common/tradefed/targetprep/DeviceFileCollector.java"
        "src/com/android/compatibility/common/tradefed/targetprep/DeviceInfoCollector.java"
        "src/com/android/compatibility/common/tradefed/targetprep/DynamicConfigPusher.java"
        "src/com/android/compatibility/common/tradefed/targetprep/FilePusher.java"
        "src/com/android/compatibility/common/tradefed/targetprep/LocationCheck.java"
        "src/com/android/compatibility/common/tradefed/targetprep/MediaPreparer.java"
        "src/com/android/compatibility/common/tradefed/targetprep/NetworkConnectivityChecker.java"
        "src/com/android/compatibility/common/tradefed/targetprep/PackageDisabler.java"
        "src/com/android/compatibility/common/tradefed/targetprep/PreconditionPreparer.java"
        "src/com/android/compatibility/common/tradefed/targetprep/PropertyCheck.java"
        "src/com/android/compatibility/common/tradefed/targetprep/ReportLogCollector.java"
        "src/com/android/compatibility/common/tradefed/targetprep/SettingsPreparer.java"
        "src/com/android/compatibility/common/tradefed/targetprep/StayAwakePreparer.java"
        "src/com/android/compatibility/common/tradefed/targetprep/TokenRequirement.java"
        "src/com/android/compatibility/common/tradefed/targetprep/WifiCheck.java"
        "src/com/android/compatibility/common/tradefed/testtype/BusinessLogicHostTestBase.java"
        "src/com/android/compatibility/common/tradefed/testtype/CompatibilityTest.java"
        "src/com/android/compatibility/common/tradefed/testtype/FailureListener.java"
        "src/com/android/compatibility/common/tradefed/testtype/IModuleDef.java"
        "src/com/android/compatibility/common/tradefed/testtype/IModuleRepo.java"
        "src/com/android/compatibility/common/tradefed/testtype/ISubPlan.java"
        "src/com/android/compatibility/common/tradefed/testtype/JarHostTest.java"
        "src/com/android/compatibility/common/tradefed/testtype/ModuleDef.java"
        "src/com/android/compatibility/common/tradefed/testtype/ModuleRepo.java"
        "src/com/android/compatibility/common/tradefed/testtype/SubPlan.java"
        "src/com/android/compatibility/common/tradefed/testtype/retry/RetryFactoryTest.java"
        "src/com/android/compatibility/common/tradefed/testtype/suite/CompatibilitySuiteModuleLoader.java"
        "src/com/android/compatibility/common/tradefed/testtype/suite/CompatibilityTestSuite.java"
        "src/com/android/compatibility/common/tradefed/util/CollectorUtil.java"
        "src/com/android/compatibility/common/tradefed/util/DynamicConfigFileReader.java"
        "src/com/android/compatibility/common/tradefed/util/FingerprintComparisonException.java"
        "src/com/android/compatibility/common/tradefed/util/LinearPartition.java"
        "src/com/android/compatibility/common/tradefed/util/OptionHelper.java"
        "src/com/android/compatibility/common/tradefed/util/RetryFilterHelper.java"
        "src/com/android/compatibility/common/tradefed/util/RetryType.java"
        "src/com/android/compatibility/common/tradefed/util/UniqueModuleCountUtil.java"
    ];
    java_resource_dirs = ["res"];
    defaults = ["tradefed_errorprone_defaults"];
    libs = [
        "tradefed"
        "compatibility-host-util"
        "google-api-java-client-min-repackaged"
    ];
};

in { inherit compatibility-tradefed; }
