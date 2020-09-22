{ java_defaults, java_library }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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
#

net-tests-utils-multivariant = java_library {
    name = "net-tests-utils-multivariant";
    srcs = [
        "multivariant/com/android/testutils/ExceptionUtils.java"
        "multivariant/com/android/testutils/ConcurrentUtils.kt"
        "multivariant/com/android/testutils/FileUtils.kt"
        "multivariant/com/android/testutils/MiscAsserts.kt"
        "multivariant/com/android/testutils/PacketFilter.kt"
        "multivariant/com/android/testutils/SkipPresubmit.kt"
        "multivariant/com/android/testutils/TrackRecord.kt"
    ];
    host_supported = true;
    static_libs = [
        "kotlin-test"
        "junit"
    ];
};

net-tests-utils = java_library {
    name = "net-tests-utils";
    srcs = [
        "src/com/android/testutils/TapPacketReader.java"
        "src/com/android/testutils/ConcurrentIntepreter.kt"
        "src/com/android/testutils/DevSdkIgnoreRule.kt"
        "src/com/android/testutils/DevSdkIgnoreRunner.kt"
        "src/com/android/testutils/FakeDns.kt"
        "src/com/android/testutils/HandlerUtils.kt"
        "src/com/android/testutils/NetworkStatsUtils.kt"
        "src/com/android/testutils/ParcelUtils.kt"
        "src/com/android/testutils/TestNetworkTracker.kt"
        "src/com/android/testutils/TestableNetworkCallback.kt"
        "src/com/android/testutils/TestableNetworkStatsProvider.kt"
        "src/com/android/testutils/TestableNetworkStatsProviderBinder.kt"
        "src/com/android/testutils/TestableNetworkStatsProviderCbBinder.kt"
        ":net-module-utils-srcs-for-tests"
    ];
    defaults = ["lib_mockito_extended"];
    libs = [
        "androidx.annotation_annotation"
    ];
    static_libs = [
        "androidx.test.ext.junit"
        "net-tests-utils-multivariant"
    ];
};

lib_mockito_extended = java_defaults {
    name = "lib_mockito_extended";
    static_libs = [
        "mockito-target-extended-minus-junit4"
    ];
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];
};

in { inherit lib_mockito_extended net-tests-utils net-tests-utils-multivariant; }
