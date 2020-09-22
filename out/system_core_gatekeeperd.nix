{ cc_binary, cc_library_shared, filegroup }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

gatekeeperd = cc_binary {
    name = "gatekeeperd";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wunused"
    ];
    srcs = [
        "gatekeeperd.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libgatekeeper"
        "libgsi"
        "liblog"
        "libhardware"
        "libbase"
        "libutils"
        "libcrypto"
        "libkeystore_aidl"
        "libkeystore_binder"
        "libhidlbase"
        "android.hardware.gatekeeper@1.0"
        "libgatekeeper_aidl"
    ];

    static_libs = ["libscrypt_static"];
    include_dirs = ["external/scrypt/lib/crypto"];
    init_rc = ["gatekeeperd.rc"];
};

gatekeeper_aidl = filegroup {
    name = "gatekeeper_aidl";
    srcs = [
        "binder/android/service/gatekeeper/IGateKeeperService.aidl"
    ];
    path = "binder";
};

libgatekeeper_aidl = cc_library_shared {
    name = "libgatekeeper_aidl";
    srcs = [
        ":gatekeeper_aidl"
        "GateKeeperResponse.cpp"
    ];
    aidl = {
        export_aidl_headers = true;
        include_dirs = [
            "system/core/gatekeeperd/binder"
            "frameworks/base/core/java/"
        ];
    };
    export_include_dirs = ["include"];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
    ];
    export_shared_lib_headers = [
        "libbinder"
    ];
};

in { inherit gatekeeper_aidl gatekeeperd libgatekeeper_aidl; }
