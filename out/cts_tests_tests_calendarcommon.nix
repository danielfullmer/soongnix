{ android_test }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

CtsCalendarcommon2TestCases = android_test {
    name = "CtsCalendarcommon2TestCases";
    defaults = ["cts_defaults"];
    static_libs = ["ctstestrunner-axt"];
    libs = ["android.test.base.stubs"];
    srcs = [
        "src/android/calendarcommon2/cts/Calendarcommon2Test.java"
        "src/com/android/calendarcommon2/EventRecurrence.java"
        "src/com/android/calendarcommon2/ICalendar.java"
        "src/com/android/calendarcommon2/RecurrenceSet.java"
    ];
    sdk_version = "current";
    min_sdk_version = "15";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsCalendarcommon2TestCases; }
