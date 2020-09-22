{ java_library_host }:
let

#  Copyright 2019 The Android Open Source Project
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

#  The goal of this minimal target is to define some useful things
#  with extremely few dependencies (i.e. just JUnit).  Potentially
#  this target could house a lot of our interface definitions just
#  so we can share those without too much fear of dependency hell.
tradefed-lite = java_library_host {
    name = "tradefed-lite";
    defaults = ["tradefed_defaults"];
    srcs = [
        "com/android/tradefed/lite/DryRunner.java"
        "com/android/tradefed/lite/HostUtils.java"
    ];
    static_libs = [
        "junit"
    ];
};

in { inherit tradefed-lite; }
