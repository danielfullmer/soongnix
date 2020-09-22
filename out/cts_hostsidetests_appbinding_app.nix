{ android_test_helper_app, java_defaults }:
let

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

cts_hostside_appbinding_defaults = java_defaults {
    name = "cts_hostside_appbinding_defaults";
    libs = ["android.test.base.stubs"];
    sdk_version = "test_current";
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "androidx.legacy_legacy-support-v4"
        "androidx.test.rules"
    ];
};

CtsAppBindingService1 = android_test_helper_app {
    name = "CtsAppBindingService1";
    defaults = [
        "cts_hostside_appbinding_defaults"
        "cts_defaults"
    ];
    srcs = [
        "src/com/android/cts/appbinding/app/MyEnabler.java"
        "src/com/android/cts/appbinding/app/MyService.java"
        "src/com/android/cts/appbinding/app/MyService2.java"
        "src/com/android/cts/appbinding/app/sms/MyMmsReceiver.java"
        "src/com/android/cts/appbinding/app/sms/MyRespondService.java"
        "src/com/android/cts/appbinding/app/sms/MySendToActivity.java"
        "src/com/android/cts/appbinding/app/sms/MySmsReceiver.java"
    ];
    manifest = "app1/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppBindingService2 = android_test_helper_app {
    name = "CtsAppBindingService2";
    defaults = [
        "cts_hostside_appbinding_defaults"
        "cts_defaults"
    ];
    srcs = [
        "src/com/android/cts/appbinding/app/MyEnabler.java"
        "src/com/android/cts/appbinding/app/MyService.java"
        "src/com/android/cts/appbinding/app/MyService2.java"
        "src/com/android/cts/appbinding/app/sms/MyMmsReceiver.java"
        "src/com/android/cts/appbinding/app/sms/MyRespondService.java"
        "src/com/android/cts/appbinding/app/sms/MySendToActivity.java"
        "src/com/android/cts/appbinding/app/sms/MySmsReceiver.java"
    ];
    manifest = "app2/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppBindingService3 = android_test_helper_app {
    name = "CtsAppBindingService3";
    defaults = [
        "cts_hostside_appbinding_defaults"
        "cts_defaults"
    ];
    srcs = [
        "src/com/android/cts/appbinding/app/MyEnabler.java"
        "src/com/android/cts/appbinding/app/MyService.java"
        "src/com/android/cts/appbinding/app/MyService2.java"
        "src/com/android/cts/appbinding/app/sms/MyMmsReceiver.java"
        "src/com/android/cts/appbinding/app/sms/MyRespondService.java"
        "src/com/android/cts/appbinding/app/sms/MySendToActivity.java"
        "src/com/android/cts/appbinding/app/sms/MySmsReceiver.java"
    ];
    manifest = "app3/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppBindingService4 = android_test_helper_app {
    name = "CtsAppBindingService4";
    defaults = [
        "cts_hostside_appbinding_defaults"
        "cts_defaults"
    ];
    srcs = [
        "src/com/android/cts/appbinding/app/MyEnabler.java"
        "src/com/android/cts/appbinding/app/MyService.java"
        "src/com/android/cts/appbinding/app/MyService2.java"
        "src/com/android/cts/appbinding/app/sms/MyMmsReceiver.java"
        "src/com/android/cts/appbinding/app/sms/MyRespondService.java"
        "src/com/android/cts/appbinding/app/sms/MySendToActivity.java"
        "src/com/android/cts/appbinding/app/sms/MySmsReceiver.java"
    ];
    manifest = "app4/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppBindingService5 = android_test_helper_app {
    name = "CtsAppBindingService5";
    defaults = [
        "cts_hostside_appbinding_defaults"
        "cts_defaults"
    ];
    srcs = [
        "src/com/android/cts/appbinding/app/MyEnabler.java"
        "src/com/android/cts/appbinding/app/MyService.java"
        "src/com/android/cts/appbinding/app/MyService2.java"
        "src/com/android/cts/appbinding/app/sms/MyMmsReceiver.java"
        "src/com/android/cts/appbinding/app/sms/MyRespondService.java"
        "src/com/android/cts/appbinding/app/sms/MySendToActivity.java"
        "src/com/android/cts/appbinding/app/sms/MySmsReceiver.java"
    ];
    manifest = "app5/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppBindingService6 = android_test_helper_app {
    name = "CtsAppBindingService6";
    defaults = [
        "cts_hostside_appbinding_defaults"
        "cts_defaults"
    ];
    srcs = [
        "src/com/android/cts/appbinding/app/MyEnabler.java"
        "src/com/android/cts/appbinding/app/MyService.java"
        "src/com/android/cts/appbinding/app/MyService2.java"
        "src/com/android/cts/appbinding/app/sms/MyMmsReceiver.java"
        "src/com/android/cts/appbinding/app/sms/MyRespondService.java"
        "src/com/android/cts/appbinding/app/sms/MySendToActivity.java"
        "src/com/android/cts/appbinding/app/sms/MySmsReceiver.java"
    ];
    manifest = "app6/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppBindingService7 = android_test_helper_app {
    name = "CtsAppBindingService7";
    defaults = [
        "cts_hostside_appbinding_defaults"
        "cts_defaults"
    ];
    srcs = [
        "src/com/android/cts/appbinding/app/MyEnabler.java"
        "src/com/android/cts/appbinding/app/MyService.java"
        "src/com/android/cts/appbinding/app/MyService2.java"
        "src/com/android/cts/appbinding/app/sms/MyMmsReceiver.java"
        "src/com/android/cts/appbinding/app/sms/MyRespondService.java"
        "src/com/android/cts/appbinding/app/sms/MySendToActivity.java"
        "src/com/android/cts/appbinding/app/sms/MySmsReceiver.java"
    ];
    manifest = "app7/AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts"
        "vts10"
        "general-tests"
    ];
};

CtsAppBindingServiceB = android_test_helper_app {
    name = "CtsAppBindingServiceB";
    defaults = [
        "cts_hostside_appbinding_defaults"
        "cts_defaults"
    ];
    srcs = [
        "src/com/android/cts/appbinding/app/MyEnabler.java"
        "src/com/android/cts/appbinding/app/MyService.java"
        "src/com/android/cts/appbinding/app/MyService2.java"
        "src/com/android/cts/appbinding/app/sms/MyMmsReceiver.java"
        "src/com/android/cts/appbinding/app/sms/MyRespondService.java"
        "src/com/android/cts/appbinding/app/sms/MySendToActivity.java"
        "src/com/android/cts/appbinding/app/sms/MySmsReceiver.java"
    ];
    manifest = "appb/AndroidManifest.xml";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsAppBindingService1 CtsAppBindingService2 CtsAppBindingService3 CtsAppBindingService4 CtsAppBindingService5 CtsAppBindingService6 CtsAppBindingService7 CtsAppBindingServiceB cts_hostside_appbinding_defaults; }
