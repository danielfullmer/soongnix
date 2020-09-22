{ java_library_host }:
let

#  Copyright 2019 The Android Open Source Project
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

tradefed-result-interfaces = java_library_host {
    name = "tradefed-result-interfaces";
    defaults = ["tradefed_defaults"];
    srcs = [
        "com/android/tradefed/log/ITestLogger.java"
        "com/android/tradefed/result/ActionInProgress.java"
        "com/android/tradefed/result/FailureDescription.java"
        "com/android/tradefed/result/ITestLifeCycleReceiver.java"
        "com/android/tradefed/result/ITestLoggerReceiver.java"
        "com/android/tradefed/result/MultiFailureDescription.java"
        "com/android/tradefed/result/TestDescription.java"
        "com/android/tradefed/result/error/DeviceErrorIdentifier.java"
        "com/android/tradefed/result/error/ErrorIdentifier.java"
        "com/android/tradefed/result/error/InfraErrorIdentifier.java"
        "com/android/tradefed/util/proto/TestRecordProtoUtil.java"
        "com/android/tradefed/util/proto/TfMetricProtoUtil.java"
    ];
    libs = [
        "ddmlib-prebuilt"
        "jsr305"
        "tradefed-common-util"
        "tradefed-protos"
    ];
};

in { inherit tradefed-result-interfaces; }
