{ java_library_host, java_library_static }:
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

#  Build the common utility library for use device-side
compatibility-common-util-devicesidelib = java_library_static {
    name = "compatibility-common-util-devicesidelib";
    sdk_version = "current";

    srcs = [
        "src/com/android/compatibility/common/util/AbiUtils.java"
        "src/com/android/compatibility/common/util/BackupUtils.java"
        "src/com/android/compatibility/common/util/BusinessLogic.java"
        "src/com/android/compatibility/common/util/BusinessLogicExecutor.java"
        "src/com/android/compatibility/common/util/BusinessLogicFactory.java"
        "src/com/android/compatibility/common/util/CaseResult.java"
        "src/com/android/compatibility/common/util/CddTest.java"
        "src/com/android/compatibility/common/util/ChecksumReporter.java"
        "src/com/android/compatibility/common/util/CommonTestUtils.java"
        "src/com/android/compatibility/common/util/CrashUtils.java"
        "src/com/android/compatibility/common/util/CtsDownstreamingTest.java"
        "src/com/android/compatibility/common/util/DevicePropertyInfo.java"
        "src/com/android/compatibility/common/util/DynamicConfig.java"
        "src/com/android/compatibility/common/util/FileUtil.java"
        "src/com/android/compatibility/common/util/ICaseResult.java"
        "src/com/android/compatibility/common/util/IInvocationResult.java"
        "src/com/android/compatibility/common/util/IModuleResult.java"
        "src/com/android/compatibility/common/util/ITestResult.java"
        "src/com/android/compatibility/common/util/InfoStore.java"
        "src/com/android/compatibility/common/util/InvocationResult.java"
        "src/com/android/compatibility/common/util/KeyValueArgsParser.java"
        "src/com/android/compatibility/common/util/LightInvocationResult.java"
        "src/com/android/compatibility/common/util/LogcatInspector.java"
        "src/com/android/compatibility/common/util/MeasureRun.java"
        "src/com/android/compatibility/common/util/MeasureTime.java"
        "src/com/android/compatibility/common/util/MetricsXmlSerializer.java"
        "src/com/android/compatibility/common/util/ModuleResult.java"
        "src/com/android/compatibility/common/util/MultipartForm.java"
        "src/com/android/compatibility/common/util/ReadElf.java"
        "src/com/android/compatibility/common/util/ReportLog.java"
        "src/com/android/compatibility/common/util/ResultHandler.java"
        "src/com/android/compatibility/common/util/ResultType.java"
        "src/com/android/compatibility/common/util/ResultUnit.java"
        "src/com/android/compatibility/common/util/ResultUploader.java"
        "src/com/android/compatibility/common/util/RetryChecksumStatus.java"
        "src/com/android/compatibility/common/util/Stacktrace.java"
        "src/com/android/compatibility/common/util/Stat.java"
        "src/com/android/compatibility/common/util/StreamUtil.java"
        "src/com/android/compatibility/common/util/TestResult.java"
        "src/com/android/compatibility/common/util/TestResultHistory.java"
        "src/com/android/compatibility/common/util/TestStatus.java"
        "src/com/android/compatibility/common/util/VendorInterfaceTest.java"
        "src/com/android/compatibility/common/util/VersionCodes.java"
        "src/com/android/compatibility/common/util/ZipUtil.java"
    ];

    static_libs = [
        "guava"
        "junit"
    ];
};

#  Build the common utility library for use host-side
compatibility-common-util-hostsidelib = java_library_host {
    name = "compatibility-common-util-hostsidelib";
    defaults = ["cts_error_prone_rules"];

    srcs = [
        "src/com/android/compatibility/common/util/AbiUtils.java"
        "src/com/android/compatibility/common/util/BackupUtils.java"
        "src/com/android/compatibility/common/util/BusinessLogic.java"
        "src/com/android/compatibility/common/util/BusinessLogicExecutor.java"
        "src/com/android/compatibility/common/util/BusinessLogicFactory.java"
        "src/com/android/compatibility/common/util/CaseResult.java"
        "src/com/android/compatibility/common/util/CddTest.java"
        "src/com/android/compatibility/common/util/ChecksumReporter.java"
        "src/com/android/compatibility/common/util/CommonTestUtils.java"
        "src/com/android/compatibility/common/util/CrashUtils.java"
        "src/com/android/compatibility/common/util/CtsDownstreamingTest.java"
        "src/com/android/compatibility/common/util/DevicePropertyInfo.java"
        "src/com/android/compatibility/common/util/DynamicConfig.java"
        "src/com/android/compatibility/common/util/FileUtil.java"
        "src/com/android/compatibility/common/util/ICaseResult.java"
        "src/com/android/compatibility/common/util/IInvocationResult.java"
        "src/com/android/compatibility/common/util/IModuleResult.java"
        "src/com/android/compatibility/common/util/ITestResult.java"
        "src/com/android/compatibility/common/util/InfoStore.java"
        "src/com/android/compatibility/common/util/InvocationResult.java"
        "src/com/android/compatibility/common/util/KeyValueArgsParser.java"
        "src/com/android/compatibility/common/util/LightInvocationResult.java"
        "src/com/android/compatibility/common/util/LogcatInspector.java"
        "src/com/android/compatibility/common/util/MeasureRun.java"
        "src/com/android/compatibility/common/util/MeasureTime.java"
        "src/com/android/compatibility/common/util/MetricsXmlSerializer.java"
        "src/com/android/compatibility/common/util/ModuleResult.java"
        "src/com/android/compatibility/common/util/MultipartForm.java"
        "src/com/android/compatibility/common/util/ReadElf.java"
        "src/com/android/compatibility/common/util/ReportLog.java"
        "src/com/android/compatibility/common/util/ResultHandler.java"
        "src/com/android/compatibility/common/util/ResultType.java"
        "src/com/android/compatibility/common/util/ResultUnit.java"
        "src/com/android/compatibility/common/util/ResultUploader.java"
        "src/com/android/compatibility/common/util/RetryChecksumStatus.java"
        "src/com/android/compatibility/common/util/Stacktrace.java"
        "src/com/android/compatibility/common/util/Stat.java"
        "src/com/android/compatibility/common/util/StreamUtil.java"
        "src/com/android/compatibility/common/util/TestResult.java"
        "src/com/android/compatibility/common/util/TestResultHistory.java"
        "src/com/android/compatibility/common/util/TestStatus.java"
        "src/com/android/compatibility/common/util/VendorInterfaceTest.java"
        "src/com/android/compatibility/common/util/VersionCodes.java"
        "src/com/android/compatibility/common/util/ZipUtil.java"
    ];

    libs = [
        "junit"
        "guava"
        "json-prebuilt"
        "platform-test-annotations"
        "kxml2-2.3.0"
    ];
};

in { inherit compatibility-common-util-devicesidelib compatibility-common-util-hostsidelib; }
