{ android_test }:
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

CtsDragAndDropSourceApp = android_test {
    name = "CtsDragAndDropSourceApp";
    defaults = ["cts_support_defaults"];

    srcs = [
        "src/android/server/wm/dndsourceapp/Components.java"
        "src/android/server/wm/dndsourceapp/DragSource.java"
        "src/android/server/wm/dndsourceapp/DragSourceContentProvider.java"
        "src/android/server/wm/dndsourceapp/DragSourceCursor.java"
    ];

    sdk_version = "current";

    static_libs = ["cts-wm-app-base"];

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsDragAndDropSourceApp; }
