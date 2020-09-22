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
CtsDynamicMimeTestApp = android_test_helper_app {
    name = "CtsDynamicMimeTestApp";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "CtsDynamicMimeCommon"
        "hamcrest-library"
        "android-support-test"
        "androidx.test.uiautomator_uiautomator"
    ];
    srcs = [
        "src/android/dynamicmime/testapp/BaseDynamicMimeTest.java"
        "src/android/dynamicmime/testapp/ComplexFilterTest.java"
        "src/android/dynamicmime/testapp/MultipleAppsTest.java"
        "src/android/dynamicmime/testapp/SingleAppTest.java"
        "src/android/dynamicmime/testapp/assertions/AppAssertionsByGroupData.java"
        "src/android/dynamicmime/testapp/assertions/AssertionsByGroupData.java"
        "src/android/dynamicmime/testapp/assertions/AssertionsByIntentResolution.java"
        "src/android/dynamicmime/testapp/assertions/MimeGroupAssertions.java"
        "src/android/dynamicmime/testapp/assertions/TestAppAssertionsByGroupData.java"
        "src/android/dynamicmime/testapp/commands/AppCommands.java"
        "src/android/dynamicmime/testapp/commands/MimeGroupCommands.java"
        "src/android/dynamicmime/testapp/commands/TestAppCommands.java"
        "src/android/dynamicmime/testapp/preferred/PreferredActivitiesTest.java"
        "src/android/dynamicmime/testapp/reboot/PostRebootComplexFilterTest.java"
        "src/android/dynamicmime/testapp/reboot/PostRebootSingleAppTest.java"
        "src/android/dynamicmime/testapp/reboot/PreRebootComplexFilterTest.java"
        "src/android/dynamicmime/testapp/reboot/PreRebootSingleAppTest.java"
        "src/android/dynamicmime/testapp/update/BaseUpdateTest.java"
        "src/android/dynamicmime/testapp/update/ChangedGroupsTest.java"
        "src/android/dynamicmime/testapp/update/SameGroupsTest.java"
        "src/android/dynamicmime/testapp/util/AppMimeGroups.java"
        "src/android/dynamicmime/testapp/util/IntentsResolutionHelper.java"
        "src/android/dynamicmime/testapp/util/MimeGroupOperations.java"
        "src/android/dynamicmime/testapp/util/Utils.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
    platform_apis = true;
};

in { inherit CtsDynamicMimeTestApp; }
