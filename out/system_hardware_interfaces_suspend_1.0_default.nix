{ cc_benchmark, cc_binary, cc_defaults, cc_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

system_suspend_defaults = cc_defaults {
    name = "system_suspend_defaults";
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    cpp_std = "c++17";
};

system_suspend_stats_defaults = cc_defaults {
    name = "system_suspend_stats_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

"android.system.suspend@1.0-service" = cc_binary {
    name = "android.system.suspend@1.0-service";
    relative_install_path = "hw";
    defaults = [
        "system_suspend_defaults"
        "system_suspend_stats_defaults"
    ];
    init_rc = ["android.system.suspend@1.0-service.rc"];
    vintf_fragments = ["android.system.suspend@1.0-service.xml"];
    shared_libs = [
        "android.system.suspend@1.0"
        "suspend_control_aidl_interface-cpp"
    ];
    srcs = [
        "main.cpp"
        "SuspendControlService.cpp"
        "SystemSuspend.cpp"
        "WakeLockEntryList.cpp"
    ];
};

#  Unit tests for ISystemSuspend implementation.
#  Do *NOT* use for compliance with *TS.
SystemSuspendV1_0UnitTest = cc_test {
    name = "SystemSuspendV1_0UnitTest";
    defaults = [
        "system_suspend_defaults"
        "system_suspend_stats_defaults"
    ];
    static_libs = [
        "android.system.suspend@1.0"
        "suspend_control_aidl_interface-cpp"
        "libgmock"
    ];
    srcs = [
        "SuspendControlService.cpp"
        "SystemSuspend.cpp"
        "SystemSuspendUnitTest.cpp"
        "WakeLockEntryList.cpp"
    ];
    test_suites = ["device-tests"];
    require_root = true;
};

SystemSuspendBenchmark = cc_benchmark {
    name = "SystemSuspendBenchmark";
    defaults = [
        "system_suspend_defaults"
    ];
    shared_libs = [
        "android.system.suspend@1.0"
        "suspend_control_aidl_interface-cpp"
    ];
    srcs = [
        "SystemSuspendBenchmark.cpp"
    ];
};

in { inherit "android.system.suspend@1.0-service" SystemSuspendBenchmark SystemSuspendV1_0UnitTest system_suspend_defaults system_suspend_stats_defaults; }
