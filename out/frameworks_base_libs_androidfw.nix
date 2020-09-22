{ cc_benchmark, cc_defaults, cc_library, cc_test }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

#  libandroidfw is partially built for the host (used by obbtool, aapt, and others)

libandroidfw_defaults = cc_defaults {
    name = "libandroidfw_defaults";
    cflags = [
        "-Werror"
        "-Wunreachable-code"
    ];
    target = {
        windows = {
            #  The Windows compiler warns incorrectly for value initialization with {}.
            cppflags = ["-Wno-missing-field-initializers"];
        };
        host = {
            cflags = ["-DSTATIC_ANDROIDFW_FOR_TOOLS"];
        };
    };
};

libandroidfw = cc_library {
    name = "libandroidfw";
    defaults = ["libandroidfw_defaults"];
    host_supported = true;
    srcs = [
        "ApkAssets.cpp"
        "Asset.cpp"
        "AssetDir.cpp"
        "AssetManager.cpp"
        "AssetManager2.cpp"
        "AttributeResolution.cpp"
        "ChunkIterator.cpp"
        "ConfigDescription.cpp"
        "Idmap.cpp"
        "LoadedArsc.cpp"
        "Locale.cpp"
        "LocaleData.cpp"
        "misc.cpp"
        "ObbFile.cpp"
        "PosixUtils.cpp"
        "ResourceTypes.cpp"
        "ResourceUtils.cpp"
        "StreamingZipInflater.cpp"
        "TypeWrappers.cpp"
        "Util.cpp"
        "ZipFileRO.cpp"
        "ZipUtils.cpp"
    ];
    export_include_dirs = ["include"];
    export_shared_lib_headers = ["libz"];
    target = {
        android = {
            srcs = [
                "BackupData.cpp"
                "BackupHelpers.cpp"
                "CursorWindow.cpp"
            ];
            shared_libs = [
                "libziparchive"
                "libbase"
                "libbinder"
                "liblog"
                "libcutils"
                "libutils"
                "libz"
            ];
            static = {
                enabled = false;
            };
        };
        host = {
            shared = {
                enabled = false;
            };
            static_libs = [
                "libziparchive"
                "libbase"
                "liblog"
                "libcutils"
                "libutils"
            ];
            shared_libs = [
                "libz"
            ];
        };
        windows = {
            enabled = true;
        };
    };
    sanitize = {
        blacklist = "libandroidfw_blacklist.txt";
    };
};

common_test_libs = [
    "libandroidfw"
    "libbase"
    "libcutils"
    "libutils"
    "libziparchive"
];

libandroidfw_tests = cc_test {
    name = "libandroidfw_tests";
    host_supported = true;
    defaults = ["libandroidfw_defaults"];
    cppflags = [
        #  This is to suppress warnings/errors from gtest
        "-Wno-unnamed-type-template-args"
    ];
    srcs = [
        #  Helpers/infra for testing.
        "tests/CommonHelpers.cpp"
        "tests/TestHelpers.cpp"
        "tests/TestMain.cpp"

        #  Actual tests.
        "tests/ApkAssets_test.cpp"
        "tests/AppAsLib_test.cpp"
        "tests/Asset_test.cpp"
        "tests/AssetManager2_test.cpp"
        "tests/AttributeFinder_test.cpp"
        "tests/AttributeResolution_test.cpp"
        "tests/ByteBucketArray_test.cpp"
        "tests/Config_test.cpp"
        "tests/ConfigDescription_test.cpp"
        "tests/ConfigLocale_test.cpp"
        "tests/DynamicRefTable_test.cpp"
        "tests/Idmap_test.cpp"
        "tests/LoadedArsc_test.cpp"
        "tests/Locale_test.cpp"
        "tests/ResourceUtils_test.cpp"
        "tests/ResTable_test.cpp"
        "tests/Split_test.cpp"
        "tests/StringPiece_test.cpp"
        "tests/Theme_test.cpp"
        "tests/TypeWrappers_test.cpp"
        "tests/ZipUtils_test.cpp"
    ];
    static_libs = ["libgmock"];
    target = {
        android = {
            srcs = [
                "tests/BackupData_test.cpp"
                "tests/ObbFile_test.cpp"
                "tests/PosixUtils_test.cpp"
            ];
            shared_libs = common_test_libs ++ ["libui"];
        };
        host = {
            static_libs = common_test_libs ++ [
                "liblog"
                "libz"
            ];
        };
    };
    data = [
        "tests/data/app/app.apk"
        "tests/data/appaslib/appaslib.apk"
        "tests/data/appaslib/appaslib_lib.apk"
        "tests/data/basic/basic.apk"
        "tests/data/basic/basic_de_fr.apk"
        "tests/data/basic/basic_hdpi-v4.apk"
        "tests/data/basic/basic_xhdpi-v4.apk"
        "tests/data/basic/basic_xxhdpi-v4.apk"
        "tests/data/feature/feature.apk"
        "tests/data/length_decode/length_decode_invalid.apk"
        "tests/data/length_decode/length_decode_valid.apk"
        "tests/data/lib_one/lib_one.apk"
        "tests/data/lib_two/lib_two.apk"
        "tests/data/libclient/libclient.apk"
        "tests/data/out_of_order_types/out_of_order_types.apk"
        "tests/data/overlay/overlay.apk"
        "tests/data/overlayable/overlayable.apk"
        "tests/data/sparse/not_sparse.apk"
        "tests/data/sparse/sparse.apk"
        "tests/data/styles/styles.apk"
        "tests/data/system/system.apk"
        "tests/data/loader/resources.arsc"
        "tests/data/overlay/overlay.idmap"
    ];
    test_suites = ["device-tests"];
};

libandroidfw_benchmarks = cc_benchmark {
    name = "libandroidfw_benchmarks";
    defaults = ["libandroidfw_defaults"];
    srcs = [
        #  Helpers/infra for benchmarking.
        "tests/BenchMain.cpp"
        "tests/BenchmarkHelpers.cpp"
        "tests/CommonHelpers.cpp"

        #  Actual benchmarks.
        "tests/AssetManager2_bench.cpp"
        "tests/AttributeResolution_bench.cpp"
        "tests/SparseEntry_bench.cpp"
        "tests/Theme_bench.cpp"
    ];
    shared_libs = common_test_libs;
    data = [
        "tests/data/app/app.apk"
        "tests/data/appaslib/appaslib.apk"
        "tests/data/appaslib/appaslib_lib.apk"
        "tests/data/basic/basic.apk"
        "tests/data/basic/basic_de_fr.apk"
        "tests/data/basic/basic_hdpi-v4.apk"
        "tests/data/basic/basic_xhdpi-v4.apk"
        "tests/data/basic/basic_xxhdpi-v4.apk"
        "tests/data/feature/feature.apk"
        "tests/data/length_decode/length_decode_invalid.apk"
        "tests/data/length_decode/length_decode_valid.apk"
        "tests/data/lib_one/lib_one.apk"
        "tests/data/lib_two/lib_two.apk"
        "tests/data/libclient/libclient.apk"
        "tests/data/out_of_order_types/out_of_order_types.apk"
        "tests/data/overlay/overlay.apk"
        "tests/data/overlayable/overlayable.apk"
        "tests/data/sparse/not_sparse.apk"
        "tests/data/sparse/sparse.apk"
        "tests/data/styles/styles.apk"
        "tests/data/system/system.apk"
    ];
};

in { inherit libandroidfw libandroidfw_benchmarks libandroidfw_defaults libandroidfw_tests; }
