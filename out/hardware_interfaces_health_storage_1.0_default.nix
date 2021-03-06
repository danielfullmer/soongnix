{ cc_binary }:
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

"android.hardware.health.storage@1.0-service" = cc_binary {
    name = "android.hardware.health.storage@1.0-service";
    vendor = true;
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    init_rc = ["android.hardware.health.storage@1.0-service.rc"];
    srcs = [
        "Storage.cpp"
        "service.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "android.hardware.health.storage@1.0"
    ];

    static_libs = [
        "libfstab"
    ];

    vintf_fragments = [
        "manifest_android.hardware.health.storage@1.0.xml"
    ];
};

in { inherit "android.hardware.health.storage@1.0-service"; }
