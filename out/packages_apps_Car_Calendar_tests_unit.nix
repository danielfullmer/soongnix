{ android_test }:
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

CarCalendarUnitTests = android_test {
    name = "CarCalendarUnitTests";
    srcs = [
        "src/com/android/car/calendar/common/CalendarFormatterTest.java"
        "src/com/android/car/calendar/common/EventDescriptionsTest.java"
        "src/com/android/car/calendar/common/EventLocationsTest.java"
        "src/com/android/car/calendar/common/EventsLiveDataTest.java"
    ];
    instrumentation_for = "CarCalendarApp";
    optimize = {
        enabled = false;
    };
    sdk_version = "system_current";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "androidx.test.runner"
        "mockito-target"
        "truth-prebuilt"
    ];
    libs = [
        "android.test.base.stubs"
        "android.test.mock.stubs"
        "android.test.runner.stubs"
    ];
};

in { inherit CarCalendarUnitTests; }
