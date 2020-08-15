{ android_app }:
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

QuickSearchBox = android_app {
    name = "QuickSearchBox";
    sdk_version = "14";
    static_libs = [
        "guava"
        "android-common"
    ];
    srcs = [
        "src/com/android/quicksearchbox/AbstractInternalSource.java"
        "src/com/android/quicksearchbox/AbstractSource.java"
        "src/com/android/quicksearchbox/AbstractSuggestionCursorWrapper.java"
        "src/com/android/quicksearchbox/AbstractSuggestionExtras.java"
        "src/com/android/quicksearchbox/AbstractSuggestionWrapper.java"
        "src/com/android/quicksearchbox/CachingIconLoader.java"
        "src/com/android/quicksearchbox/Config.java"
        "src/com/android/quicksearchbox/CursorBackedSourceResult.java"
        "src/com/android/quicksearchbox/CursorBackedSuggestionCursor.java"
        "src/com/android/quicksearchbox/CursorBackedSuggestionExtras.java"
        "src/com/android/quicksearchbox/DialogActivity.java"
        "src/com/android/quicksearchbox/EventLogLogger.java"
        "src/com/android/quicksearchbox/Help.java"
        "src/com/android/quicksearchbox/IconLoader.java"
        "src/com/android/quicksearchbox/JsonBackedSuggestionExtras.java"
        "src/com/android/quicksearchbox/LatencyTracker.java"
        "src/com/android/quicksearchbox/LevenshteinSuggestionFormatter.java"
        "src/com/android/quicksearchbox/ListSuggestionCursor.java"
        "src/com/android/quicksearchbox/ListSuggestionCursorNoDuplicates.java"
        "src/com/android/quicksearchbox/Logger.java"
        "src/com/android/quicksearchbox/PackageIconLoader.java"
        "src/com/android/quicksearchbox/QsbApplication.java"
        "src/com/android/quicksearchbox/QsbApplicationWrapper.java"
        "src/com/android/quicksearchbox/QueryTask.java"
        "src/com/android/quicksearchbox/ResultFilter.java"
        "src/com/android/quicksearchbox/SearchActivity.java"
        "src/com/android/quicksearchbox/SearchSettings.java"
        "src/com/android/quicksearchbox/SearchSettingsImpl.java"
        "src/com/android/quicksearchbox/SearchWidgetProvider.java"
        "src/com/android/quicksearchbox/Source.java"
        "src/com/android/quicksearchbox/SourceResult.java"
        "src/com/android/quicksearchbox/Suggestion.java"
        "src/com/android/quicksearchbox/SuggestionCursor.java"
        "src/com/android/quicksearchbox/SuggestionCursorBackedCursor.java"
        "src/com/android/quicksearchbox/SuggestionCursorProvider.java"
        "src/com/android/quicksearchbox/SuggestionCursorWrapper.java"
        "src/com/android/quicksearchbox/SuggestionData.java"
        "src/com/android/quicksearchbox/SuggestionExtras.java"
        "src/com/android/quicksearchbox/SuggestionFilter.java"
        "src/com/android/quicksearchbox/SuggestionFormatter.java"
        "src/com/android/quicksearchbox/SuggestionNonFormatter.java"
        "src/com/android/quicksearchbox/SuggestionPosition.java"
        "src/com/android/quicksearchbox/SuggestionUtils.java"
        "src/com/android/quicksearchbox/Suggestions.java"
        "src/com/android/quicksearchbox/SuggestionsProvider.java"
        "src/com/android/quicksearchbox/SuggestionsProviderImpl.java"
        "src/com/android/quicksearchbox/TextAppearanceFactory.java"
        "src/com/android/quicksearchbox/VoiceSearch.java"
        "src/com/android/quicksearchbox/google/AbstractGoogleSource.java"
        "src/com/android/quicksearchbox/google/AbstractGoogleSourceResult.java"
        "src/com/android/quicksearchbox/google/GoogleSearch.java"
        "src/com/android/quicksearchbox/google/GoogleSource.java"
        "src/com/android/quicksearchbox/google/GoogleSuggestClient.java"
        "src/com/android/quicksearchbox/google/GoogleSuggestionProvider.java"
        "src/com/android/quicksearchbox/google/SearchBaseUrlHelper.java"
        "src/com/android/quicksearchbox/ui/BaseSuggestionView.java"
        "src/com/android/quicksearchbox/ui/ClusteredSuggestionsView.java"
        "src/com/android/quicksearchbox/ui/ContactBadge.java"
        "src/com/android/quicksearchbox/ui/CorpusView.java"
        "src/com/android/quicksearchbox/ui/DefaultSuggestionView.java"
        "src/com/android/quicksearchbox/ui/DefaultSuggestionViewFactory.java"
        "src/com/android/quicksearchbox/ui/DelayingSuggestionsAdapter.java"
        "src/com/android/quicksearchbox/ui/QueryTextView.java"
        "src/com/android/quicksearchbox/ui/SearchActivityView.java"
        "src/com/android/quicksearchbox/ui/SearchActivityViewSinglePane.java"
        "src/com/android/quicksearchbox/ui/SuggestionClickListener.java"
        "src/com/android/quicksearchbox/ui/SuggestionView.java"
        "src/com/android/quicksearchbox/ui/SuggestionViewFactory.java"
        "src/com/android/quicksearchbox/ui/SuggestionViewInflater.java"
        "src/com/android/quicksearchbox/ui/SuggestionsAdapter.java"
        "src/com/android/quicksearchbox/ui/SuggestionsAdapterBase.java"
        "src/com/android/quicksearchbox/ui/SuggestionsListAdapter.java"
        "src/com/android/quicksearchbox/ui/SuggestionsListView.java"
        "src/com/android/quicksearchbox/ui/SuggestionsView.java"
        "src/com/android/quicksearchbox/ui/WebSearchSuggestionView.java"
        "src/com/android/quicksearchbox/util/AsyncDataSetObservable.java"
        "src/com/android/quicksearchbox/util/BarrierConsumer.java"
        "src/com/android/quicksearchbox/util/BatchingNamedTaskExecutor.java"
        "src/com/android/quicksearchbox/util/CachedLater.java"
        "src/com/android/quicksearchbox/util/Consumer.java"
        "src/com/android/quicksearchbox/util/Consumers.java"
        "src/com/android/quicksearchbox/util/Factory.java"
        "src/com/android/quicksearchbox/util/HttpHelper.java"
        "src/com/android/quicksearchbox/util/JavaNetHttpHelper.java"
        "src/com/android/quicksearchbox/util/LevenshteinDistance.java"
        "src/com/android/quicksearchbox/util/NamedTask.java"
        "src/com/android/quicksearchbox/util/NamedTaskExecutor.java"
        "src/com/android/quicksearchbox/util/NoOpConsumer.java"
        "src/com/android/quicksearchbox/util/Now.java"
        "src/com/android/quicksearchbox/util/NowOrLater.java"
        "src/com/android/quicksearchbox/util/NowOrLaterWrapper.java"
        "src/com/android/quicksearchbox/util/PerNameExecutor.java"
        "src/com/android/quicksearchbox/util/PriorityThreadFactory.java"
        "src/com/android/quicksearchbox/util/QuietlyCloseable.java"
        "src/com/android/quicksearchbox/util/SQLiteAsyncQuery.java"
        "src/com/android/quicksearchbox/util/SQLiteTransaction.java"
        "src/com/android/quicksearchbox/util/SingleThreadNamedTaskExecutor.java"
        "src/com/android/quicksearchbox/util/Util.java"
        "src/com/android/quicksearchbox/EventLogTags.logtags"
    ];
    certificate = "shared";
    product_specific = true;
    resource_dirs = ["res"];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit QuickSearchBox; }
