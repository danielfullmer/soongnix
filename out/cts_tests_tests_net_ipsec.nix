{ android_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

CtsIkeTestCases = android_test {
    name = "CtsIkeTestCases";
    defaults = ["cts_defaults"];

    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";

    libs = [
        "android.net.ipsec.ike.stubs.system"
        "android.test.base.stubs"
    ];

    srcs = [
        "src/android/net/eap/cts/EapSessionConfigTest.java"
        "src/android/net/ipsec/ike/cts/ChildSessionParamsTest.java"
        "src/android/net/ipsec/ike/cts/IkeIdentificationTest.java"
        "src/android/net/ipsec/ike/cts/IkeSessionDigitalSignatureTest.java"
        "src/android/net/ipsec/ike/cts/IkeSessionMschapV2Test.java"
        "src/android/net/ipsec/ike/cts/IkeSessionParamsTest.java"
        "src/android/net/ipsec/ike/cts/IkeSessionPskTest.java"
        "src/android/net/ipsec/ike/cts/IkeSessionRekeyTest.java"
        "src/android/net/ipsec/ike/cts/IkeSessionTestBase.java"
        "src/android/net/ipsec/ike/cts/IkeTestBase.java"
        "src/android/net/ipsec/ike/cts/IkeTunUtils.java"
        "src/android/net/ipsec/ike/cts/PacketUtils.java"
        "src/android/net/ipsec/ike/cts/SaProposalTest.java"
        "src/android/net/ipsec/ike/cts/TestNetworkUtils.java"
        "src/android/net/ipsec/ike/cts/TunUtils.java"
        ":ike-test-utils"
    ];

    static_libs = [
        "androidx.test.ext.junit"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "net-tests-utils"
    ];

    platform_apis = true;

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "mts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsIkeTestCases; }
