{ java_library_host, tradefed_binary_host }:
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

#  Set of error prone rules to ensure code quality
#  PackageLocation check requires the androidCompatible=false otherwise it does not do anything.
atest-tradefed-shell = java_library_host {
    name = "atest-tradefed-shell";
};

atest-tradefed = tradefed_binary_host {
    name = "atest-tradefed";
    short_name = "ATEST";
    full_name = "ATest Test Suite";
    static_libs = ["atest-tradefed-shell"];
};

in { inherit atest-tradefed atest-tradefed-shell; }
