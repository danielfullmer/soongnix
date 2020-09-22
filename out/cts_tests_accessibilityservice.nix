{ android_test }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

CtsAccessibilityServiceTestCases = android_test {
    name = "CtsAccessibilityServiceTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "ctstestrunner-axt"
        "hamcrest-library"
        "mockito-target-minus-junit4"
        "compatibility-device-util-axt"
        "platform-test-annotations"
        "CtsAccessibilityCommon"
        "CtsInputMethodServiceCommon"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/accessibilityservice/cts/AccessibilityButtonTest.java"
        "src/android/accessibilityservice/cts/AccessibilityEmbeddedDisplayTest.java"
        "src/android/accessibilityservice/cts/AccessibilityEmbeddedHierarchyTest.java"
        "src/android/accessibilityservice/cts/AccessibilityEndToEndTest.java"
        "src/android/accessibilityservice/cts/AccessibilityFingerprintGestureTest.java"
        "src/android/accessibilityservice/cts/AccessibilityFocusAndInputFocusSyncTest.java"
        "src/android/accessibilityservice/cts/AccessibilityGestureDetectorTest.java"
        "src/android/accessibilityservice/cts/AccessibilityGestureDispatchTest.java"
        "src/android/accessibilityservice/cts/AccessibilityGlobalActionsTest.java"
        "src/android/accessibilityservice/cts/AccessibilityLoggingTest.java"
        "src/android/accessibilityservice/cts/AccessibilityMagnificationTest.java"
        "src/android/accessibilityservice/cts/AccessibilityOverlayTest.java"
        "src/android/accessibilityservice/cts/AccessibilityPaneTest.java"
        "src/android/accessibilityservice/cts/AccessibilityServiceInfoTest.java"
        "src/android/accessibilityservice/cts/AccessibilitySettingsTest.java"
        "src/android/accessibilityservice/cts/AccessibilitySoftKeyboardTest.java"
        "src/android/accessibilityservice/cts/AccessibilitySystemActionTest.java"
        "src/android/accessibilityservice/cts/AccessibilityTakeScreenshotTest.java"
        "src/android/accessibilityservice/cts/AccessibilityTextActionTest.java"
        "src/android/accessibilityservice/cts/AccessibilityTextTraversalTest.java"
        "src/android/accessibilityservice/cts/AccessibilityViewTreeReportingTest.java"
        "src/android/accessibilityservice/cts/AccessibilityVolumeTest.java"
        "src/android/accessibilityservice/cts/AccessibilityWindowQueryTest.java"
        "src/android/accessibilityservice/cts/AccessibilityWindowReportingTest.java"
        "src/android/accessibilityservice/cts/GestureDescriptionTest.java"
        "src/android/accessibilityservice/cts/GestureDetectionStubAccessibilityService.java"
        "src/android/accessibilityservice/cts/MagnificationGestureHandlerTest.java"
        "src/android/accessibilityservice/cts/StubAccessibilityButtonService.java"
        "src/android/accessibilityservice/cts/StubFingerprintGestureService.java"
        "src/android/accessibilityservice/cts/StubGestureAccessibilityService.java"
        "src/android/accessibilityservice/cts/StubMagnificationAccessibilityService.java"
        "src/android/accessibilityservice/cts/StubSystemActionsAccessibilityService.java"
        "src/android/accessibilityservice/cts/StubTakeScreenshotService.java"
        "src/android/accessibilityservice/cts/TouchExplorationStubAccessibilityService.java"
        "src/android/accessibilityservice/cts/TouchExplorerTest.java"
        "src/android/accessibilityservice/cts/activities/AccessibilityEndToEndActivity.java"
        "src/android/accessibilityservice/cts/activities/AccessibilityFocusAndInputFocusSyncActivity.java"
        "src/android/accessibilityservice/cts/activities/AccessibilityTestActivity.java"
        "src/android/accessibilityservice/cts/activities/AccessibilityTextTraversalActivity.java"
        "src/android/accessibilityservice/cts/activities/AccessibilityViewTreeReportingActivity.java"
        "src/android/accessibilityservice/cts/activities/AccessibilityWindowQueryActivity.java"
        "src/android/accessibilityservice/cts/activities/AccessibilityWindowReportingActivity.java"
        "src/android/accessibilityservice/cts/utils/AccessibilityEventFilterUtils.java"
        "src/android/accessibilityservice/cts/utils/ActivityLaunchUtils.java"
        "src/android/accessibilityservice/cts/utils/AsyncUtils.java"
        "src/android/accessibilityservice/cts/utils/CtsTestUtils.java"
        "src/android/accessibilityservice/cts/utils/DisplayUtils.java"
        "src/android/accessibilityservice/cts/utils/EventCapturingClickListener.java"
        "src/android/accessibilityservice/cts/utils/EventCapturingHoverListener.java"
        "src/android/accessibilityservice/cts/utils/EventCapturingLongClickListener.java"
        "src/android/accessibilityservice/cts/utils/EventCapturingTouchListener.java"
        "src/android/accessibilityservice/cts/utils/GestureUtils.java"
        "src/android/accessibilityservice/cts/utils/RunOnMainUtils.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
    data = [":CtsAccessibilityWidgetProvider"];
};

in { inherit CtsAccessibilityServiceTestCases; }
