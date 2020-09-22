{ android_test, cc_defaults, cc_test, java_test_host }:
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

gsi_boot_defaults = cc_defaults {
    name = "gsi_boot_defaults";
    shared_libs = [
        "libbase"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "libext4_utils"
        "libfstab"
        "android.hardware.weaver@1.0"
    ];
    srcs = [
        "boot_tests.cpp"
    ];
};

gsi_boot_test = cc_test {
    name = "gsi_boot_test";
    defaults = ["gsi_boot_defaults"];
};

vts_gsi_boot_test = cc_test {
    name = "vts_gsi_boot_test";
    defaults = ["gsi_boot_defaults"];
    test_suites = [
        "general-tests"
        "vts"
    ];
    auto_gen_config = true;
    test_min_api_level = 29;
    require_root = true;
};

DSUEndtoEndTest = java_test_host {
    name = "DSUEndtoEndTest";
    srcs = ["DSUEndtoEndTest.java"];
    libs = ["tradefed"];
    test_config = "dsu-test.xml";
    test_suites = ["general-tests"];
};

LockScreenAutomation = android_test {
    name = "LockScreenAutomation";
    srcs = ["LockScreenAutomation.java"];
    libs = [
        "junit"
        "android.test.base.stubs"
    ];
    static_libs = ["androidx.test.uiautomator"];
    certificate = "platform";
    manifest = "AndroidManifest.xml";
    test_suites = ["general-tests"];
};

in { inherit DSUEndtoEndTest LockScreenAutomation gsi_boot_defaults gsi_boot_test vts_gsi_boot_test; }
