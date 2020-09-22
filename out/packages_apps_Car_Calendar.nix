{ android_app }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

CarCalendarApp = android_app {
    name = "CarCalendarApp";
    srcs = [
        "src/com/android/car/calendar/AllDayEventsItem.java"
        "src/com/android/car/calendar/CalendarItem.java"
        "src/com/android/car/calendar/CarCalendarActivity.java"
        "src/com/android/car/calendar/CarCalendarView.java"
        "src/com/android/car/calendar/CarCalendarViewModel.java"
        "src/com/android/car/calendar/DrawableStateImageButton.java"
        "src/com/android/car/calendar/EventCalendarItem.java"
        "src/com/android/car/calendar/TitleCalendarItem.java"
        "src/com/android/car/calendar/common/CalendarFormatter.java"
        "src/com/android/car/calendar/common/Dialer.java"
        "src/com/android/car/calendar/common/Event.java"
        "src/com/android/car/calendar/common/EventDescriptions.java"
        "src/com/android/car/calendar/common/EventLocations.java"
        "src/com/android/car/calendar/common/EventsLiveData.java"
        "src/com/android/car/calendar/common/Navigator.java"
    ];
    resource_dirs = ["res"];
    platform_apis = true;
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
    aaptflags = ["--auto-add-overlay"];
    static_libs = [
        "car-ui-lib"
        "androidx.lifecycle_lifecycle-extensions"
        "androidx.appcompat_appcompat"
        "androidx.lifecycle_lifecycle-livedata"
        "androidx.lifecycle_lifecycle-viewmodel"
        "guava"
    ];
    libs = ["android.car"];
};

in { inherit CarCalendarApp; }
