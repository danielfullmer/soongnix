{ java_library }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

bluetooth-test-util-lib = java_library {
    name = "bluetooth-test-util-lib";

    static_libs = [
        "junit"
    ];

    srcs = ["src/android/bluetooth/cts/BTAdapterUtils.java"];

    sdk_version = "current";
};

in { inherit bluetooth-test-util-lib; }
