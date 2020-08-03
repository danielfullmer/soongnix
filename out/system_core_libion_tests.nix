{ cc_test }:
let

#
#  Copyright (C) 2013 The Android Open Source Project
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
#

ion-unit-tests = cc_test {
    name = "ion-unit-tests";
    cflags = [
        "-g"
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
    ];
    shared_libs = ["libion"];
    srcs = [
        "ion_test_fixture.cpp"
        "allocate_test.cpp"
        "formerly_valid_handle_test.cpp"
        "invalid_values_test.cpp"
        "map_test.cpp"
        "device_test.cpp"
        "exit_test.cpp"
    ];
};

in { inherit ion-unit-tests; }
