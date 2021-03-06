{ java_library_static }:
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

test-composers = java_library_static {
    name = "test-composers";
    srcs = [
        "src/android/host/test/composer/Compose.java"
        "src/android/host/test/composer/Iterate.java"
        "src/android/host/test/composer/IterateBase.java"
        "src/android/host/test/composer/Shuffle.java"
        "src/android/host/test/composer/ShuffleBase.java"
    ];
    libs = ["junit"];
    host_supported = true;
    sdk_version = "current";
};

in { inherit test-composers; }
