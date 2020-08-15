{ cc_binary, cc_defaults, cc_library, cc_library_static, cc_test, filegroup }:
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

idmap2_defaults = cc_defaults {
    name = "idmap2_defaults";
    tidy = true;
    tidy_checks = [
        "modernize-*"
        "-modernize-avoid-c-arrays"
        "android-*"
        "misc-*"
        "readability-*"
    ];
    tidy_flags = [
        "-system-headers"
        "-warnings-as-errors=*"
    ];
};

libidmap2 = cc_library {
    name = "libidmap2";
    defaults = [
        "idmap2_defaults"
    ];
    host_supported = true;
    srcs = [
        "libidmap2/BinaryStreamVisitor.cpp"
        "libidmap2/CommandLineOptions.cpp"
        "libidmap2/FileUtils.cpp"
        "libidmap2/Idmap.cpp"
        "libidmap2/Policies.cpp"
        "libidmap2/PrettyPrintVisitor.cpp"
        "libidmap2/RawPrintVisitor.cpp"
        "libidmap2/ResourceUtils.cpp"
        "libidmap2/Result.cpp"
        "libidmap2/Xml.cpp"
        "libidmap2/ZipFile.cpp"
    ];
    export_include_dirs = ["include"];
    target = {
        android = {
            static = {
                enabled = false;
            };
            shared_libs = [
                "libandroidfw"
                "libbase"
                "libcutils"
                "libutils"
                "libziparchive"
            ];
        };
        host = {
            shared = {
                enabled = false;
            };
            static_libs = [
                "libandroidfw"
                "libbase"
                "libutils"
                "libziparchive"
            ];
        };
    };
};

idmap2_tests = cc_test {
    name = "idmap2_tests";
    defaults = [
        "idmap2_defaults"
    ];
    tidy_checks = [
        "-readability-magic-numbers"
    ];
    host_supported = true;
    test_suites = ["general-tests"];
    srcs = [
        "tests/BinaryStreamVisitorTests.cpp"
        "tests/CommandLineOptionsTests.cpp"
        "tests/FileUtilsTests.cpp"
        "tests/Idmap2BinaryTests.cpp"
        "tests/IdmapTests.cpp"
        "tests/Main.cpp"
        "tests/PoliciesTests.cpp"
        "tests/PrettyPrintVisitorTests.cpp"
        "tests/RawPrintVisitorTests.cpp"
        "tests/ResourceUtilsTests.cpp"
        "tests/ResultTests.cpp"
        "tests/XmlTests.cpp"
        "tests/ZipFileTests.cpp"
    ];
    required = [
        "idmap2"
    ];
    static_libs = ["libgmock"];
    target = {
        android = {
            shared_libs = [
                "libandroidfw"
                "libbase"
                "libidmap2"
                "liblog"
                "libutils"
                "libz"
                "libziparchive"
            ];
        };
        host = {
            static_libs = [
                "libandroidfw"
                "libbase"
                "libidmap2"
                "liblog"
                "libutils"
                "libziparchive"
            ];
            shared_libs = [
                "libz"
            ];
        };
    };
    data = [
        "tests/data/overlay/overlay-no-name-static.apk"
        "tests/data/overlay/overlay-no-name.apk"
        "tests/data/overlay/overlay-static-1.apk"
        "tests/data/overlay/overlay-static-2.apk"
        "tests/data/overlay/overlay.apk"
        "tests/data/signature-overlay/signature-overlay.apk"
        "tests/data/system-overlay/system-overlay.apk"
        "tests/data/system-overlay-invalid/system-overlay-invalid.apk"
        "tests/data/target/target-no-overlayable.apk"
        "tests/data/target/target.apk"
    ];
};

idmap2 = cc_binary {
    name = "idmap2";
    defaults = [
        "idmap2_defaults"
    ];
    host_supported = true;
    srcs = [
        "idmap2/Create.cpp"
        "idmap2/Dump.cpp"
        "idmap2/Lookup.cpp"
        "idmap2/Main.cpp"
        "idmap2/Scan.cpp"
        "idmap2/Verify.cpp"
    ];
    target = {
        android = {
            shared_libs = [
                "libandroidfw"
                "libbase"
                "libcutils"
                "libidmap2"
                "libutils"
                "libziparchive"
            ];
        };
        host = {
            static_libs = [
                "libandroidfw"
                "libbase"
                "libidmap2"
                "liblog"
                "libutils"
                "libziparchive"
            ];
            shared_libs = [
                "libz"
            ];
        };
    };
};

idmap2d = cc_binary {
    name = "idmap2d";
    defaults = [
        "idmap2_defaults"
    ];
    host_supported = false;
    srcs = [
        "idmap2d/Idmap2Service.cpp"
        "idmap2d/Main.cpp"
    ];
    shared_libs = [
        "libandroidfw"
        "libbase"
        "libbinder"
        "libcutils"
        "libidmap2"
        "libutils"
        "libziparchive"
    ];
    static_libs = [
        "libidmap2daidl"
    ];
    init_rc = ["idmap2d/idmap2d.rc"];
};

libidmap2daidl = cc_library_static {
    name = "libidmap2daidl";
    defaults = [
        "idmap2_defaults"
    ];
    tidy = false;
    host_supported = false;
    srcs = [
        ":idmap2_aidl"
    ];
    shared_libs = [
        "libbase"
    ];
    aidl = {
        export_aidl_headers = true;
    };
};

idmap2_aidl = filegroup {
    name = "idmap2_aidl";
    srcs = [
        "idmap2d/aidl/android/os/IIdmap2.aidl"
    ];
};

in { inherit idmap2 idmap2_aidl idmap2_defaults idmap2_tests idmap2d libidmap2 libidmap2daidl; }
