{ android_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

ActivityManagerPerfTestsTestApp = android_test {
    name = "ActivityManagerPerfTestsTestApp";
    srcs = [
        "src/com/android/frameworks/perftests/amteststestapp/StartProcessService.java"
        "src/com/android/frameworks/perftests/amteststestapp/TestApplication.java"
        "src/com/android/frameworks/perftests/amteststestapp/TestBroadcastReceiver.java"
        "src/com/android/frameworks/perftests/amteststestapp/TestContentProvider.java"
        "src/com/android/frameworks/perftests/amteststestapp/TestService.java"
    ];
    static_libs = ["ActivityManagerPerfTestsUtils"];
    min_sdk_version = "25";
    sdk_version = "current";
};

in { inherit ActivityManagerPerfTestsTestApp; }
