{ cc_library }:
let

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

libctssecurity_jni = cc_library {
    name = "libctssecurity_jni";
    srcs = [
        "CtsSecurityJniOnLoad.cpp"
        "android_security_cts_LinuxRngTest.cpp"
        "android_security_cts_NativeCodeTest.cpp"
        "android_security_cts_MMapExecutableTest.cpp"
        "android_security_cts_EncryptionTest.cpp"
    ];
    shared_libs = [
        "libcrypto"
        "liblog"
        "libnativehelper_compat_libc++"
    ];
    static_libs = [
        "cpufeatures"
        "libcutils"
    ];
};

libcve_2019_2213_jni = cc_library {
    name = "libcve_2019_2213_jni";
    srcs = [
        "android_security_cts_cve_2019_2213_Test.c"
    ];
    shared_libs = [
        "libnativehelper_compat_libc++"
    ];
    static_libs = [
        "cpufeatures"
        "libcutils"
    ];
    cflags = [
        "-Werror"
        "-Wpointer-arith"
        "-Wno-unused-parameter"
        "-Wno-sign-compare"
        "-Wno-unused-label"
        "-Wno-unused-variable"
    ];
};

in { inherit libctssecurity_jni libcve_2019_2213_jni; }
