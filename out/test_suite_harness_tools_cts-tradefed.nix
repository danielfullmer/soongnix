{ java_library_host, tradefed_binary_host }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

cts-tradefed-harness = java_library_host {
    name = "cts-tradefed-harness";

    java_resource_dirs = ["res"];
    libs = [
        "tradefed"
        "compatibility-host-util"
    ];
    static_libs = [
        "compatibility-tradefed"
    ];
};

cts-tradefed = tradefed_binary_host {
    name = "cts-tradefed";
    wrapper = "etc/cts-tradefed";
    short_name = "CTS";
    full_name = "Compatibility Test Suite";
    version = "10_r1";
    static_libs = ["cts-tradefed-harness"];
    required = ["compatibility-host-util"];
};

in { inherit cts-tradefed cts-tradefed-harness; }
