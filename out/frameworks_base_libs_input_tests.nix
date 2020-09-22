{ cc_test }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

libinputservice_test = cc_test {
    name = "libinputservice_test";
    srcs = [
        "PointerController_test.cpp"
    ];
    shared_libs = [
        "libandroid_runtime"
        "libinputservice"
        "libhwui"
        "libgui"
        "libutils"
    ];
    static_libs = [
        "libgmock"
        "libgtest"
    ];
    header_libs = [
        "libbase_headers"
        "libinputflinger_headers"
    ];
    include_dirs = [
        "frameworks/base/libs"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    test_suites = [
        "general-tests"
    ];
};

in { inherit libinputservice_test; }