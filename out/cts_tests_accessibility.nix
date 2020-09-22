{ android_test, java_library_static }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

CtsAccessibilityCommon = java_library_static {
    name = "CtsAccessibilityCommon";
    sdk_version = "test_current";
    static_libs = [
        "compatibility-device-util-axt"
    ];
    srcs = [
        "common/src/android/accessibility/cts/common/AccessibilityDumpOnFailureRule.java"
        "common/src/android/accessibility/cts/common/AccessibilityDumper.java"
        "common/src/android/accessibility/cts/common/AccessibilityShortcutSettingsRule.java"
        "common/src/android/accessibility/cts/common/InstrumentedAccessibilityService.java"
        "common/src/android/accessibility/cts/common/InstrumentedAccessibilityServiceTestRule.java"
        "common/src/android/accessibility/cts/common/ServiceControlUtils.java"
        "common/src/android/accessibility/cts/common/ShellCommandBuilder.java"
    ];
};

CtsAccessibilityTestCases = android_test {
    name = "CtsAccessibilityTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/view/accessibility/cts/AccessibilityActionTest.java"
        "src/android/view/accessibility/cts/AccessibilityButtonService.java"
        "src/android/view/accessibility/cts/AccessibilityDelegateTest.java"
        "src/android/view/accessibility/cts/AccessibilityEventTest.java"
        "src/android/view/accessibility/cts/AccessibilityGestureEventTest.java"
        "src/android/view/accessibility/cts/AccessibilityManagerTest.java"
        "src/android/view/accessibility/cts/AccessibilityNodeInfoTest.java"
        "src/android/view/accessibility/cts/AccessibilityNodeInfo_CollectionInfoTest.java"
        "src/android/view/accessibility/cts/AccessibilityNodeInfo_CollectionItemInfoTest.java"
        "src/android/view/accessibility/cts/AccessibilityNodeInfo_RangeInfoTest.java"
        "src/android/view/accessibility/cts/AccessibilityNodeProviderTest.java"
        "src/android/view/accessibility/cts/AccessibilityRecordTest.java"
        "src/android/view/accessibility/cts/AccessibilityServiceInfoTest.java"
        "src/android/view/accessibility/cts/AccessibilityShortcutTargetActivity.java"
        "src/android/view/accessibility/cts/AccessibilityShortcutTest.java"
        "src/android/view/accessibility/cts/AccessibilityWindowInfoTest.java"
        "src/android/view/accessibility/cts/CaptioningManagerTest.java"
        "src/android/view/accessibility/cts/DummyActivity.java"
        "src/android/view/accessibility/cts/SpeakingAccessibilityService.java"
        "src/android/view/accessibility/cts/SpeakingAndVibratingAccessibilityService.java"
        "src/android/view/accessibility/cts/VibratingAccessibilityService.java"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "hamcrest-library"
        "CtsAccessibilityCommon"
    ];
    libs = ["android.test.base.stubs"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsAccessibilityCommon CtsAccessibilityTestCases; }
