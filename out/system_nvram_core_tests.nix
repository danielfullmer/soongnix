{ cc_test_host }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

libnvram-core-tests = cc_test_host {
    name = "libnvram-core-tests";
    srcs = [
        "fake_storage.cpp"
        "nvram_manager_test.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-DHAS_GTEST"
    ];
    static_libs = ["libnvram-core"];
    shared_libs = [
        "libnvram-messages"
        "libcrypto"
    ];
};

in { inherit libnvram-core-tests; }
