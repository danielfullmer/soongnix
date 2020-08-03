{ cc_binary, cc_defaults, cc_test }:
let

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

performanced_defaults = cc_defaults {
    name = "performanced_defaults";
    static_libs = [
        "libperformance"
        "libvr_manager"
    ];
    shared_libs = [
        "libbinder"
        "libbase"
        "libcutils"
        "liblog"
        "libutils"
        "libpdx_default_transport"
    ];
};

performanced = cc_binary {
    name = "performanced";
    defaults = ["performanced_defaults"];
    srcs = [
        "cpu_set.cpp"
        "main.cpp"
        "performance_service.cpp"
        "task.cpp"
    ];
    cflags = [
        "-DLOG_TAG=\"performanced\""
        "-DTRACE=0"
        "-Wall"
        "-Werror"
    ];
    init_rc = ["performanced.rc"];
};

performance_service_tests = cc_test {
    name = "performance_service_tests";
    defaults = ["performanced_defaults"];
    srcs = ["performance_service_tests.cpp"];
};

in { inherit performance_service_tests performanced performanced_defaults; }
