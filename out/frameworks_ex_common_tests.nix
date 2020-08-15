{ android_test }:
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

AndroidCommonTests = android_test {
    name = "AndroidCommonTests";
    certificate = "platform";
    libs = ["android.test.runner.stubs"];
    sdk_version = "8";
    srcs = [
        "src/com/android/common/OperationSchedulerTest.java"
        "src/com/android/common/Rfc822ValidatorTest.java"
        "src/com/android/common/widget/CompositeCursorAdapterTest.java"
        "src/com/android/common/widget/GroupingListAdapterTests.java"
    ];
    static_libs = ["android-common"];
    optimize = {
        enabled = false;
    };
};

in { inherit AndroidCommonTests; }
