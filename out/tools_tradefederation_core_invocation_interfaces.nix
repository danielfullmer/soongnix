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

tradefed-invocation-interfaces = java_library_host {
    name = "tradefed-invocation-interfaces";
    defaults = ["tradefed_defaults"];
    srcs = [
        "com/android/tradefed/config/ConfigurationDescriptor.java"
        "com/android/tradefed/invoker/ExecutionFiles.java"
        "com/android/tradefed/invoker/ExecutionProperties.java"
        "com/android/tradefed/invoker/IInvocationContext.java"
        "com/android/tradefed/invoker/TestInformation.java"
        "com/android/tradefed/invoker/logger/CurrentInvocation.java"
        "com/android/tradefed/invoker/logger/InvocationLocal.java"
        "com/android/tradefed/invoker/logger/InvocationMetricLogger.java"
        "com/android/tradefed/invoker/shard/token/ITokenProvider.java"
        "com/android/tradefed/invoker/shard/token/ITokenRequest.java"
        "com/android/tradefed/invoker/shard/token/TokenProperty.java"
        "com/android/tradefed/result/ILogSaver.java"
        "com/android/tradefed/result/ILogSaverListener.java"
        "com/android/tradefed/result/IShardableListener.java"
        "com/android/tradefed/result/ITestInvocationListener.java"
        "com/android/tradefed/result/ITestSummaryListener.java"
        "com/android/tradefed/result/InvocationStatus.java"
        "com/android/tradefed/result/InvocationSummaryHelper.java"
        "com/android/tradefed/result/LogFile.java"
        "com/android/tradefed/result/TestResult.java"
        "com/android/tradefed/result/TestRunResult.java"
        "com/android/tradefed/result/TestSummary.java"
        "com/android/tradefed/result/retry/ISupportGranularResults.java"
        "com/android/tradefed/retry/MergeStrategy.java"
        "com/android/tradefed/retry/RetryStrategy.java"
        "com/android/tradefed/testtype/IRemoteTest.java"
    ];
    libs = [
        "ddmlib-prebuilt"
        "guava"
        "tradefed-common-util"
        "tradefed-protos"
        "tradefed-result-interfaces"
        "tradefed-device-build-interfaces"
    ];
};

in { inherit tradefed-invocation-interfaces; }
