{ android_app }:
let

#
#  Copyright (C) 2008 The Android Open Source Project
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

CalendarProvider = android_app {
    name = "CalendarProvider";
    static_libs = [
        "guava"
        "android-common"
        "calendar-common"
    ];
    srcs = [
        "src/com/android/providers/calendar/CalendarAlarmManager.java"
        "src/com/android/providers/calendar/CalendarCache.java"
        "src/com/android/providers/calendar/CalendarDatabaseHelper.java"
        "src/com/android/providers/calendar/CalendarDebug.java"
        "src/com/android/providers/calendar/CalendarDebugActivity.java"
        "src/com/android/providers/calendar/CalendarDebugReceiver.java"
        "src/com/android/providers/calendar/CalendarInstancesHelper.java"
        "src/com/android/providers/calendar/CalendarProvider2.java"
        "src/com/android/providers/calendar/CalendarProviderBroadcastReceiver.java"
        "src/com/android/providers/calendar/CalendarReceiver.java"
        "src/com/android/providers/calendar/CalendarSanityChecker.java"
        "src/com/android/providers/calendar/CalendarUpgradeReceiver.java"
        "src/com/android/providers/calendar/MetaData.java"
        "src/com/android/providers/calendar/QueryParameterUtils.java"
        "src/com/android/providers/calendar/SQLiteContentProvider.java"
        "src/com/android/providers/calendar/enterprise/CrossProfileCalendarHelper.java"
        "src/com/android/providers/calendar/EventLogTags.logtags"
    ];
    platform_apis = true;
    privileged = true;

    #  The Jacoco tool analyzes code coverage when running unit tests on the
    #  application. This configuration line selects which packages will be analyzed,
    #  leaving out code which is tested by other means (e.g. static libraries) that
    #  would dilute the coverage results. These options do not affect regular
    #  production builds.
    jacoco = {
        include_filter = ["com.android.providers.calendar.*"];
    };
};

in { inherit CalendarProvider; }
