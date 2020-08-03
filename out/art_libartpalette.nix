{ art_cc_library, art_cc_test, cc_defaults }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

libartpalette_defaults = cc_defaults {
    name = "libartpalette_defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    export_include_dirs = ["include"];
};

#  libartpalette-system is the implementation of the abstraction layer. It is
#  only available as a shared library on Android.
libartpalette-system = art_cc_library {
    name = "libartpalette-system";
    defaults = ["libartpalette_defaults"];
    compile_multilib = "both";
    target = {
        android = {
            srcs = ["system/palette_android.cc"];
            header_libs = ["libbase_headers"];
            shared_libs = [
                "libbase"
                "libcutils"
                "liblog"
                "libprocessgroup"
                "libtombstoned_client"
            ];
        };
        host = {
            header_libs = ["libbase_headers"];
            srcs = ["system/palette_fake.cc"];
            shared_libs = ["libbase"];
        };
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = false;
        };
    };
    static = {
        enabled = false;
    };
    version_script = "libartpalette.map.txt";
};

#  libartpalette is the dynamic loader of the platform abstraction
#  layer. It is only used on Android. For other targets, it just
#  implements a fake platform implementation.
libartpalette = art_cc_library {
    name = "libartpalette";
    defaults = ["libartpalette_defaults"];
    required = ["libartpalette-system"]; #  libartpalette.so dlopen()'s libartpalette-system.
    header_libs = ["libbase_headers"];
    target = {
        #  Targets supporting dlopen build the client library which loads
        #  and binds the methods in the libartpalette-system library.
        android = {
            srcs = ["apex/palette.cc"];
            shared = {
                shared_libs = ["liblog"];
            };
            static = {
                static_libs = ["liblog"];
            };
            version_script = "libartpalette.map.txt";
        };
        linux_bionic = {
            header_libs = ["libbase_headers"];
            srcs = ["system/palette_fake.cc"];
            shared = {
                shared_libs = [
                    "libbase"
                    "liblog"
                ];
            };
            version_script = "libartpalette.map.txt";
        };
        linux_glibc = {
            header_libs = ["libbase_headers"];
            srcs = ["system/palette_fake.cc"];
            shared = {
                shared_libs = [
                    "libbase"
                    "liblog"
                ];
            };
            version_script = "libartpalette.map.txt";
        };
        #  Targets without support for dlopen just use the sources for
        #  the system library which actually implements functionality.
        darwin = {
            enabled = true;
            header_libs = ["libbase_headers"];
            srcs = ["system/palette_fake.cc"];
            static_libs = [
                "libbase"
                "liblog"
            ];
        };
        windows = {
            enabled = true;
            header_libs = ["libbase_headers"];
            srcs = ["system/palette_fake.cc"];
            static_libs = [
                "libbase"
                "liblog"
            ];
        };
    };
};

art_libartpalette_tests = art_cc_test {
    name = "art_libartpalette_tests";
    defaults = ["art_gtest_defaults"];
    host_supported = true;
    srcs = ["apex/palette_test.cc"];
    shared_libs = ["libartpalette"];
    test_per_src = true;
};

in { inherit art_libartpalette_tests libartpalette libartpalette-system libartpalette_defaults; }
