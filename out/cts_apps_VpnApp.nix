{ android_test_helper_app, java_defaults }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

CtsVpnAppDefaults = java_defaults {
    name = "CtsVpnAppDefaults";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/vpnfirewall/IcmpMessage.java"
        "src/com/android/cts/vpnfirewall/Ipv4Packet.java"
        "src/com/android/cts/vpnfirewall/PingReflector.java"
        "src/com/android/cts/vpnfirewall/ReflectorVpnService.java"
        "src/com/android/cts/vpnfirewall/Rfc1071.java"
        "src/com/android/cts/vpnfirewall/VpnClient.java"
    ];
    platform_apis = true;
};

CtsVpnFirewallAppApi23 = android_test_helper_app {
    name = "CtsVpnFirewallAppApi23";
    defaults = ["CtsVpnAppDefaults"];
    manifest = "api23/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsVpnFirewallAppApi24 = android_test_helper_app {
    name = "CtsVpnFirewallAppApi24";
    defaults = ["CtsVpnAppDefaults"];
    manifest = "api24/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsVpnFirewallApp = android_test_helper_app {
    name = "CtsVpnFirewallApp";
    defaults = ["CtsVpnAppDefaults"];
    manifest = "latest/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsVpnFirewallAppNotAlwaysOn = android_test_helper_app {
    name = "CtsVpnFirewallAppNotAlwaysOn";
    defaults = ["CtsVpnAppDefaults"];
    manifest = "notalwayson/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsVpnAppDefaults CtsVpnFirewallApp CtsVpnFirewallAppApi23 CtsVpnFirewallAppApi24 CtsVpnFirewallAppNotAlwaysOn; }