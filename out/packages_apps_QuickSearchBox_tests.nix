{ android_test }:
let

#
#  Copyright (C) 2009 The Android Open Source Project
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

QuickSearchBoxTests = android_test {
    name = "QuickSearchBoxTests";
    sdk_version = "9";
    srcs = [
        "src/com/android/quicksearchbox/CachingIconLoaderTest.java"
        "src/com/android/quicksearchbox/ConsumerTrap.java"
        "src/com/android/quicksearchbox/IconLoaderTest.java"
        "src/com/android/quicksearchbox/LevenshteinFormatterTest.java"
        "src/com/android/quicksearchbox/MockHandler.java"
        "src/com/android/quicksearchbox/MockIconLoader.java"
        "src/com/android/quicksearchbox/MockLogger.java"
        "src/com/android/quicksearchbox/MockSearchSettings.java"
        "src/com/android/quicksearchbox/MockSource.java"
        "src/com/android/quicksearchbox/MockSuggestionExtras.java"
        "src/com/android/quicksearchbox/MockSuggestionProviderCursor.java"
        "src/com/android/quicksearchbox/MockTextAppearanceFactory.java"
        "src/com/android/quicksearchbox/PackageIconLoaderTest.java"
        "src/com/android/quicksearchbox/SearchActivityTest.java"
        "src/com/android/quicksearchbox/SuggestionCursorUtil.java"
        "src/com/android/quicksearchbox/SuggestionUtilsTest.java"
        "src/com/android/quicksearchbox/tests/CrashingIconProvider.java"
        "src/com/android/quicksearchbox/util/CachedLaterTest.java"
        "src/com/android/quicksearchbox/util/LevenshteinDistanceTest.java"
        "src/com/android/quicksearchbox/util/MockDataSetObserver.java"
        "src/com/android/quicksearchbox/util/MockExecutor.java"
        "src/com/android/quicksearchbox/util/MockNamedTaskExecutor.java"
        "src/com/android/quicksearchbox/util/MockNamedTaskExecutorFactory.java"
        "src/com/android/quicksearchbox/util/MockTask.java"
        "src/com/android/quicksearchbox/util/PerNameExecutorTest.java"
        "src/com/android/quicksearchbox/util/PriorityThreadFactoryTest.java"
        "src/com/android/quicksearchbox/util/SingleThreadNamedTaskExecutorTest.java"
    ];
    certificate = "shared";
    instrumentation_for = "QuickSearchBox";
};

in { inherit QuickSearchBoxTests; }
