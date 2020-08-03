{ cc_binary, cc_defaults, cc_library_shared, cc_test, filegroup }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

dumpstate_cflag_defaults = cc_defaults {
    name = "dumpstate_cflag_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-unused-variable"
        "-Wunused-parameter"
    ];
};

libdumpstateutil = cc_library_shared {
    name = "libdumpstateutil";
    defaults = ["dumpstate_cflag_defaults"];
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "DumpstateInternal.cpp"
        "DumpstateUtil.cpp"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    export_include_dirs = ["."];
    export_shared_lib_headers = [
        "libbase"
    ];
};

libdumpstateaidl = cc_library_shared {
    name = "libdumpstateaidl";
    defaults = ["dumpstate_cflag_defaults"];
    shared_libs = [
        "libbinder"
        "libutils"
    ];
    aidl = {
        local_include_dirs = ["binder"];
        export_aidl_headers = true;
    };
    srcs = [
        ":dumpstate_aidl"
    ];
    export_include_dirs = ["binder"];
};

dumpstate_aidl = filegroup {
    name = "dumpstate_aidl";
    srcs = [
        "binder/android/os/IDumpstateListener.aidl"
        "binder/android/os/IDumpstateToken.aidl"
        "binder/android/os/IDumpstate.aidl"
    ];
    path = "binder";
};

dumpstate_defaults = cc_defaults {
    name = "dumpstate_defaults";
    defaults = ["dumpstate_cflag_defaults"];
    shared_libs = [
        "android.hardware.dumpstate@1.0"
        "libziparchive"
        "libbase"
        "libbinder"
        "libcrypto"
        "libcutils"
        "libdebuggerd_client"
        "libdumpstateaidl"
        "libdumpstateutil"
        "libdumputils"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
    ];
    srcs = [
        "DumpstateSectionReporter.cpp"
        "DumpstateService.cpp"
        "utils.cpp"
    ];
    static_libs = [
        "libincidentcompanion"
        "libdumpsys"
        "libserviceutils"
    ];
};

dumpstate = cc_binary {
    name = "dumpstate";
    defaults = ["dumpstate_defaults"];
    srcs = [
        "dumpstate.cpp"
        "main.cpp"
    ];
    required = [
        "atrace"
        "df"
        "getprop"
        "ip"
        "iptables"
        "ip6tables"
        "kill"
        "librank"
        "logcat"
        "lsmod"
        "lsof"
        "netstat"
        "parse_radio_log"
        "printenv"
        "procrank"
        "screencap"
        "showmap"
        "ss"
        "storaged"
        "top"
        "uptime"
        "vdc"
        "vril-dump"
    ];
    init_rc = ["dumpstate.rc"];
};

dumpstate_test = cc_test {
    name = "dumpstate_test";
    defaults = ["dumpstate_defaults"];
    srcs = [
        "dumpstate.cpp"
        "tests/dumpstate_test.cpp"
    ];
    static_libs = ["libgmock"];
};

dumpstate_smoke_test = cc_test {
    name = "dumpstate_smoke_test";
    defaults = ["dumpstate_defaults"];
    srcs = [
        "dumpstate.cpp"
        "tests/dumpstate_smoke_test.cpp"
    ];
    static_libs = ["libgmock"];
};

#  =======================#
#  dumpstate_test_fixture #
#  =======================#
dumpstate_test_fixture = cc_test {

    name = "dumpstate_test_fixture";
    test_suites = ["device-tests"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-unused-variable"
        "-Wunused-parameter"
    ];
    srcs = ["tests/dumpstate_test_fixture.cpp"];
    data = ["tests/testdata/**/*"];
};

in { inherit dumpstate dumpstate_aidl dumpstate_cflag_defaults dumpstate_defaults dumpstate_smoke_test dumpstate_test dumpstate_test_fixture libdumpstateaidl libdumpstateutil; }
