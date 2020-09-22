{ cc_benchmark, cc_defaults, cc_library_shared, cc_test }:
let

#  Copyright (C) 2007 The Android Open Source Project
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
#  Definitions for building the native code needed for the core library.
#

#  Defaults that apply to all of the modules

core_native_default_flags = cc_defaults {
    name = "core_native_default_flags";
    host_supported = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    cppflags = ["-DU_USING_ICU_NAMESPACE=0"];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

core_native_default_libs = cc_defaults {
    name = "core_native_default_libs";

    shared_libs = [
        "libbase"
        "liblog"
        "libnativehelper"
    ];
};

libjavacore = cc_library_shared {
    name = "libjavacore";
    visibility = [
        "//art/build/apex"
    ];
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
    defaults = [
        "core_native_default_flags"
        "core_native_default_libs"
    ];
    srcs = [
        ":luni_native_srcs"
        "dalvik/src/main/native/org_apache_harmony_dalvik_NativeTestTarget.cpp"
    ];
    shared_libs = [
        "libandroidio"
        "libbase"
        "libcrypto"
        "libexpat"
        "libicuuc"
        "libicui18n"
        "libnativehelper"
        "libz"
    ];
    static_libs = [
        "libandroidicuinit"
        "libziparchive"
    ];
    target = {
        android = {
            cflags = [
                #  -DANDROID_LINK_SHARED_ICU4C to enable access to the full ICU4C.
                #  See external/icu/android_icu4c/include/uconfig_local.h
                #  for more information.
                "-DANDROID_LINK_SHARED_ICU4C"
            ];
        };
    };
};

libandroidio = cc_library_shared {
    name = "libandroidio";
    visibility = [
        "//art/build/apex"
        "//external/conscrypt"
    ];
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
        #  TODO(b/147813447) remove this. This is currently due to the 'runtime_libs'
        #  dependency from libjavacrypto in the conscrypt APEX.
        "com.android.conscrypt"
        "test_com.android.conscrypt"
    ];
    defaults = [
        "core_native_default_flags"
    ];
    shared_libs = [
        "liblog"
    ];
    srcs = [
        ":libandroidio_srcs"
    ];
    stubs = {
        symbol_file = "libandroidio.map.txt";
        versions = ["1"];
    };
};

libopenjdk_native_defaults = cc_defaults {
    name = "libopenjdk_native_defaults";
    defaults = [
        "core_native_default_flags"
        "core_native_default_libs"
    ];
    srcs = [":libopenjdk_native_srcs"];
    local_include_dirs = [
        "luni/src/main/native"
    ];
    cflags = [
        #  TODO(narayan): Prune down this list of exclusions once the underlying
        #  issues have been fixed. Most of these are small changes except for
        #  -Wunused-parameter.
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
        "-Wno-parentheses-equality"
        "-Wno-constant-logical-operand"
        "-Wno-sometimes-uninitialized"
    ];

    shared_libs = [
        "libandroidio"
        "libcrypto"
        "libicuuc"
        "libnativehelper"
        "libz"
    ];
    static_libs = ["libfdlibm"];

    target = {
        linux_glibc = {
            cflags = [ #  Sigh.
                "-D_LARGEFILE64_SOURCE"
                "-D_GNU_SOURCE"
                "-DLINUX"
                "-D__GLIBC__"
            ];
        };
        android = {
            cflags = [
                #  -DANDROID_LINK_SHARED_ICU4C to enable access to the full ICU4C.
                #  See external/icu/android_icu4c/include/uconfig_local.h
                #  for more information.
                "-DANDROID_LINK_SHARED_ICU4C"
            ];
            shared_libs = [
                "libdl_android"
            ];
        };
    };

    notice = "ojluni/NOTICE";
};

libopenjdk = cc_library_shared {
    name = "libopenjdk";
    visibility = [
        "//art/build/apex"
    ];
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
    defaults = ["libopenjdk_native_defaults"];
    shared_libs = [
        "libopenjdkjvm"
    ];
};

#  Debug version of libopenjdk. Depends on libopenjdkjvmd.
libopenjdkd = cc_library_shared {
    name = "libopenjdkd";
    visibility = [
        "//art/build/apex"
    ];
    apex_available = [
        "com.android.art.debug"
    ];
    defaults = ["libopenjdk_native_defaults"];
    shared_libs = [
        "libopenjdkjvmd"
    ];
};

#  Test JNI library.
libjavacoretests = cc_library_shared {
    name = "libjavacoretests";
    visibility = [
        "//art/build/sdk"
        "//cts/tests/libcore/luni"
    ];
    defaults = ["core_native_default_flags"];
    host_supported = true;

    srcs = [
        "luni/src/test/native/libcore_dalvik_system_JniTest.cpp"
        "luni/src/test/native/libcore_java_io_FileTest.cpp"
        "luni/src/test/native/libcore_java_lang_ThreadTest.cpp"
        "luni/src/test/native/libcore_java_nio_BufferTest.cpp"
        "luni/src/test/native/libcore_libcore_util_NativeAllocationRegistryTest.cpp"
    ];
    target = {
        android = {
            shared_libs = ["libnativehelper_compat_libc++"];
        };
        host = {
            shared_libs = ["libnativehelper"];
        };
    };

    strip = {
        keep_symbols = true;
    };
};

#  Set of gtest unit tests.
libjavacore-unit-tests = cc_test {
    name = "libjavacore-unit-tests";
    defaults = ["core_native_default_flags"];

    #  Add -fno-builtin so that the compiler doesn't attempt to inline
    #  memcpy calls that are not really aligned.
    cflags = ["-fno-builtin"];
    srcs = ["luni/src/test/native/libcore_io_Memory_test.cpp"];

    shared_libs = ["libnativehelper"];
};

#  Set of benchmarks for libjavacore functions.
libjavacore-benchmarks = cc_benchmark {
    name = "libjavacore-benchmarks";
    defaults = ["core_native_default_flags"];

    srcs = ["luni/src/benchmark/native/libcore_io_Memory_bench.cpp"];
    test_suites = ["device-tests"];

    shared_libs = ["libnativehelper"];
};

in { inherit core_native_default_flags core_native_default_libs libandroidio libjavacore libjavacore-benchmarks libjavacore-unit-tests libjavacoretests libopenjdk libopenjdk_native_defaults libopenjdkd; }
