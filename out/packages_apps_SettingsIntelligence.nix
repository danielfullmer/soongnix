{ android_app }:
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

SettingsIntelligence = android_app {
    name = "SettingsIntelligence";
    optimize = {
        proguard_flags_files = ["proguard.cfg"];
    };
    sdk_version = "system_current";
    product_specific = true;
    privileged = true;
    required = ["privapp_whitelist_com.android.settings.intelligence"];

    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "androidx.legacy_legacy-support-v13"
        "androidx.appcompat_appcompat"
        "androidx.cardview_cardview"
        "androidx.preference_preference"
        "androidx.recyclerview_recyclerview"
        "androidx.legacy_legacy-preference-v14"
    ];
    resource_dirs = ["res"];
    srcs = [
        "src/com/android/settings/intelligence/SettingsIntelligenceDumpService.java"
        "src/com/android/settings/intelligence/experiment/ExperimentFeatureProvider.java"
        "src/com/android/settings/intelligence/instrumentation/EventLogger.java"
        "src/com/android/settings/intelligence/instrumentation/LocalEventLogger.java"
        "src/com/android/settings/intelligence/instrumentation/MetricsFeatureProvider.java"
        "src/com/android/settings/intelligence/overlay/FeatureFactory.java"
        "src/com/android/settings/intelligence/overlay/FeatureFactoryImpl.java"
        "src/com/android/settings/intelligence/search/AppSearchResult.java"
        "src/com/android/settings/intelligence/search/IntentSearchViewHolder.java"
        "src/com/android/settings/intelligence/search/ResultPayload.java"
        "src/com/android/settings/intelligence/search/ResultPayloadUtils.java"
        "src/com/android/settings/intelligence/search/SearchActivity.java"
        "src/com/android/settings/intelligence/search/SearchFeatureProvider.java"
        "src/com/android/settings/intelligence/search/SearchFeatureProviderImpl.java"
        "src/com/android/settings/intelligence/search/SearchFragment.java"
        "src/com/android/settings/intelligence/search/SearchIndexableRaw.java"
        "src/com/android/settings/intelligence/search/SearchResult.java"
        "src/com/android/settings/intelligence/search/SearchResultAggregator.java"
        "src/com/android/settings/intelligence/search/SearchResultDiffCallback.java"
        "src/com/android/settings/intelligence/search/SearchResultLoader.java"
        "src/com/android/settings/intelligence/search/SearchResultsAdapter.java"
        "src/com/android/settings/intelligence/search/SearchViewHolder.java"
        "src/com/android/settings/intelligence/search/indexing/DatabaseIndexingManager.java"
        "src/com/android/settings/intelligence/search/indexing/DatabaseIndexingUtils.java"
        "src/com/android/settings/intelligence/search/indexing/IndexData.java"
        "src/com/android/settings/intelligence/search/indexing/IndexDataConverter.java"
        "src/com/android/settings/intelligence/search/indexing/IndexDatabaseHelper.java"
        "src/com/android/settings/intelligence/search/indexing/IndexingCallback.java"
        "src/com/android/settings/intelligence/search/indexing/PreIndexData.java"
        "src/com/android/settings/intelligence/search/indexing/PreIndexDataCollector.java"
        "src/com/android/settings/intelligence/search/indexing/XmlParserUtils.java"
        "src/com/android/settings/intelligence/search/query/AccessibilityServiceResultTask.java"
        "src/com/android/settings/intelligence/search/query/CursorToSearchResultConverter.java"
        "src/com/android/settings/intelligence/search/query/DatabaseResultTask.java"
        "src/com/android/settings/intelligence/search/query/InputDeviceResultTask.java"
        "src/com/android/settings/intelligence/search/query/InstalledAppResultTask.java"
        "src/com/android/settings/intelligence/search/query/SearchQueryTask.java"
        "src/com/android/settings/intelligence/search/query/SearchQueryUtils.java"
        "src/com/android/settings/intelligence/search/ranking/SearchResultsRankerCallback.java"
        "src/com/android/settings/intelligence/search/savedqueries/SavedQueryController.java"
        "src/com/android/settings/intelligence/search/savedqueries/SavedQueryLoader.java"
        "src/com/android/settings/intelligence/search/savedqueries/SavedQueryPayload.java"
        "src/com/android/settings/intelligence/search/savedqueries/SavedQueryRecorder.java"
        "src/com/android/settings/intelligence/search/savedqueries/SavedQueryRemover.java"
        "src/com/android/settings/intelligence/search/savedqueries/SavedQueryViewHolder.java"
        "src/com/android/settings/intelligence/search/sitemap/SiteMapManager.java"
        "src/com/android/settings/intelligence/search/sitemap/SiteMapPair.java"
        "src/com/android/settings/intelligence/suggestions/SuggestionFeatureProvider.java"
        "src/com/android/settings/intelligence/suggestions/SuggestionParser.java"
        "src/com/android/settings/intelligence/suggestions/SuggestionService.java"
        "src/com/android/settings/intelligence/suggestions/eligibility/AccountEligibilityChecker.java"
        "src/com/android/settings/intelligence/suggestions/eligibility/AutomotiveEligibilityChecker.java"
        "src/com/android/settings/intelligence/suggestions/eligibility/CandidateSuggestionFilter.java"
        "src/com/android/settings/intelligence/suggestions/eligibility/ConnectivityEligibilityChecker.java"
        "src/com/android/settings/intelligence/suggestions/eligibility/DismissedChecker.java"
        "src/com/android/settings/intelligence/suggestions/eligibility/FeatureEligibilityChecker.java"
        "src/com/android/settings/intelligence/suggestions/eligibility/ProviderEligibilityChecker.java"
        "src/com/android/settings/intelligence/suggestions/model/CandidateSuggestion.java"
        "src/com/android/settings/intelligence/suggestions/model/SuggestionCategory.java"
        "src/com/android/settings/intelligence/suggestions/model/SuggestionCategoryRegistry.java"
        "src/com/android/settings/intelligence/suggestions/model/SuggestionListBuilder.java"
        "src/com/android/settings/intelligence/suggestions/ranking/SuggestionEventStore.java"
        "src/com/android/settings/intelligence/suggestions/ranking/SuggestionFeaturizer.java"
        "src/com/android/settings/intelligence/suggestions/ranking/SuggestionRanker.java"
        "src/com/android/settings/intelligence/utils/AsyncLoader.java"
        "proto/settings_intelligence_log.proto"
    ];
    proto = {
        type = "nano";
    };
};

in { inherit SettingsIntelligence; }
