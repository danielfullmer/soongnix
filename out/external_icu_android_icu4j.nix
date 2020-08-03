{ filegroup, java_test }:
let

#
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
#

# ==========================================================
#  build repackaged ICU for target
#
#  This is done in the libcore/JavaLibraries.mk file as there are circular
#  dependencies between ICU and libcore
# ==========================================================
android_icu4j_src_files = filegroup {
    name = "android_icu4j_src_files";
    srcs = ["src/main/java/**/*.java"];
};

android_icu4j_resources = filegroup {
    name = "android_icu4j_resources";
    srcs = ["resources/**/*"];
    path = "resources";
};

android_icu4j_src_files_for_docs = filegroup {
    name = "android_icu4j_src_files_for_docs";
    srcs = [
        "src/main/java/android/icu/lang/**/*.java"
        "src/main/java/android/icu/math/**/*.java"
        "src/main/java/android/icu/text/**/*.java"
        "src/main/java/android/icu/util/**/*.java"
    ];
};

# ==========================================================
#  build repackaged ICU tests
#
#  Target builds against core-libart and core-oj so that it can access all the
#  repackaged android.icu classes and methods and not just the ones available
#  through the Android API.
# ==========================================================
android-icu4j-tests = java_test {
    name = "android-icu4j-tests";

    srcs = [
        "src/main/tests/**/*.java"
        "testing/src/**/*.java"
    ];
    java_resource_dirs = [
        "src/main/tests"
        "testing/src"
    ];
    static_libs = [
        "junit"
        "junit-params"
    ];

    patch_module = "java.base";
    no_standard_libs = true;
    libs = [
        "core-all"
    ];
    system_modules = "core-all-system-modules";
};

in { inherit android-icu4j-tests android_icu4j_resources android_icu4j_src_files android_icu4j_src_files_for_docs; }
