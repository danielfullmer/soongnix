{ cc_binary, cc_defaults, cc_library, cc_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

carwatchdogd_defaults = cc_defaults {
    name = "carwatchdogd_defaults";
    cflags = [
        "-Wall"
        "-Wno-missing-field-initializers"
        "-Werror"
        "-Wno-unused-variable"
        "-Wunused-parameter"
    ];
    include_dirs = [
        "system/core/base/include"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "liblog"
        "libutils"
    ];
};

libwatchdog_ioperfcollection_defaults = cc_defaults {
    name = "libwatchdog_ioperfcollection_defaults";
    shared_libs = [
        "libcutils"
        "libprocessgroup"
    ];
    static_libs = [
        "libgtest_prod"
    ];
};

libwatchdog_ioperfcollection = cc_library {
    name = "libwatchdog_ioperfcollection";
    defaults = [
        "carwatchdogd_defaults"
        "libwatchdog_ioperfcollection_defaults"
    ];
    srcs = [
        "src/IoPerfCollection.cpp"
        "src/LooperWrapper.cpp"
        "src/ProcPidStat.cpp"
        "src/ProcStat.cpp"
        "src/UidIoStats.cpp"
    ];
    whole_static_libs = [
        "libwatchdog_properties"
    ];
    export_include_dirs = [
        "src"
    ];
};

libwatchdog_test = cc_test {
    name = "libwatchdog_test";
    defaults = [
        "carwatchdogd_defaults"
        "libwatchdog_ioperfcollection_defaults"
        "libwatchdog_process_service_defaults"
    ];
    test_suites = ["general-tests"];
    srcs = [
        "tests/IoPerfCollectionTest.cpp"
        "tests/LooperStub.cpp"
        "tests/ProcPidDir.cpp"
        "tests/ProcPidStatTest.cpp"
        "tests/ProcStatTest.cpp"
        "tests/UidIoStatsTest.cpp"
        "tests/WatchdogBinderMediatorTest.cpp"
        "tests/WatchdogProcessServiceTest.cpp"
    ];
    static_libs = [
        "libgmock"
        "libgtest"
        "libwatchdog_binder_mediator"
        "libwatchdog_ioperfcollection"
    ];
};

libwatchdog_process_service_defaults = cc_defaults {
    name = "libwatchdog_process_service_defaults";
    shared_libs = [
        "carwatchdog_aidl_interface-cpp"
    ];
};

libwatchdog_process_service = cc_library {
    name = "libwatchdog_process_service";
    srcs = [
        "src/WatchdogProcessService.cpp"
    ];
    defaults = [
        "carwatchdogd_defaults"
        "libwatchdog_process_service_defaults"
    ];
};

libwatchdog_binder_mediator = cc_library {
    name = "libwatchdog_binder_mediator";
    defaults = [
        "carwatchdogd_defaults"
        "libwatchdog_ioperfcollection_defaults"
        "libwatchdog_process_service_defaults"
    ];
    srcs = [
        "src/WatchdogBinderMediator.cpp"
        "src/WatchdogProcessService.cpp"
        "src/IoPerfCollection.cpp"
    ];
    shared_libs = [
        "libwatchdog_ioperfcollection"
        "libwatchdog_process_service"
    ];
    export_include_dirs = [
        "src"
    ];
};

carwatchdogd = cc_binary {
    name = "carwatchdogd";
    defaults = [
        "carwatchdogd_defaults"
        "libwatchdog_ioperfcollection_defaults"
        "libwatchdog_process_service_defaults"
    ];
    srcs = [
        "src/main.cpp"
        "src/ServiceManager.cpp"
    ];
    init_rc = ["carwatchdogd.rc"];
    shared_libs = [
        "libwatchdog_binder_mediator"
        "libwatchdog_ioperfcollection"
        "libwatchdog_process_service"
    ];
    vintf_fragments = ["carwatchdogd.xml"];
};

in { inherit carwatchdogd carwatchdogd_defaults libwatchdog_binder_mediator libwatchdog_ioperfcollection libwatchdog_ioperfcollection_defaults libwatchdog_process_service libwatchdog_process_service_defaults libwatchdog_test; }
