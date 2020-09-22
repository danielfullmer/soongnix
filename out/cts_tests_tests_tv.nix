{ android_test }:
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

CtsTvTestCases = android_test {
    name = "CtsTvTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    srcs = [
        "src/android/media/tv/cts/BundledTvInputServiceTest.java"
        "src/android/media/tv/cts/FaultyTvInputService.java"
        "src/android/media/tv/cts/HardwareSessionTest.java"
        "src/android/media/tv/cts/NoMetadataTvInputService.java"
        "src/android/media/tv/cts/NoPermissionTvInputService.java"
        "src/android/media/tv/cts/StubTunerTvInputService.java"
        "src/android/media/tv/cts/StubTvInputService.java"
        "src/android/media/tv/cts/TvContentRatingTest.java"
        "src/android/media/tv/cts/TvContractTest.java"
        "src/android/media/tv/cts/TvInputInfoTest.java"
        "src/android/media/tv/cts/TvInputManagerTest.java"
        "src/android/media/tv/cts/TvInputServiceTest.java"
        "src/android/media/tv/cts/TvInputSettingsActivityStub.java"
        "src/android/media/tv/cts/TvInputSetupActivityStub.java"
        "src/android/media/tv/cts/TvTrackInfoSubject.java"
        "src/android/media/tv/cts/TvTrackInfoTest.java"
        "src/android/media/tv/cts/TvViewStubActivity.java"
        "src/android/media/tv/cts/TvViewTest.java"
        "src/android/media/tv/cts/Utils.java"
        "src/android/media/tv/tuner/cts/TunerDvrTest.java"
        "src/android/media/tv/tuner/cts/TunerFilterTest.java"
        "src/android/media/tv/tuner/cts/TunerFrontendTest.java"
        "src/android/media/tv/tuner/cts/TunerTest.java"
        "src/android/tv/settings/cts/SettingsLeanbackStubActivity.java"
        "src/android/tv/settings/cts/SettingsLeanbackTest.java"
        "src/android/tv/settings/cts/Utils.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "androidx.test.core"
        "androidx.test.ext.truth"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "testng"
    ];
    #  sdk_version: "test_current",
    platform_apis = true;
};

in { inherit CtsTvTestCases; }
