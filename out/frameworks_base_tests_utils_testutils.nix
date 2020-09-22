{ java_library }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

frameworks-base-testutils = java_library {
    name = "frameworks-base-testutils";

    srcs = [
        "java/android/app/test/MockAnswerUtil.java"
        "java/android/app/test/TestAlarmManager.java"
        "java/android/os/test/TestLooper.java"
        "java/android/os/test/TestLooperTest.java"
        "java/android/view/test/InsetsModeSession.java"
        "java/com/android/internal/util/test/BidirectionalAsyncChannel.java"
        "java/com/android/internal/util/test/BidirectionalAsyncChannelServer.java"
        "java/com/android/internal/util/test/BroadcastInterceptingContext.java"
        "java/com/android/internal/util/test/FakeSettingsProvider.java"
        "java/com/android/server/accessibility/test/MessageCapturingHandler.java"
        "java/com/android/server/wm/test/filters/FrameworksTestsFilter.java"
        "java/com/android/test/filters/SelectTest.java"
        "java/com/android/test/filters/SelectTestTests.java"
    ];

    static_libs = [
        "junit"
        "hamcrest-library"
        "androidx.test.runner"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
        "mockito-target-minus-junit4"
    ];
};

in { inherit frameworks-base-testutils; }
