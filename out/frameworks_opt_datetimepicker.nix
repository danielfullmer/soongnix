{ android_library }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

android-opt-datetimepicker = android_library {
    name = "android-opt-datetimepicker";

    sdk_version = "current";

    srcs = [
        "src/com/android/datetimepicker/AccessibleLinearLayout.java"
        "src/com/android/datetimepicker/AccessibleTextView.java"
        "src/com/android/datetimepicker/HapticFeedbackController.java"
        "src/com/android/datetimepicker/Utils.java"
        "src/com/android/datetimepicker/date/AccessibleDateAnimator.java"
        "src/com/android/datetimepicker/date/DatePickerController.java"
        "src/com/android/datetimepicker/date/DatePickerDialog.java"
        "src/com/android/datetimepicker/date/DayPickerView.java"
        "src/com/android/datetimepicker/date/MonthAdapter.java"
        "src/com/android/datetimepicker/date/MonthView.java"
        "src/com/android/datetimepicker/date/SimpleDayPickerView.java"
        "src/com/android/datetimepicker/date/SimpleMonthAdapter.java"
        "src/com/android/datetimepicker/date/SimpleMonthView.java"
        "src/com/android/datetimepicker/date/TextViewWithCircularIndicator.java"
        "src/com/android/datetimepicker/date/YearPickerView.java"
        "src/com/android/datetimepicker/time/AmPmCirclesView.java"
        "src/com/android/datetimepicker/time/CircleView.java"
        "src/com/android/datetimepicker/time/RadialPickerLayout.java"
        "src/com/android/datetimepicker/time/RadialSelectorView.java"
        "src/com/android/datetimepicker/time/RadialTextsView.java"
        "src/com/android/datetimepicker/time/TimePickerDialog.java"

    ];

    resource_dirs = ["res"];

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.legacy_legacy-support-core-ui"
    ];

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit android-opt-datetimepicker; }
