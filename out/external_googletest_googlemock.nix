{ cc_defaults, cc_library_host_static, cc_library_static }:
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

gmock_flags = cc_defaults {
    name = "gmock_flags";

    local_include_dirs = ["include"];
    export_include_dirs = ["include"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];
};

gmock_ndk = cc_defaults {
    name = "gmock_ndk";
    sdk_version = "9";
    stl = "c++_static";
    cppflags = ["-std=c++11"];
};

gmock_defaults = cc_defaults {
    name = "gmock_defaults";
    host_supported = true;
    sanitize = {
        never = true;
    };
    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
        };
    };
};

libgmock_ndk = cc_library_static {
    name = "libgmock_ndk";
    defaults = [
        "gmock_ndk"
        "gmock_flags"
    ];
    srcs = ["src/gmock-all.cc"];
    static_libs = ["libgtest_ndk_c++"];
};

libgmock_main_ndk = cc_library_static {
    name = "libgmock_main_ndk";
    defaults = [
        "gmock_ndk"
        "gmock_flags"
    ];
    srcs = ["src/gmock_main.cc"];
    static_libs = ["libgtest_ndk_c++"];
};

libgmock = cc_library_static {
    name = "libgmock";
    defaults = [
        "gmock_defaults"
        "gmock_flags"
    ];
    srcs = ["src/gmock-all.cc"];
    rtti = true;
    static_libs = ["libgtest"];
    vendor_available = true;
};

libgmock_main = cc_library_static {
    name = "libgmock_main";
    defaults = [
        "gmock_defaults"
        "gmock_flags"
    ];
    srcs = ["src/gmock_main.cc"];
    static_libs = ["libgtest"];
    vendor_available = true;
};

#  Deprecated: use libgmock instead
libgmock_host = cc_library_host_static {
    name = "libgmock_host";
    defaults = [
        "gmock_defaults"
        "gmock_flags"
    ];
    whole_static_libs = ["libgmock"];
};

libgmock_main_host = cc_library_host_static {
    name = "libgmock_main_host";
    defaults = [
        "gmock_defaults"
        "gmock_flags"
    ];
    whole_static_libs = ["libgmock_main"];
};

#  Tests are in the Android.mk. Run with external/googletest/run_tests.py.

in { inherit gmock_defaults gmock_flags gmock_ndk libgmock libgmock_host libgmock_main libgmock_main_host libgmock_main_ndk libgmock_ndk; }
