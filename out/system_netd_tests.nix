{ cc_test, cc_test_library }:
let

#
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

libnetd_test_tun_interface = cc_test_library {
    name = "libnetd_test_tun_interface";
    defaults = ["netd_defaults"];
    srcs = [
        "tun_interface.cpp"
    ];
    export_include_dirs = ["."];
    shared_libs = [
        "libbase"
        "libnetutils"
    ];
};

libnetd_test_unsol_service = cc_test_library {
    name = "libnetd_test_unsol_service";
    defaults = ["netd_defaults"];
    srcs = [
        "TestUnsolService.cpp"
    ];
    include_dirs = [
        "system/netd/include"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "liblog"
        "libnetutils"
        "libsysutils"
        "libutils"
        "netd_aidl_interface-cpp"
    ];
};

netd_integration_test = cc_test {
    name = "netd_integration_test";
    test_suites = ["device-tests"];
    require_root = true;
    defaults = ["netd_defaults"];
    srcs = [
        ":netd_integration_test_shared"
        "binder_test.cpp"
        "bpf_base_test.cpp"
        "netd_test.cpp"
        "netlink_listener_test.cpp"
    ];
    include_dirs = ["system/netd/server"];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcrypto"
        "libcutils"
        "liblog"
        "libnetd_client"
        "libnetutils"
        "libprocessgroup"
        "libssl"
        "libutils"
    ];
    static_libs = [
        "libcap"
        "libnetd_test_tun_interface"
        "libnetd_test_unsol_service"
        "libbpf_android"
        "liblogwrap"
        "libnetdbpf"
        "libnetdutils"
        "libqtaguid"
        "netd_aidl_interface-cpp"
        "netd_event_listener_interface-cpp"
        "oemnetd_aidl_interface-cpp"
    ];
    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    sanitize = {
        address = true;
        recover = ["all"];
    };
};

in { inherit libnetd_test_tun_interface libnetd_test_unsol_service netd_integration_test; }
