{ android_test_helper_app, cc_test_library }:
let

#  Copyright (C) 2020 Google Inc.
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

libuncompressednativeincrementaltest = cc_test_library {
    name = "libuncompressednativeincrementaltest";
    sdk_version = "current"; #  Oreo
    cppflags = ["-std=c++11"];
    srcs = ["src/cpp/uncompressednative_lib.cpp"];
    stl = "c++_static";
};

IncrementalTestAppUncompressedNativeLib = android_test_helper_app {
    name = "IncrementalTestAppUncompressedNativeLib";
    sdk_version = "current";
    jni_libs = ["libuncompressednativeincrementaltest"];
    test_suites = [
        "general-tests"
    ];
    v4_signature = true;
    compile_multilib = "both";
    export_package_resources = true;
    aapt_include_all_resources = true;
    libs = ["IncrementalTestApp"];
    aaptflags = [
        "--rename-manifest-package android.incrementalinstall.incrementaltestapp"
        "--package-id 0x83"
    ];
    use_embedded_native_libs = true;
};

in { inherit IncrementalTestAppUncompressedNativeLib libuncompressednativeincrementaltest; }