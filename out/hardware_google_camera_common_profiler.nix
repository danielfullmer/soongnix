{ cc_library_shared }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
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

lib_profiler = cc_library_shared {
    name = "lib_profiler";

    srcs = [
        "profiler.cc"
    ];

    include_dirs = ["."];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
        "libutils"
    ];

    export_include_dirs = ["."];

    owner = "google";
    vendor_available = true;
};

in { inherit lib_profiler; }
