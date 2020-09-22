{ cc_binary }:
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

"android.hardware.contexthub@1.1-service.mock" = cc_binary {
    name = "android.hardware.contexthub@1.1-service.mock";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    init_rc = ["android.hardware.contexthub@1.1-service.rc"];
    srcs = [
        "Contexthub.cpp"
        "service.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "android.hardware.contexthub@1.0"
        "android.hardware.contexthub@1.1"
        "libbase"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    vintf_fragments = ["android.hardware.contexthub@1.1.xml"];
};

in { inherit "android.hardware.contexthub@1.1-service.mock"; }
