{ android_library }:
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

tv-test-common = android_library {
    name = "tv-test-common";

    #  Include all test java files.
    srcs = [
        "src/com/android/tv/input/TunerHelper.java"
        "src/com/android/tv/testing/ChannelNumberSubject.java"
        "src/com/android/tv/testing/ComparableTester.java"
        "src/com/android/tv/testing/ComparatorTester.java"
        "src/com/android/tv/testing/DbTestingUtils.java"
        "src/com/android/tv/testing/EpgTestData.java"
        "src/com/android/tv/testing/FakeEpgFetcher.java"
        "src/com/android/tv/testing/FakeEpgReader.java"
        "src/com/android/tv/testing/FakeTvInputManager.java"
        "src/com/android/tv/testing/FakeTvInputManagerHelper.java"
        "src/com/android/tv/testing/SingletonProvider.java"
        "src/com/android/tv/testing/TestSingletonApp.java"
        "src/com/android/tv/testing/activities/BaseMainActivityTestCase.java"
        "src/com/android/tv/testing/constants/ConfigConstants.java"
        "src/com/android/tv/testing/constants/Constants.java"
        "src/com/android/tv/testing/constants/TvContentRatingConstants.java"
        "src/com/android/tv/testing/data/ChannelInfo.java"
        "src/com/android/tv/testing/data/ChannelUtils.java"
        "src/com/android/tv/testing/data/ProgramInfo.java"
        "src/com/android/tv/testing/data/ProgramUtils.java"
        "src/com/android/tv/testing/dvr/DvrDataManagerInMemoryImpl.java"
        "src/com/android/tv/testing/dvr/RecordingTestUtils.java"
        "src/com/android/tv/testing/fakes/FakeClock.java"
        "src/com/android/tv/testing/fakes/FakeTvProvider.java"
        "src/com/android/tv/testing/robo/ContentProviders.java"
        "src/com/android/tv/testing/robo/RobotTestAppHelper.java"
        "src/com/android/tv/testing/shadows/ShadowMediaSession.java"
        "src/com/android/tv/testing/testdata/TestData.java"
        "src/com/android/tv/testing/testinput/ChannelState.java"
        "src/com/android/tv/testing/testinput/ChannelStateData.java"
        "src/com/android/tv/testing/testinput/TestInputControlConnection.java"
        "src/com/android/tv/testing/testinput/TestInputControlUtils.java"
        "src/com/android/tv/testing/testinput/TvTestInputConstants.java"
        "src/com/android/tv/testing/uihelper/BaseUiDeviceHelper.java"
        "src/com/android/tv/testing/uihelper/ByResource.java"
        "src/com/android/tv/testing/uihelper/Constants.java"
        "src/com/android/tv/testing/uihelper/DialogHelper.java"
        "src/com/android/tv/testing/uihelper/LiveChannelsUiDeviceHelper.java"
        "src/com/android/tv/testing/uihelper/MenuHelper.java"
        "src/com/android/tv/testing/uihelper/SidePanelHelper.java"
        "src/com/android/tv/testing/uihelper/UiDeviceAsserts.java"
        "src/com/android/tv/testing/uihelper/UiDeviceUtils.java"
        "src/com/android/tv/testing/uihelper/UiObject2Asserts.java"
        "src/com/android/tv/testing/uihelper/UiObject2Utils.java"
        "src/com/android/tv/testing/utils/TestUtils.java"
        "src/com/android/tv/testing/utils/Utils.java"
        "src/com/android/tv/testing/testinput/ITestInputControl.aidl"
    ];

    static_libs = [
        "android-support-annotations"
        "androidx.test.runner"
        "androidx.test.rules"
        "tv-guava-android-jar"
        "mockito-robolectric-prebuilt"
        "tv-lib-truth"
        "ub-uiautomator"
        "Robolectric_all-target"
    ];

    #  Link tv-common as shared library to avoid the problem of initialization of the constants
    libs = [
        "tv-common"
        "LiveTv"
    ];

    sdk_version = "system_current";

    resource_dirs = ["res"];
    aidl = {
        local_include_dirs = ["src"];
    };

};

in { inherit tv-test-common; }
