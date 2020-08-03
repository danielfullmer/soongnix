{ java_library }:
let

#  Copyright 2019 Google LLC
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  Android build file for building the library in AOSP
#  https://android.googlesource.com/platform/external/ukey2

ukey2 = java_library {
    name = "ukey2";
    proto = {
        type = "lite";
        include_dirs = ["external/ukey2/src/main/proto"];
    };
    srcs = [
        "**/*.proto"
        "**/*.java"
    ];
    libs = [
        "guava"
    ];
};

in { inherit ukey2; }
