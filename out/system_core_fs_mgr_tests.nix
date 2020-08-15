{ cc_prebuilt_binary, cc_test, java_test_host, sh_test }:
let

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

fs_mgr_unit_test = cc_test {
    name = "fs_mgr_unit_test";
    test_suites = ["device-tests"];

    shared_libs = [
        "libbase"
        "liblog"
    ];
    static_libs = [
        "libfs_mgr"
        "libfstab"
    ];
    srcs = [
        "fs_mgr_test.cpp"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

"adb-remount-test.sh" = cc_prebuilt_binary {
    name = "adb-remount-test.sh";
    srcs = ["adb-remount-test.sh"];
    target = {
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = false;
        };
        android = {
            enabled = false;
        };
    };
    host_supported = true;
};

adb-remount-sh = sh_test {
    name = "adb-remount-sh";
    src = "adb-remount-test.sh";
    filename = "adb-remount-test.sh";
    test_suites = ["general-tests"];
    test_config = "adb-remount-sh.xml";
};

fs_mgr_vendor_overlay_test = java_test_host {
    name = "fs_mgr_vendor_overlay_test";

    srcs = ["src/com/android/tests/vendoroverlay/VendorOverlayHostTest.java"];

    libs = ["tradefed"];

    test_config = "vendor-overlay-test.xml";

    test_suites = ["general-tests"];
};

in { inherit "adb-remount-test.sh" adb-remount-sh fs_mgr_unit_test fs_mgr_vendor_overlay_test; }
