{ java_library_host }:
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

compatibility-host-util = java_library_host {
    name = "compatibility-host-util";
    defaults = ["cts_error_prone_rules"];

    srcs = [
        "src/com/android/compatibility/common/util/ApiLevelUtil.java"
        "src/com/android/compatibility/common/util/BackupHostSideUtils.java"
        "src/com/android/compatibility/common/util/BusinessLogicHostExecutor.java"
        "src/com/android/compatibility/common/util/CpuFeatures.java"
        "src/com/android/compatibility/common/util/DeviceInfo.java"
        "src/com/android/compatibility/common/util/DynamicConfigHandler.java"
        "src/com/android/compatibility/common/util/DynamicConfigHostSide.java"
        "src/com/android/compatibility/common/util/FeatureUtil.java"
        "src/com/android/compatibility/common/util/HostInfoStore.java"
        "src/com/android/compatibility/common/util/HostSideTestUtils.java"
        "src/com/android/compatibility/common/util/MetricsReportLog.java"
        "src/com/android/compatibility/common/util/MetricsStore.java"
        "src/com/android/compatibility/common/util/MonitoringUtils.java"
        "src/com/android/compatibility/common/util/PackageUtil.java"
        "src/com/android/compatibility/common/util/PollingCheck.java"
        "src/com/android/compatibility/common/util/PropertyUtil.java"
        "src/com/android/compatibility/common/util/ProtoUtils.java"
        "src/com/android/compatibility/common/util/ReportLogHostInfoStore.java"
        "src/com/android/compatibility/common/util/RootProcessScanner.java"
        "src/com/android/compatibility/common/util/ShellCommandUtil.java"
        "src/com/android/compatibility/common/util/TestFilter.java"
    ];

    static_libs = [
        "compatibility-common-util-hostsidelib"
        "json"
    ];

    libs = [
        "json-prebuilt"
        "tradefed"
    ];
};

in { inherit compatibility-host-util; }
