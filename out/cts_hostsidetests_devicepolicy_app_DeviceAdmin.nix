{ android_test_helper_app }:
let

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

CtsDeviceAdminApp23 = android_test_helper_app {
    name = "CtsDeviceAdminApp23";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com.android.cts.deviceadmin/BaseDeviceAdminTest.java"
        "src/com.android.cts.deviceadmin/ClearDeviceAdminTest.java"
        "src/com.android.cts.deviceadmin/ClearDeviceAdminWithNoProtectionTest.java"
        "src/com.android.cts.deviceadmin/ClearPasswordTest.java"
        "src/com.android.cts.deviceadmin/DeviceAdminPasswordTest.java"
        "src/com.android.cts.deviceadmin/DeviceAdminReceiverWithNoProtection.java"
        "src/com.android.cts.deviceadmin/DeviceAdminTest.java"
        "src/com.android.cts.deviceadmin/DeviceAdminWithEnterprisePoliciesBlockedTest.java"
        "src/com.android.cts.deviceadmin/DeviceOwnerPasswordTest.java"
        "src/com.android.cts.deviceadmin/WipeDataTest.java"
    ];
    resource_dirs = ["res"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    sdk_version = "test_current";
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "api23/AndroidManifest.xml";
};

CtsDeviceAdminApp24 = android_test_helper_app {
    name = "CtsDeviceAdminApp24";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com.android.cts.deviceadmin/BaseDeviceAdminTest.java"
        "src/com.android.cts.deviceadmin/ClearDeviceAdminTest.java"
        "src/com.android.cts.deviceadmin/ClearDeviceAdminWithNoProtectionTest.java"
        "src/com.android.cts.deviceadmin/ClearPasswordTest.java"
        "src/com.android.cts.deviceadmin/DeviceAdminPasswordTest.java"
        "src/com.android.cts.deviceadmin/DeviceAdminReceiverWithNoProtection.java"
        "src/com.android.cts.deviceadmin/DeviceAdminTest.java"
        "src/com.android.cts.deviceadmin/DeviceAdminWithEnterprisePoliciesBlockedTest.java"
        "src/com.android.cts.deviceadmin/DeviceOwnerPasswordTest.java"
        "src/com.android.cts.deviceadmin/WipeDataTest.java"
    ];
    resource_dirs = ["res"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    sdk_version = "test_current";
    #  TODO: should it be "24":
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "api24/AndroidManifest.xml";
};

CtsDeviceAdminApp29 = android_test_helper_app {
    name = "CtsDeviceAdminApp29";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com.android.cts.deviceadmin/BaseDeviceAdminTest.java"
        "src/com.android.cts.deviceadmin/ClearDeviceAdminTest.java"
        "src/com.android.cts.deviceadmin/ClearDeviceAdminWithNoProtectionTest.java"
        "src/com.android.cts.deviceadmin/ClearPasswordTest.java"
        "src/com.android.cts.deviceadmin/DeviceAdminPasswordTest.java"
        "src/com.android.cts.deviceadmin/DeviceAdminReceiverWithNoProtection.java"
        "src/com.android.cts.deviceadmin/DeviceAdminTest.java"
        "src/com.android.cts.deviceadmin/DeviceAdminWithEnterprisePoliciesBlockedTest.java"
        "src/com.android.cts.deviceadmin/DeviceOwnerPasswordTest.java"
        "src/com.android.cts.deviceadmin/WipeDataTest.java"
    ];
    resource_dirs = ["res"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "api29/AndroidManifest.xml";
};

in { inherit CtsDeviceAdminApp23 CtsDeviceAdminApp24 CtsDeviceAdminApp29; }
