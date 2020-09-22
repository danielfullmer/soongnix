{ droiddoc, java_library_static }:
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

uiautomator-stubs-docs = droiddoc {
    name = "uiautomator-stubs-docs";
    srcs = [
        "core-src/com/android/uiautomator/core/AccessibilityNodeInfoDumper.java"
        "core-src/com/android/uiautomator/core/AccessibilityNodeInfoHelper.java"
        "core-src/com/android/uiautomator/core/Configurator.java"
        "core-src/com/android/uiautomator/core/InteractionController.java"
        "core-src/com/android/uiautomator/core/QueryController.java"
        "core-src/com/android/uiautomator/core/Tracer.java"
        "core-src/com/android/uiautomator/core/UiAutomatorBridge.java"
        "core-src/com/android/uiautomator/core/UiCollection.java"
        "core-src/com/android/uiautomator/core/UiDevice.java"
        "core-src/com/android/uiautomator/core/UiObject.java"
        "core-src/com/android/uiautomator/core/UiObjectNotFoundException.java"
        "core-src/com/android/uiautomator/core/UiScrollable.java"
        "core-src/com/android/uiautomator/core/UiSelector.java"
        "core-src/com/android/uiautomator/core/UiWatcher.java"
        "testrunner-src/com/android/uiautomator/core/ShellUiAutomatorBridge.java"
        "testrunner-src/com/android/uiautomator/core/UiAutomationShellWrapper.java"
        "testrunner-src/com/android/uiautomator/testrunner/IAutomationSupport.java"
        "testrunner-src/com/android/uiautomator/testrunner/TestCaseCollector.java"
        "testrunner-src/com/android/uiautomator/testrunner/UiAutomatorTestCase.java"
        "testrunner-src/com/android/uiautomator/testrunner/UiAutomatorTestCaseFilter.java"
        "testrunner-src/com/android/uiautomator/testrunner/UiAutomatorTestRunner.java"
    ];
    libs = [
        "android.test.runner"
        "junit"
        "android.test.base"
        "unsupportedappusage"
    ];
    custom_template = "droiddoc-templates-sdk";
    installable = false;
    args = "-stubpackages com.android.uiautomator.core:" +
        "com.android.uiautomator.testrunner";

    check_api = {
        current = {
            api_file = ":uiautomator-current-api";
            removed_api_file = ":uiautomator-removed-api";
        };
        last_released = {
            api_file = ":uiautomator-last-released-api";
            removed_api_file = ":uiautomator-removed-api";
        };
    };
};

android_uiautomator = java_library_static {
    name = "android_uiautomator";
    srcs = [
        ":uiautomator-stubs-docs"
    ];
    libs = [
        "android.test.runner"
        "junit"
    ];
};

"uiautomator.core" = java_library_static {
    name = "uiautomator.core";
    srcs = [
        "core-src/com/android/uiautomator/core/AccessibilityNodeInfoDumper.java"
        "core-src/com/android/uiautomator/core/AccessibilityNodeInfoHelper.java"
        "core-src/com/android/uiautomator/core/Configurator.java"
        "core-src/com/android/uiautomator/core/InteractionController.java"
        "core-src/com/android/uiautomator/core/QueryController.java"
        "core-src/com/android/uiautomator/core/Tracer.java"
        "core-src/com/android/uiautomator/core/UiAutomatorBridge.java"
        "core-src/com/android/uiautomator/core/UiCollection.java"
        "core-src/com/android/uiautomator/core/UiDevice.java"
        "core-src/com/android/uiautomator/core/UiObject.java"
        "core-src/com/android/uiautomator/core/UiObjectNotFoundException.java"
        "core-src/com/android/uiautomator/core/UiScrollable.java"
        "core-src/com/android/uiautomator/core/UiSelector.java"
        "core-src/com/android/uiautomator/core/UiWatcher.java"
        "testrunner-src/com/android/uiautomator/core/ShellUiAutomatorBridge.java"
        "testrunner-src/com/android/uiautomator/core/UiAutomationShellWrapper.java"
        "testrunner-src/com/android/uiautomator/testrunner/IAutomationSupport.java"
        "testrunner-src/com/android/uiautomator/testrunner/TestCaseCollector.java"
        "testrunner-src/com/android/uiautomator/testrunner/UiAutomatorTestCase.java"
        "testrunner-src/com/android/uiautomator/testrunner/UiAutomatorTestCaseFilter.java"
        "testrunner-src/com/android/uiautomator/testrunner/UiAutomatorTestRunner.java"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = [
        "junit"
    ];
};

"uiautomator.library" = java_library_static {
    name = "uiautomator.library";
    srcs = [
        "core-src/com/android/uiautomator/core/AccessibilityNodeInfoDumper.java"
        "core-src/com/android/uiautomator/core/AccessibilityNodeInfoHelper.java"
        "core-src/com/android/uiautomator/core/Configurator.java"
        "core-src/com/android/uiautomator/core/InteractionController.java"
        "core-src/com/android/uiautomator/core/QueryController.java"
        "core-src/com/android/uiautomator/core/Tracer.java"
        "core-src/com/android/uiautomator/core/UiAutomatorBridge.java"
        "core-src/com/android/uiautomator/core/UiCollection.java"
        "core-src/com/android/uiautomator/core/UiDevice.java"
        "core-src/com/android/uiautomator/core/UiObject.java"
        "core-src/com/android/uiautomator/core/UiObjectNotFoundException.java"
        "core-src/com/android/uiautomator/core/UiScrollable.java"
        "core-src/com/android/uiautomator/core/UiSelector.java"
        "core-src/com/android/uiautomator/core/UiWatcher.java"
    ];
};

in { inherit "uiautomator.core" "uiautomator.library" android_uiautomator uiautomator-stubs-docs; }
