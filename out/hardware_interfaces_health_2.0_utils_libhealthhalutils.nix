{ cc_library_static }:
let

/*
 * Copyright (C) 2018 The Android Open Source Project
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

#  Convenience library for (hwbinder) clients to choose the correct health
#  service instance.
libhealthhalutils = cc_library_static {
    name = "libhealthhalutils";
    srcs = ["HealthHalUtils.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    vendor_available = true;
    recovery_available = true;
    export_include_dirs = ["include"];
    shared_libs = [
        "android.hardware.health@2.0"
        "libbase"
        "libhidlbase"
    ];
};

in { inherit libhealthhalutils; }
