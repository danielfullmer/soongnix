{ android_test, cc_test_library }:
let

#  Copyright (C) 2009 The Android Open Source Project
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

CtsJniTestCases = android_test {
    name = "CtsJniTestCases";
    defaults = ["cts_defaults"];
    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";
    #  When built, explicitly put it in the data partition.
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "androidx.test.rules"
    ];
    jni_libs = [
        "libjni_test_dlclose"
        "libjninamespacea1"
        "libjninamespacea2"
        "libjninamespaceb"
        "libjnicommon"
        "libjnitest"
        "libnativehelper_compat_libc++"
    ];
    srcs = [
        "src/android/jni/cts/BasicLoaderTestHelper.java"
        "src/android/jni/cts/ClassLoaderHelper.java"
        "src/android/jni/cts/ClassLoaderStaticNonce.java"
        "src/android/jni/cts/InstanceFromNative.java"
        "src/android/jni/cts/InstanceNonce.java"
        "src/android/jni/cts/JniCTest.java"
        "src/android/jni/cts/JniCppTest.java"
        "src/android/jni/cts/JniInstanceTest.java"
        "src/android/jni/cts/JniStaticTest.java"
        "src/android/jni/cts/JniTestCase.java"
        "src/android/jni/cts/LinkerNamespacesHelper.java"
        "src/android/jni/cts/StaticFromNative.java"
        "src/android/jni/cts/StaticNonce.java"
    ];
    sdk_version = "test_current";
    use_embedded_native_libs = false;
};

libjninamespacea1 = cc_test_library {
    name = "libjninamespacea1";
    srcs = ["libjninamespacea1/namespacea1.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    local_include_dirs = ["libjnicommon"];
    host_ldlibs = ["-llog"];
    shared_libs = [
        "liblog"
        "libjnicommon"
    ];
    sdk_version = "23";
    gtest = false;
};

libjninamespacea2 = cc_test_library {
    name = "libjninamespacea2";
    srcs = ["libjninamespacea2/namespacea2.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    local_include_dirs = ["libjnicommon"];
    host_ldlibs = ["-llog"];
    shared_libs = [
        "liblog"
        "libjnicommon"
    ];
    sdk_version = "23";
    gtest = false;
};

libjninamespaceb = cc_test_library {
    name = "libjninamespaceb";
    srcs = ["libjninamespaceb/namespaceb.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    local_include_dirs = ["libjnicommon"];
    host_ldlibs = ["-llog"];
    shared_libs = [
        "liblog"
        "libjnicommon"
    ];
    sdk_version = "23";
    gtest = false;
};

in { inherit CtsJniTestCases libjninamespacea1 libjninamespacea2 libjninamespaceb; }
