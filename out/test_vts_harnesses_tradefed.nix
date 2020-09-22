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

vts10-tradefed-harness = java_library_host {
    name = "vts10-tradefed-harness";
    srcs = [
        "src/com/android/compatibility/common/tradefed/build/VtsCompatibilityInvocationHelper.java"
        "src/com/android/compatibility/common/tradefed/result/VtsResultReporter.java"
        "src/com/android/compatibility/common/tradefed/targetprep/VtsFilePusher.java"
        "src/com/android/compatibility/common/tradefed/testtype/retry/VtsRetryFactoryTest.java"
        "src/com/android/compatibility/common/tradefed/util/VtsRetryFilterHelper.java"
        "src/com/android/tradefed/device/metric/VtsCoverageCollector.java"
        "src/com/android/tradefed/device/metric/VtsHalTraceCollector.java"
        "src/com/android/tradefed/module/VtsHalAdapterModuleController.java"
        "src/com/android/tradefed/targetprep/VtsCoveragePreparer.java"
        "src/com/android/tradefed/targetprep/VtsDevicePreparer.java"
        "src/com/android/tradefed/targetprep/VtsHalAdapterPreparer.java"
        "src/com/android/tradefed/targetprep/VtsPythonVirtualenvPreparer.java"
        "src/com/android/tradefed/targetprep/VtsTestPlanResultReporter.java"
        "src/com/android/tradefed/targetprep/VtsTraceCollectPreparer.java"
        "src/com/android/tradefed/testtype/VtsFuzzTest.java"
        "src/com/android/tradefed/testtype/VtsFuzzTestResultParser.java"
        "src/com/android/tradefed/testtype/VtsMultiDeviceTest.java"
        "src/com/android/tradefed/testtype/VtsMultiDeviceTestResultParser.java"
        "src/com/android/tradefed/util/CmdUtil.java"
        "src/com/android/tradefed/util/EnvUtil.java"
        "src/com/android/tradefed/util/JsonUtil.java"
        "src/com/android/tradefed/util/OutputUtil.java"
        "src/com/android/tradefed/util/ProcessHelper.java"
        "src/com/android/tradefed/util/VtsDashboardApiTransport.java"
        "src/com/android/tradefed/util/VtsDashboardUtil.java"
        "src/com/android/tradefed/util/VtsPythonRunnerHelper.java"
        "src/com/android/tradefed/util/VtsVendorConfigFileUtil.java"
    ];
    libs = [
        "tradefed"
        "compatibility-tradefed"
        "compatibility-host-util"
        "libvts_protos_host"
    ];
};

in { inherit vts10-tradefed-harness; }
