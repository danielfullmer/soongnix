{ java_library_host, tradefed_binary_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

cts-instant-resources = java_library_host {
    name = "cts-instant-resources";

    java_resource_dirs = ["res"];
};

cts-instant-tradefed = tradefed_binary_host {
    name = "cts-instant-tradefed";
    defaults = ["cts_error_prone_rules"];
    wrapper = "etc/cts-instant-tradefed";
    short_name = "CTS_INSTANT";
    full_name = "Compatibility Test Suite for Instant Apps";
    version = "9.0_r2";

    static_libs = [
        "cts-instant-resources"
        "cts-tradefed-harness"
    ];
};

in { inherit cts-instant-resources cts-instant-tradefed; }
