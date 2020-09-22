{ java_test_host }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

PreloadCheck = java_test_host {
    name = "PreloadCheck";
    srcs = ["src/com/android/preload/check/PreloadCheck.java"];
    java_resources = [":preloaded-classes-blacklist"];
    libs = ["tradefed"];
    test_suites = ["general-tests"];
    required = ["preload-check-device"];
    data = [":preload-check-device"];
};

in { inherit PreloadCheck; }