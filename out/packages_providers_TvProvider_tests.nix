{ android_test }:
let

#
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
#

TvProviderTests = android_test {
    name = "TvProviderTests";
    srcs = [
        "src/com/android/providers/tv/BootCompletedReceiverTest.java"
        "src/com/android/providers/tv/ColumnFilterTest.java"
        "src/com/android/providers/tv/DatabaseHelperTest.java"
        "src/com/android/providers/tv/EpgDataCleanupServiceTests.java"
        "src/com/android/providers/tv/MockTvProviderContext.java"
        "src/com/android/providers/tv/PackageRemovedReceiverTest.java"
        "src/com/android/providers/tv/ParametersTest.java"
        "src/com/android/providers/tv/TransientRowHelperTests.java"
        "src/com/android/providers/tv/TvProviderForTesting.java"
        "src/com/android/providers/tv/UnrecognizedColumnsTest.java"
        "src/com/android/providers/tv/Utils.java"
        "src/com/android/providers/tv/util/SqliteTokenFinderTest.java"
    ];
    platform_apis = true;
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    static_libs = ["junit"];
    instrumentation_for = "TvProvider";
};

in { inherit TvProviderTests; }
