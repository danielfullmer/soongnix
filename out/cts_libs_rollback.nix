{ java_library }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

cts-rollback-lib = java_library {
    name = "cts-rollback-lib";
    srcs = [
        "src/com/android/cts/rollback/lib/Rollback.java"
        "src/com/android/cts/rollback/lib/RollbackBroadcastReceiver.java"
        "src/com/android/cts/rollback/lib/RollbackInfoSubject.java"
        "src/com/android/cts/rollback/lib/RollbackUtils.java"
    ];
    static_libs = [
        "androidx.test.rules"
        "truth-prebuilt"
        "cts-install-lib"
    ];
    sdk_version = "test_current";
};

in { inherit cts-rollback-lib; }
