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
#

DownloadProviderTests = android_test {
    name = "DownloadProviderTests";

    srcs = [
        "src/com/android/providers/downloads/AbstractDownloadProviderFunctionalTest.java"
        "src/com/android/providers/downloads/AbstractPublicApiTest.java"
        "src/com/android/providers/downloads/DownloadProviderFunctionalTest.java"
        "src/com/android/providers/downloads/FakeInputStream.java"
        "src/com/android/providers/downloads/FakeSystemFacade.java"
        "src/com/android/providers/downloads/HelpersTest.java"
        "src/com/android/providers/downloads/MockitoHelper.java"
        "src/com/android/providers/downloads/PublicApiFunctionalTest.java"
        "src/com/android/providers/downloads/ThreadingTest.java"
    ];

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
    ];

    static_libs = [
        "mockito-target"
        "mockwebserver"
    ];

    platform_apis = true;

    instrumentation_for = "DownloadProvider";

    test_suites = ["device-tests"];

    certificate = "media";
};

in { inherit DownloadProviderTests; }
