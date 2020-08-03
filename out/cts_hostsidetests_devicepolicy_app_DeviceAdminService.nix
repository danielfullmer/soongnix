{ android_test_helper_app }:
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

CtsDeviceAdminService1 = android_test_helper_app {
    name = "CtsDeviceAdminService1";
    defaults = ["cts_defaults"];
    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = ["android.test.base.stubs"];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "package1/AndroidManifest.xml";
};

CtsDeviceAdminService2 = android_test_helper_app {
    name = "CtsDeviceAdminService2";
    defaults = ["cts_defaults"];
    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = ["android.test.base.stubs"];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "package2/AndroidManifest.xml";
};

CtsDeviceAdminService3 = android_test_helper_app {
    name = "CtsDeviceAdminService3";
    defaults = ["cts_defaults"];
    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = ["android.test.base.stubs"];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "package3/AndroidManifest.xml";
};

CtsDeviceAdminService4 = android_test_helper_app {
    name = "CtsDeviceAdminService4";
    defaults = ["cts_defaults"];
    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = ["android.test.base.stubs"];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "package4/AndroidManifest.xml";
};

CtsDeviceAdminServiceB = android_test_helper_app {
    name = "CtsDeviceAdminServiceB";
    defaults = ["cts_defaults"];
    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = ["android.test.base.stubs"];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "packageb/AndroidManifest.xml";
};

in { inherit CtsDeviceAdminService1 CtsDeviceAdminService2 CtsDeviceAdminService3 CtsDeviceAdminService4 CtsDeviceAdminServiceB; }
