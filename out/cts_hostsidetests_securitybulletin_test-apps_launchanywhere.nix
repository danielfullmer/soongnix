{ android_test_helper_app }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

CtsHostLaunchAnyWhereApp = android_test_helper_app {
    name = "CtsHostLaunchAnyWhereApp";
    defaults = ["cts_support_defaults"];
    sdk_version = "current";
    srcs = [
        "src/com/android/security/cts/launchanywhere/Authenticator.java"
        "src/com/android/security/cts/launchanywhere/AuthenticatorService.java"
        "src/com/android/security/cts/launchanywhere/CVE_2017_13286.java"
        "src/com/android/security/cts/launchanywhere/CVE_2017_13288.java"
        "src/com/android/security/cts/launchanywhere/CVE_2017_13289.java"
        "src/com/android/security/cts/launchanywhere/CVE_2017_13312.java"
        "src/com/android/security/cts/launchanywhere/CVE_2017_13315.java"
        "src/com/android/security/cts/launchanywhere/IGenerateMalformedParcel.java"
        "src/com/android/security/cts/launchanywhere/StartExploit.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "sts"
    ];
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsHostLaunchAnyWhereApp; }
