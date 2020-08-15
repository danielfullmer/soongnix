{ cc_defaults, cc_test, cc_test_host }:
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

recovery_test_defaults = cc_defaults {
    name = "recovery_test_defaults";

    defaults = [
        "recovery_defaults"
    ];

    include_dirs = [
        "bootable/recovery"
    ];

    shared_libs = [
        "libbase"
        "libcrypto"
        "libcutils"
        "liblog"
        "libpng"
        "libprocessgroup"
        "libselinux"
        "libz"
        "libziparchive"
    ];

    target = {
        android = {
            shared_libs = [
                "libutils"
            ];
        };

        host = {
            static_libs = [
                "libutils"
            ];
        };
    };
};

#  libapplypatch, libapplypatch_modes, libimgdiff, libimgpatch
libapplypatch_static_libs = [
    "libapplypatch_modes"
    "libapplypatch"
    "libedify"
    "libimgdiff"
    "libimgpatch"
    "libotautil"
    "libbsdiff"
    "libbspatch"
    "libdivsufsort"
    "libdivsufsort64"
    "libutils"
    "libbase"
    "libbrotli"
    "libbz"
    "libcrypto"
    "libz"
    "libziparchive"
];

#  librecovery_defaults uses many shared libs that we want to avoid using in tests (e.g. we don't
#  have 32-bit android.hardware.health@2.0.so or libbootloader_message.so on marlin).
librecovery_static_libs = [
    "librecovery"
    "librecovery_fastboot"
    "libinstall"
    "librecovery_ui"
    "libminui"
    "libotautil"

    "libhealthhalutils"
    "libvintf_recovery"
    "libvintf"

    "android.hardware.health@2.0"
    "android.hardware.health@1.0"
    "libbootloader_message"
    "libext4_utils"
    "libfs_mgr"
    "libfusesideload"
    "libhidl-gen-utils"
    "libhidlbase"
    "libhidltransport"
    "libhwbinder_noltopgo"
    "libbinderthreadstate"
    "liblp"
    "libvndksupport"
    "libtinyxml2"
    "libc++fs"
];

recovery_unit_test = cc_test {
    name = "recovery_unit_test";
    isolated = true;

    defaults = [
        "recovery_test_defaults"
    ];

    test_suites = ["device-tests"];

    srcs = [
        "unit/applypatch_test.cpp"
        "unit/asn1_decoder_test.cpp"
        "unit/commands_test.cpp"
        "unit/dirutil_test.cpp"
        "unit/locale_test.cpp"
        "unit/minui_test.cpp"
        "unit/package_test.cpp"
        "unit/parse_install_logs_test.cpp"
        "unit/rangeset_test.cpp"
        "unit/resources_test.cpp"
        "unit/screen_ui_test.cpp"
        "unit/sysutil_test.cpp"
        "unit/zip_test.cpp"
    ];

    static_libs = libapplypatch_static_libs ++ [
        "libinstall"
        "librecovery_ui"
        "libminui"
        "libotautil"
        "libupdater"
        "libgtest_prod"
    ];

    data = [
        "testdata/battery_scale.png"
        "testdata/bonus.file"
        "testdata/boot.img"
        "testdata/deflate_src.zip"
        "testdata/deflate_tgt.zip"
        "testdata/fake-eocd.zip"
        "testdata/font.png"
        "testdata/gzipped_source"
        "testdata/gzipped_target"
        "testdata/loop00000.png"
        "testdata/otasigned_4096bits.zip"
        "testdata/otasigned_v1.zip"
        "testdata/otasigned_v2.zip"
        "testdata/otasigned_v3.zip"
        "testdata/otasigned_v4.zip"
        "testdata/otasigned_v5.zip"
        "testdata/random.zip"
        "testdata/recovery-from-boot-with-bonus.p"
        "testdata/recovery-from-boot.p"
        "testdata/recovery.img"
        "testdata/testkey_4096bits.x509.pem"
        "testdata/testkey_v1.pk8"
        "testdata/testkey_v1.txt"
        "testdata/testkey_v1.x509.pem"
        "testdata/testkey_v2.pk8"
        "testdata/testkey_v2.txt"
        "testdata/testkey_v2.x509.pem"
        "testdata/testkey_v3.pk8"
        "testdata/testkey_v3.txt"
        "testdata/testkey_v3.x509.pem"
        "testdata/testkey_v4.pk8"
        "testdata/testkey_v4.txt"
        "testdata/testkey_v4.x509.pem"
        "testdata/testkey_v5.pk8"
        "testdata/testkey_v5.txt"
        "testdata/testkey_v5.x509.pem"
        "testdata/ziptest_dummy-update.zip"
        "testdata/ziptest_valid.zip"
    ];
};

recovery_manual_test = cc_test {
    name = "recovery_manual_test";
    isolated = true;

    defaults = [
        "recovery_test_defaults"
    ];

    test_suites = ["device-tests"];

    srcs = [
        "manual/recovery_test.cpp"
    ];
};

