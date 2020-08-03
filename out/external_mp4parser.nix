{ java_library }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

mp4parser = java_library {
    name = "mp4parser";
    sdk_version = "9";
    srcs = ["isoparser/src/main/java/**/*.java"];
    java_resource_dirs = ["isoparser/src/main/resources"];

};

in { inherit mp4parser; }
