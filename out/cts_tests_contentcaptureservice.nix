{ android_test }:
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

CtsContentCaptureServiceTestCases = android_test {
    name = "CtsContentCaptureServiceTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.test.ext.junit"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "truth-prebuilt"
        #  TODO: remove once Android migrates to JUnit 4.12,
        #  which provides assertThrows
        "testng"
    ];
    srcs = [
        "src/android/contentcaptureservice/cts/AbstractContentCaptureActivity.java"
        "src/android/contentcaptureservice/cts/AbstractContentCaptureIntegrationActivityLessTest.java"
        "src/android/contentcaptureservice/cts/AbstractContentCaptureIntegrationAutoActivityLaunchTest.java"
        "src/android/contentcaptureservice/cts/AbstractContentCaptureIntegrationTest.java"
        "src/android/contentcaptureservice/cts/AbstractRootViewActivity.java"
        "src/android/contentcaptureservice/cts/AppKilledTest.java"
        "src/android/contentcaptureservice/cts/Assertions.java"
        "src/android/contentcaptureservice/cts/BlankActivity.java"
        "src/android/contentcaptureservice/cts/BlankActivityTest.java"
        "src/android/contentcaptureservice/cts/BlankWithTitleActivity.java"
        "src/android/contentcaptureservice/cts/BlankWithTitleActivityTest.java"
        "src/android/contentcaptureservice/cts/CanaryTest.java"
        "src/android/contentcaptureservice/cts/ChildlessActivity.java"
        "src/android/contentcaptureservice/cts/ChildlessActivityTest.java"
        "src/android/contentcaptureservice/cts/ClipboardAccessTest.java"
        "src/android/contentcaptureservice/cts/ContentCaptureLoggingTestRule.java"
        "src/android/contentcaptureservice/cts/CtsContentCaptureService.java"
        "src/android/contentcaptureservice/cts/CustomView.java"
        "src/android/contentcaptureservice/cts/CustomViewActivity.java"
        "src/android/contentcaptureservice/cts/CustomViewActivityTest.java"
        "src/android/contentcaptureservice/cts/DataSharingActivity.java"
        "src/android/contentcaptureservice/cts/DataSharingActivityTest.java"
        "src/android/contentcaptureservice/cts/DataSharingService.java"
        "src/android/contentcaptureservice/cts/DataSharingServiceTest.java"
        "src/android/contentcaptureservice/cts/Helper.java"
        "src/android/contentcaptureservice/cts/LoginActivity.java"
        "src/android/contentcaptureservice/cts/LoginActivityTest.java"
        "src/android/contentcaptureservice/cts/OutOfProcessActivity.java"
        "src/android/contentcaptureservice/cts/OutOfProcessDataSharingService.java"
        "src/android/contentcaptureservice/cts/ResizingEditActivity.java"
        "src/android/contentcaptureservice/cts/ResizingEditActivityTest.java"
        "src/android/contentcaptureservice/cts/SelfDestructReceiver.java"
        "src/android/contentcaptureservice/cts/WhitelistTest.java"
        "src/android/contentcaptureservice/cts/unit/ContentCaptureConditionTest.java"
        "src/android/contentcaptureservice/cts/unit/ContentCaptureContextTest.java"
        "src/android/contentcaptureservice/cts/unit/DataRemovalRequestTest.java"
        "src/android/contentcaptureservice/cts/unit/ViewNodeTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsContentCaptureServiceTestCases; }
