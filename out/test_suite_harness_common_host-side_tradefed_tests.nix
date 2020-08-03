{ java_test_host, tradefed_binary_host }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

compatibility-tradefed-tests = java_test_host {
    name = "compatibility-tradefed-tests";
    defaults = ["tradefed_errorprone_defaults"];

    srcs = ["src/**/*.java"];
    java_resource_dirs = ["res"];

    libs = [
        "tradefed"
        "compatibility-mock-tradefed"
        "junit-host"
        "compatibility-host-util"
        "easymock"
        "objenesis-host"
        "mockito-host"
    ];
};

compatibility-mock-tradefed = tradefed_binary_host {
    name = "compatibility-mock-tradefed";
    short_name = "TESTS";
    full_name = "Compatibility Tests";
    version = "1";
    static_libs = ["cts-tradefed-harness"];
};

in { inherit compatibility-mock-tradefed compatibility-tradefed-tests; }
