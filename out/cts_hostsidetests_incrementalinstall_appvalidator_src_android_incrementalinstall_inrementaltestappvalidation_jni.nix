{ cc_test_library }:
let

/*
 * Copyright (C) 2020 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

libpath_checker_jni = cc_test_library {
    name = "libpath_checker_jni";
    cpp_std = "c++2a";
    gtest = false;
    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
        "-Wno-unused-parameter"
    ];
    srcs = [
        "path_checker.cpp"
    ];
    shared_libs = [
        "libbase"
        "libincfs"
    ];
};

in { inherit libpath_checker_jni; }