recovery_component_test = cc_test {
    name = "recovery_component_test";
    isolated = true;

    defaults = [
        "recovery_test_defaults"
        "libupdater_defaults"
    ];

    test_suites = ["device-tests"];

    srcs = [
        "component/applypatch_modes_test.cpp"
        "component/bootloader_message_test.cpp"
        "component/edify_test.cpp"
        "component/imgdiff_test.cpp"
        "component/install_test.cpp"
        "component/resources_test.cpp"
        "component/sideload_test.cpp"
        "component/uncrypt_test.cpp"
        "component/update_verifier_test.cpp"
        "component/updater_test.cpp"
        "component/verifier_test.cpp"
    ];

    static_libs = libapplypatch_static_libs ++ librecovery_static_libs ++ [
        "libupdater"
        "libupdate_verifier"
        "libprotobuf-cpp-lite"
    ];

    data = [
        "testdata/battery_scale.png"
        "testdata/bonus.file"
        "testdata/boot.img"
        "testdata/deflate_src.zip"
        "testdata/deflate_tgt.zip"
        "testdata/fake-eocd.zip"
        "testdata/font.png"
        "testdata/gzipped_source"
        "testdata/gzipped_target"
        "testdata/loop00000.png"
        "testdata/otasigned_4096bits.zip"
        "testdata/otasigned_v1.zip"
        "testdata/otasigned_v2.zip"
        "testdata/otasigned_v3.zip"
        "testdata/otasigned_v4.zip"
        "testdata/otasigned_v5.zip"
        "testdata/random.zip"
        "testdata/recovery-from-boot-with-bonus.p"
        "testdata/recovery-from-boot.p"
        "testdata/recovery.img"
        "testdata/testkey_4096bits.x509.pem"
        "testdata/testkey_v1.pk8"
        "testdata/testkey_v1.txt"
        "testdata/testkey_v1.x509.pem"
        "testdata/testkey_v2.pk8"
        "testdata/testkey_v2.txt"
        "testdata/testkey_v2.x509.pem"
        "testdata/testkey_v3.pk8"
        "testdata/testkey_v3.txt"
        "testdata/testkey_v3.x509.pem"
        "testdata/testkey_v4.pk8"
        "testdata/testkey_v4.txt"
        "testdata/testkey_v4.x509.pem"
        "testdata/testkey_v5.pk8"
        "testdata/testkey_v5.txt"
        "testdata/testkey_v5.x509.pem"
        "testdata/ziptest_dummy-update.zip"
        "testdata/ziptest_valid.zip"
        ":res-testdata"
    ];
};

recovery_host_test = cc_test_host {
    name = "recovery_host_test";
    isolated = true;

    defaults = [
        "recovery_test_defaults"
    ];

    srcs = [
        "component/imgdiff_test.cpp"
    ];

    static_libs = [
        "libimgdiff"
        "libimgpatch"
        "libotautil"
        "libbsdiff"
        "libbspatch"
        "libziparchive"
        "libutils"
        "libcrypto"
        "libbrotli"
        "libbz"
        "libdivsufsort64"
        "libdivsufsort"
        "libz"
    ];

    data = [
        "testdata/battery_scale.png"
        "testdata/bonus.file"
        "testdata/boot.img"
        "testdata/deflate_src.zip"
        "testdata/deflate_tgt.zip"
        "testdata/fake-eocd.zip"
        "testdata/font.png"
        "testdata/gzipped_source"
        "testdata/gzipped_target"
        "testdata/loop00000.png"
        "testdata/otasigned_4096bits.zip"
        "testdata/otasigned_v1.zip"
        "testdata/otasigned_v2.zip"
        "testdata/otasigned_v3.zip"
        "testdata/otasigned_v4.zip"
        "testdata/otasigned_v5.zip"
        "testdata/random.zip"
        "testdata/recovery-from-boot-with-bonus.p"
        "testdata/recovery-from-boot.p"
        "testdata/recovery.img"
        "testdata/testkey_4096bits.x509.pem"
        "testdata/testkey_v1.pk8"
        "testdata/testkey_v1.txt"
        "testdata/testkey_v1.x509.pem"
        "testdata/testkey_v2.pk8"
        "testdata/testkey_v2.txt"
        "testdata/testkey_v2.x509.pem"
        "testdata/testkey_v3.pk8"
        "testdata/testkey_v3.txt"
        "testdata/testkey_v3.x509.pem"
        "testdata/testkey_v4.pk8"
        "testdata/testkey_v4.txt"
        "testdata/testkey_v4.x509.pem"
        "testdata/testkey_v5.pk8"
        "testdata/testkey_v5.txt"
        "testdata/testkey_v5.x509.pem"
        "testdata/ziptest_dummy-update.zip"
        "testdata/ziptest_valid.zip"
    ];

    target = {
        darwin = {
            #  libimgdiff is not available on the Mac.
            enabled = false;
        };
    };
};

in { inherit recovery_component_test recovery_host_test recovery_manual_test recovery_test_defaults recovery_unit_test; }
