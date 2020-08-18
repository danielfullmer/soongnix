{ cc_binary, cc_library_shared }:
let

/*
 * Copyright (C) 2016 The Android Open Source Project
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

"android.hardware.contexthub@1.0-impl" = cc_library_shared {
    name = "android.hardware.contexthub@1.0-impl";
    defaults = ["hidl_defaults"];
    proprietary = true;
    relative_install_path = "hw";
    srcs = ["Contexthub.cpp"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libhardware"
        "libbase"
        "libcutils"
        "libutils"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.contexthub@1.0"
    ];
};

"android.hardware.contexthub@1.0-service" = cc_binary {
    name = "android.hardware.contexthub@1.0-service";
    relative_install_path = "hw";
    proprietary = true;
    init_rc = ["android.hardware.contexthub@1.0-service.rc"];
    srcs = ["service.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "libdl"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "android.hardware.contexthub@1.0"
    ];
};

in { inherit "android.hardware.contexthub@1.0-impl" "android.hardware.contexthub@1.0-service"; }
