{ java_library }:
let

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

ContactsProviderTestUtils = java_library {
    name = "ContactsProviderTestUtils";
    srcs = [
        "src/com/android/providers/contacts/testutil/CommonDatabaseUtils.java"
        "src/com/android/providers/contacts/testutil/ContactUtil.java"
        "src/com/android/providers/contacts/testutil/DataUtil.java"
        "src/com/android/providers/contacts/testutil/DatabaseAsserts.java"
        "src/com/android/providers/contacts/testutil/DeletedContactUtil.java"
        "src/com/android/providers/contacts/testutil/RawContactUtil.java"
        "src/com/android/providers/contacts/testutil/TestUtil.java"
    ];
    libs = [
        "android.test.runner"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
    ];
};

in { inherit ContactsProviderTestUtils; }
