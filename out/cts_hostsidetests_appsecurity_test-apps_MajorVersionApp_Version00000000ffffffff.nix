{ android_test }:
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

CtsMajorVersion00000000ffffffff = android_test {
    name = "CtsMajorVersion00000000ffffffff";
    defaults = ["cts_support_defaults"];
    srcs = [
        "src/**/*.java"
        ":CtsMajorVersionCommon"
    ];
    static_libs = ["androidx.test.rules"];
    sdk_version = "current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    #  sign this app with a different cert than CtsSimpleAppInstallDiffCert
    certificate = ":cts-testkey1";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsMajorVersion00000000ffffffff; }
