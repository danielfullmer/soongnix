{ android_test, cc_test_library }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

libdynamiclinker_native_lib_a = cc_test_library {
    name = "libdynamiclinker_native_lib_a";
    sdk_version = "current";
    srcs = ["native_lib_a.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    strip = {
        none = true;
    };
    stl = "libc++_static";
};

libdynamiclinker_native_lib_b = cc_test_library {
    name = "libdynamiclinker_native_lib_b";
    sdk_version = "current";
    srcs = ["native_lib_b.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    strip = {
        none = true;
    };
    stl = "libc++_static";
};

CtsDynamicLinkerTestCases = android_test {
    name = "CtsDynamicLinkerTestCases";
    defaults = ["cts_defaults"];
    static_libs = ["ctstestrunner-axt"];
    srcs = ["com/android/dynamiclinker/DynamicLinkerTest.java"];
    compile_multilib = "both";
    jni_libs = [
        "libdynamiclinker_native_lib_a"
        "libdynamiclinker_native_lib_b"
    ];
    manifest = "AndroidManifest.xml";
    sdk_version = "current";
    test_suites = [
        "cts"
        "vts10"
    ];
    use_embedded_native_libs = true;
};

in { inherit CtsDynamicLinkerTestCases libdynamiclinker_native_lib_a libdynamiclinker_native_lib_b; }
