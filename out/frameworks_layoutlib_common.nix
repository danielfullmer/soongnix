{ java_library_host }:
let

#
#  Copyright (C) 2008 The Android Open Source Project
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

layoutlib-common = java_library_host {
    name = "layoutlib-common";

    srcs = [
        "src/com/android/tools/layoutlib/annotations/LayoutlibDelegate.java"
        "src/com/android/tools/layoutlib/annotations/NotNull.java"
        "src/com/android/tools/layoutlib/annotations/Nullable.java"
        "src/com/android/tools/layoutlib/annotations/VisibleForTesting.java"
    ];
};

in { inherit layoutlib-common; }
