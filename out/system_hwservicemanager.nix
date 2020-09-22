{ cc_binary, cc_defaults, cc_library_static, cc_test }:
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

hwservicemanager_defaults = cc_defaults {
    name = "hwservicemanager_defaults";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    shared_libs = [
        "libhidlbase"
        "liblog"
    ];
};

libhwservicemanager_shared_libs = cc_defaults {
    name = "libhwservicemanager_shared_libs";
    shared_libs = [
        "libbase"
        "libhidl-gen-utils"
        "libselinux"
        "libutils"
        "libvintf"
    ];
};

libhwservicemanager = cc_library_static {
    name = "libhwservicemanager";
    host_supported = true;
    defaults = [
        "hwservicemanager_defaults"
        "libhwservicemanager_shared_libs"
    ];
    srcs = [
        "AccessControl.cpp"
        "HidlService.cpp"
        "ServiceManager.cpp"
        "Vintf.cpp"
    ];
};

libtokenmanager_shared_libs = cc_defaults {
    name = "libtokenmanager_shared_libs";
    shared_libs = [
        "android.hidl.token@1.0"
        "libcrypto"
    ];
};

libtokenmanager = cc_library_static {
    name = "libtokenmanager";
    defaults = [
        "hwservicemanager_defaults"
        "libtokenmanager_shared_libs"
    ];
    srcs = [
        "TokenManager.cpp"
    ];
};

hwservicemanager = cc_binary {
    name = "hwservicemanager";
    defaults = [
        "hwservicemanager_defaults"
        "libhwservicemanager_shared_libs"
        "libtokenmanager_shared_libs"
    ];
    init_rc = [
        "hwservicemanager.rc"
    ];
    srcs = [
        "service.cpp"
    ];
    shared_libs = [
        "libcutils"
    ];
    static_libs = [
        "libhwservicemanager"
        "libtokenmanager"
    ];
};

hwservicemanager_test = cc_test {
    name = "hwservicemanager_test";
    host_supported = true;
    defaults = [
        "hwservicemanager_defaults"
        "libhwservicemanager_shared_libs"
    ];
    static_libs = [
        "libgmock"
        "libhwservicemanager"
    ];
    srcs = [
        "test_lazy.cpp"
    ];
    test_suites = ["device-tests"];
};

in { inherit hwservicemanager hwservicemanager_defaults hwservicemanager_test libhwservicemanager libhwservicemanager_shared_libs libtokenmanager libtokenmanager_shared_libs; }
