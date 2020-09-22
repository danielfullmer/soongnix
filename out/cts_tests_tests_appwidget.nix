{ android_test, filegroup }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

CtsAppWidgetSources = filegroup {
    name = "CtsAppWidgetSources";
    srcs = [
        "packages/src/android/appwidget/cts/packages/AppWidgetConfirmPin.java"
        "packages/src/android/appwidget/cts/packages/Launcher.java"
        "packages/src/android/appwidget/cts/packages/SimpleProvider.java"
        "common/src/android/appwidget/cts/common/Constants.java"
    ];
};

CtsAppWidgetTestCases = android_test {
    name = "CtsAppWidgetTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/appwidget/cts/AppWidgetTest.java"
        "src/android/appwidget/cts/AppWidgetTestCase.java"
        "src/android/appwidget/cts/BlockingBroadcastReceiver.java"
        "src/android/appwidget/cts/CollectionAppWidgetTest.java"
        "src/android/appwidget/cts/DarkTextThemeTest.java"
        "src/android/appwidget/cts/RequestPinAppWidgetTest.java"
        "src/android/appwidget/cts/UpdateProviderInfoTest.java"
        "src/android/appwidget/cts/WidgetTransitionTest.java"
        "src/android/appwidget/cts/activity/EmptyActivity.java"
        "src/android/appwidget/cts/activity/TransitionActivity.java"
        "src/android/appwidget/cts/provider/AppWidgetProviderCallbacks.java"
        "src/android/appwidget/cts/provider/AppWidgetProviderWithFeatures.java"
        "src/android/appwidget/cts/provider/CollectionAppWidgetProvider.java"
        "src/android/appwidget/cts/provider/FirstAppWidgetProvider.java"
        "src/android/appwidget/cts/provider/SecondAppWidgetProvider.java"
        "src/android/appwidget/cts/provider/StubbableAppWidgetProvider.java"
        "src/android/appwidget/cts/service/MyAppWidgetService.java"
        "common/src/android/appwidget/cts/common/Constants.java"
    ];
    sdk_version = "test_current";
    static_libs = [
        "mockito-target-minus-junit4"
        "ctstestrunner-axt"
        "junit"
        "compatibility-device-util-axt"
    ];
    libs = ["android.test.base.stubs"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsAppWidgetSources CtsAppWidgetTestCases; }
