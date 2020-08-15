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

handheld-app-helpers = java_library {
    name = "handheld-app-helpers";
    sdk_version = "test_current";
    static_libs = [
        "app-helpers-handheld-interfaces"
        "business-card-app-helper"
        "performance-launch-app-helper"
    ];
    srcs = [];
};

in { inherit handheld-app-helpers; }
