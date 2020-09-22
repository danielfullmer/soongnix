{ android_test_helper_app }:
let

#
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
#

CtsHostsideNetworkTestsApp2 = android_test_helper_app {
    name = "CtsHostsideNetworkTestsApp2";
    defaults = ["cts_support_defaults"];
    sdk_version = "current";
    static_libs = ["CtsHostsideNetworkTestsAidl"];
    srcs = [
        "src/com/android/cts/net/hostside/app2/Common.java"
        "src/com/android/cts/net/hostside/app2/MyActivity.java"
        "src/com/android/cts/net/hostside/app2/MyBroadcastReceiver.java"
        "src/com/android/cts/net/hostside/app2/MyForegroundService.java"
        "src/com/android/cts/net/hostside/app2/MyService.java"
        "src/com/android/cts/net/hostside/app2/RemoteSocketFactoryService.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    certificate = ":cts-net-app";
};

in { inherit CtsHostsideNetworkTestsApp2; }
