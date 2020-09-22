{ cc_benchmark, cc_binary, cc_defaults, cc_fuzz, cc_library, cc_test, sh_test }:
let

#
#  Copyright (C) 2013 The Android Open Source Project
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

libziparchive_flags = cc_defaults {
    name = "libziparchive_flags";
    cflags = [
        #  ZLIB_CONST turns on const for input buffers, which is pretty standard.
        "-DZLIB_CONST"
        "-Werror"
        "-Wall"
        "-D_FILE_OFFSET_BITS=64"
    ];
    cppflags = [
        #  Incorrectly warns when C++11 empty brace {} initializer is used.
        #  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61489
        "-Wno-missing-field-initializers"
        "-Wconversion"
        "-Wno-sign-conversion"
    ];

    #  Enable -Wold-style-cast only for non-Windows targets.  _islower_l,
    #  _isupper_l etc. in MinGW locale_win32.h (included from
    #  libcxx/include/__locale) has an old-style-cast.
    target = {
        not_windows = {
            cppflags = [
                "-Wold-style-cast"
            ];
        };
    };
    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
            "shift"
            "integer-divide-by-zero"
            "implicit-signed-integer-truncation"
            #  TODO: Fix crash when we enable this option
            #  "implicit-unsigned-integer-truncation",
            #  TODO: not tested yet.
            #  "implicit-integer-sign-change",
        ];
    };
};

libziparchive_defaults = cc_defaults {
    name = "libziparchive_defaults";
    srcs = [
        "zip_archive.cc"
        "zip_archive_stream_entry.cc"
        "zip_writer.cc"
    ];

    target = {
        windows = {
            cflags = ["-mno-ms-bitfields"];

            enabled = true;
        };
    };

    shared_libs = [
        "libbase"
        "liblog"
    ];

    #  for FRIEND_TEST
    static_libs = ["libgtest_prod"];
    export_static_lib_headers = ["libgtest_prod"];

    export_include_dirs = ["include"];
};

libziparchive = cc_library {
    name = "libziparchive";
    host_supported = true;
    vendor_available = true;
    recovery_available = true;
    native_bridge_supported = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    export_shared_lib_headers = ["libbase"];

    defaults = [
        "libziparchive_defaults"
        "libziparchive_flags"
    ];
    shared_libs = [
        "liblog"
        "libbase"
        "libz"
    ];
    target = {
        linux_bionic = {
            enabled = true;
        };
    };

    apex_available = [
        "//apex_available:platform"
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

#  Tests.
ziparchive-tests = cc_test {
    name = "ziparchive-tests";
    host_supported = true;
    defaults = ["libziparchive_flags"];

    data = [
        "testdata/bad_crc.zip"
        "testdata/bad_filename.zip"
        "testdata/crash.apk"
        "testdata/declaredlength.zip"
        "testdata/dummy-update.zip"
        "testdata/empty.zip"
        "testdata/large.zip"
        "testdata/valid.zip"
        "testdata/zero-size-cd.zip"
    ];

    srcs = [
        "entry_name_utils_test.cc"
        "zip_archive_test.cc"
        "zip_writer_test.cc"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];

    static_libs = [
        "libziparchive"
        "libz"
        "libutils"
    ];

    target = {
        host = {
            cppflags = ["-Wno-unnamed-type-template-args"];
        };
        windows = {
            enabled = true;
        };
    };
    test_suites = ["device-tests"];
};

#  Performance benchmarks.
ziparchive-benchmarks = cc_benchmark {
    name = "ziparchive-benchmarks";
    defaults = ["libziparchive_flags"];

    srcs = [
        "zip_archive_benchmark.cpp"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];

    static_libs = [
        "libziparchive"
        "libz"
        "libutils"
    ];

    target = {
        host = {
            cppflags = ["-Wno-unnamed-type-template-args"];
        };
    };
};

ziptool = cc_binary {
    name = "ziptool";
    defaults = ["libziparchive_flags"];
    srcs = ["ziptool.cpp"];
    shared_libs = [
        "libbase"
        "libziparchive"
    ];
    recovery_available = true;
    host_supported = true;
    target = {
        android = {
            symlinks = [
                "unzip"
                "zipinfo"
            ];
        };
    };
};

libziparchive_fuzzer = cc_fuzz {
    name = "libziparchive_fuzzer";
    srcs = ["libziparchive_fuzzer.cpp"];
    static_libs = [
        "libziparchive"
        "libbase"
        "libz"
        "liblog"
    ];
    host_supported = true;
    corpus = ["testdata/*"];
};

ziptool-tests = sh_test {
    name = "ziptool-tests";
    src = "run-ziptool-tests-on-android.sh";
    filename = "run-ziptool-tests-on-android.sh";
    test_suites = ["general-tests"];
    host_supported = true;
    device_supported = false;
    test_config = "ziptool-tests.xml";
    data = [
        "cli-tests/files/"
        "cli-tests/unzip.test"
        "cli-tests/zipinfo.test"
        "cli-tests/files/example.zip"
    ];
    target_required = [
        "cli-test"
        "ziptool"
    ];
};

in { inherit libziparchive libziparchive_defaults libziparchive_flags libziparchive_fuzzer ziparchive-benchmarks ziparchive-tests ziptool ziptool-tests; }
