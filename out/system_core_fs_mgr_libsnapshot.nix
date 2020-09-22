{ cc_binary, cc_defaults, cc_library_headers, cc_library_static, cc_test, filegroup, vts_config }:
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
#

libsnapshot_defaults = cc_defaults {
    name = "libsnapshot_defaults";
    defaults = ["fs_mgr_defaults"];
    cflags = [
        "-D_FILE_OFFSET_BITS=64"
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
    ];
    static_libs = [
        "libdm"
        "libfstab"
        "update_metadata-protos"
    ];
    whole_static_libs = [
        "libext2_uuid"
        "libext4_utils"
        "libfstab"
    ];
    header_libs = [
        "libfiemap_headers"
    ];
    export_static_lib_headers = [
        "update_metadata-protos"
    ];
    export_header_lib_headers = [
        "libfiemap_headers"
    ];
    export_include_dirs = ["include"];
    proto = {
        type = "lite";
        export_proto_headers = true;
        canonical_path_from_root = false;
    };
};

libsnapshot_hal_deps = cc_defaults {
    name = "libsnapshot_hal_deps";
    cflags = [
        "-DLIBSNAPSHOT_USE_HAL"
    ];
    shared_libs = [
        "android.hardware.boot@1.0"
        "android.hardware.boot@1.1"
    ];
};

libsnapshot_sources = filegroup {
    name = "libsnapshot_sources";
    srcs = [
        "android/snapshot/snapshot.proto"
        "device_info.cpp"
        "snapshot.cpp"
        "snapshot_stats.cpp"
        "snapshot_metadata_updater.cpp"
        "partition_cow_creator.cpp"
        "return.cpp"
        "utility.cpp"
    ];
};

libsnapshot_headers = cc_library_headers {
    name = "libsnapshot_headers";
    recovery_available = true;
    defaults = ["libsnapshot_defaults"];
};

libsnapshot = cc_library_static {
    name = "libsnapshot";
    defaults = [
        "libsnapshot_defaults"
        "libsnapshot_hal_deps"
    ];
    srcs = [":libsnapshot_sources"];
    static_libs = [
        "libfs_mgr_binder"
    ];
};

libsnapshot_init = cc_library_static {
    name = "libsnapshot_init";
    defaults = ["libsnapshot_defaults"];
    srcs = [":libsnapshot_sources"];
    recovery_available = true;
    static_libs = [
        "libfs_mgr"
    ];
};

libsnapshot_nobinder = cc_library_static {
    name = "libsnapshot_nobinder";
    defaults = [
        "libsnapshot_defaults"
        "libsnapshot_hal_deps"
    ];
    srcs = [":libsnapshot_sources"];
    recovery_available = true;
    static_libs = [
        "libfs_mgr"
    ];
};

libsnapshot_test_helpers = cc_library_static {
    name = "libsnapshot_test_helpers";
    defaults = ["libsnapshot_defaults"];
    export_include_dirs = [
        "include_test"
    ];
    srcs = [
        "android/snapshot/snapshot.proto"
        "test_helpers.cpp"
    ];
    shared_libs = [
        "android.hardware.boot@1.1"
        "libcrypto"
    ];
    export_shared_lib_headers = [
        "android.hardware.boot@1.1"
    ];
    header_libs = [
        "libstorage_literals_headers"
    ];
    export_header_lib_headers = [
        "libstorage_literals_headers"
    ];
    static_libs = [
        "libfs_mgr"
        "libgmock"
        "libgtest"
    ];
};

libsnapshot_test_defaults = cc_defaults {
    name = "libsnapshot_test_defaults";
    defaults = ["libsnapshot_defaults"];
    srcs = [
        "partition_cow_creator_test.cpp"
        "snapshot_metadata_updater_test.cpp"
        "snapshot_test.cpp"
    ];
    shared_libs = [
        "libbinder"
        "libcrypto"
        "libhidlbase"
        "libprotobuf-cpp-lite"
        "libutils"
        "libz"
    ];
    static_libs = [
        "android.hardware.boot@1.0"
        "android.hardware.boot@1.1"
        "libfs_mgr"
        "libgsi"
        "libgmock"
        "liblp"
        "libsnapshot"
        "libsnapshot_test_helpers"
        "libsparse"
    ];
    header_libs = [
        "libstorage_literals_headers"
    ];
    test_suites = [
        "vts"
        "device-tests"
    ];
    test_min_api_level = 29;
    auto_gen_config = true;
    require_root = true;
};

vts_libsnapshot_test = cc_test {
    name = "vts_libsnapshot_test";
    defaults = ["libsnapshot_test_defaults"];
};

#  For VTS 10
VtsLibsnapshotTest = vts_config {
    name = "VtsLibsnapshotTest";
    test_config = "VtsLibsnapshotTest.xml";
};

snapshotctl = cc_binary {
    name = "snapshotctl";
    srcs = [
        "snapshotctl.cpp"
    ];
    static_libs = [
        "libfstab"
        "libsnapshot"
    ];
    shared_libs = [
        "android.hardware.boot@1.0"
        "android.hardware.boot@1.1"
        "libbase"
        "libbinder"
        "libext2_uuid"
        "libext4_utils"
        "libfs_mgr_binder"
        "libhidlbase"
        "liblog"
        "liblp"
        "libprotobuf-cpp-lite"
        "libstatslog"
        "libutils"
    ];
};

in { inherit VtsLibsnapshotTest libsnapshot libsnapshot_defaults libsnapshot_hal_deps libsnapshot_headers libsnapshot_init libsnapshot_nobinder libsnapshot_sources libsnapshot_test_defaults libsnapshot_test_helpers snapshotctl vts_libsnapshot_test; }
