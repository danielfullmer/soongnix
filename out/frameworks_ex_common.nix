{ java_library_static }:
let

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

#  Note: the source code is in java/, not src/, because this code is also part of
#  the framework library, and build/core/pathmap.mk expects a java/ subdirectory.

android-common = java_library_static {
    name = "android-common";
    sdk_version = "8";
    srcs = [
        "java/com/android/common/LegacyHttpDateTime.java"
        "java/com/android/common/NetworkConnectivityListener.java"
        "java/com/android/common/OperationScheduler.java"
        "java/com/android/common/Rfc822InputFilter.java"
        "java/com/android/common/Rfc822Validator.java"
        "java/com/android/common/Search.java"
        "java/com/android/common/SharedPreferencesCompat.java"
        "java/com/android/common/contacts/BaseEmailAddressAdapter.java"
        "java/com/android/common/contacts/DataUsageStatUpdater.java"
        "java/com/android/common/content/ProjectionMap.java"
        "java/com/android/common/content/SQLiteContentProvider.java"
        "java/com/android/common/content/SyncStateContentProviderHelper.java"
        "java/com/android/common/io/MoreCloseables.java"
        "java/com/android/common/speech/LoggingEvents.java"
        "java/com/android/common/speech/Recognition.java"
        "java/com/android/common/userhappiness/UserHappinessSignals.java"
        "java/com/android/common/widget/CompositeCursorAdapter.java"
        "java/com/android/common/widget/GroupingListAdapter.java"
        "java/com/android/ex/editstyledtext/EditStyledText.java"
        "java/com/android/common/GoogleLogTags.logtags"
    ];
};

in { inherit android-common; }
