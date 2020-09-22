{ android_test, java_library }:
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

FrameworksNetIntegrationTests = android_test {
    name = "FrameworksNetIntegrationTests";
    platform_apis = true;
    certificate = "platform";
    srcs = [
        "src/android/net/TestNetworkStackClient.kt"
        "src/com/android/server/net/integrationtests/ConnectivityServiceIntegrationTest.kt"
        "src/com/android/server/net/integrationtests/HttpResponse.kt"
        "src/com/android/server/net/integrationtests/NetworkStackInstrumentationService.kt"
        "src/com/android/server/net/integrationtests/TestNetworkStackService.kt"
        "src/com/android/server/net/integrationtests/HttpResponse.aidl"
        "src/com/android/server/net/integrationtests/INetworkStackInstrumentation.aidl"
    ];
    libs = [
        "android.test.mock"
    ];
    static_libs = [
        "TestNetworkStackLib"
        "androidx.test.ext.junit"
        "frameworks-net-integration-testutils"
        "kotlin-reflect"
        "mockito-target-extended-minus-junit4"
        "net-tests-utils"
        "services.core"
        "services.net"
        "testables"
    ];
    test_suites = ["device-tests"];
    use_embedded_native_libs = true;
    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
        #  android_library does not include JNI libs: include NetworkStack dependencies here
        "libnativehelper_compat_libc++"
        "libnetworkstackutilsjni"
    ];
};

#  Utilities for testing framework code both in integration and unit tests.
frameworks-net-integration-testutils = java_library {
    name = "frameworks-net-integration-testutils";
    srcs = [
        "util/com/android/server/NetworkAgentWrapper.java"
        "util/com/android/server/ConnectivityServiceTestUtils.kt"
        "util/com/android/server/TestNetIdManager.kt"
    ];
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.test.rules"
        "junit"
        "net-tests-utils"
    ];
    libs = [
        "services.core"
        "services.net"
    ];
};

in { inherit FrameworksNetIntegrationTests frameworks-net-integration-testutils; }
