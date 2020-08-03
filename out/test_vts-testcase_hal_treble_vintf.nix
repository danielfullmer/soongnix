{ cc_defaults, cc_test, vts_config }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

vts_treble_vintf_test_defaults = cc_defaults {
    name = "vts_treble_vintf_test_defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "libz"
    ];
    static_libs = [
        "libgmock"
        "libhidl-gen-hash"
        "libhidl-gen-utils"
        "libprocpartition"
        "libselinux"
        "libtinyxml2"
        "libvintf"
    ];
    group_static_libs = true;
    srcs = [
        "VtsTrebleVintfTestBase.cpp"
        "utils.cpp"
        "main.cpp"
    ];
};

#  Do similar tests as vts_treble_vintf_test from O-MR1 vendor image branch. The
#  test is modified to compile against latest libvintf.
#  VendorFrameworkCompatibility is removed because it has framework dependency.
vts_treble_vintf_test_o_mr1 = cc_test {
    name = "vts_treble_vintf_test_o_mr1";
    defaults = ["vts_treble_vintf_test_defaults"];
    srcs = [
        "vts_treble_vintf_test_o_mr1.cpp"
    ];
};

#  Test vendor image that has the highest target FCM version. This test binary
#  has no system XML dependencies.
vts_treble_vintf_vendor_test = cc_test {
    name = "vts_treble_vintf_vendor_test";
    defaults = ["vts_treble_vintf_test_defaults"];
    srcs = [
        "DeviceManifestTest.cpp"
        "DeviceMatrixTest.cpp"
        "SingleManifestTest.cpp"
    ];
};

#  Test a (potentially) compatible vendor image with framework dependency;
#  test the current framework.
vts_treble_vintf_framework_test = cc_test {
    name = "vts_treble_vintf_framework_test";
    defaults = ["vts_treble_vintf_test_defaults"];
    srcs = [
        "SingleManifestTest.cpp"
        "SystemVendorTest.cpp"
    ];
};

#  Tests everything.
#  Should not be used by VTS framework, but could be used for test development.
#  VTS framework should choose among the other test binaries defined above.
vts_treble_vintf_test_all = cc_test {
    name = "vts_treble_vintf_test_all";
    defaults = ["vts_treble_vintf_test_defaults"];
    srcs = [
        "DeviceManifestTest.cpp"
        "DeviceMatrixTest.cpp"
        "SingleManifestTest.cpp"
        "SystemVendorTest.cpp"
    ];
};

VtsTrebleVintfTestOMr1 = vts_config {
    name = "VtsTrebleVintfTestOMr1";
};

in { inherit VtsTrebleVintfTestOMr1 vts_treble_vintf_framework_test vts_treble_vintf_test_all vts_treble_vintf_test_defaults vts_treble_vintf_test_o_mr1 vts_treble_vintf_vendor_test; }
