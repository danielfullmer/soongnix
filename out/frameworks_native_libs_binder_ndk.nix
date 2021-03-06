{ cc_library }:
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

libbinder_ndk = cc_library {
    name = "libbinder_ndk";
    vendor_available = true;

    export_include_dirs = [
        "include_ndk"
        "include_apex"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    srcs = [
        "ibinder.cpp"
        "ibinder_jni.cpp"
        "parcel.cpp"
        "process.cpp"
        "status.cpp"
        "service_manager.cpp"
    ];

    shared_libs = [
        "libandroid_runtime_lazy"
        "libbase"
        "libbinder"
        "libutils"
    ];

    header_libs = [
        "jni_headers"
    ];
    export_header_lib_headers = [
        "jni_headers"
    ];

    version_script = "libbinder_ndk.map.txt";
    stubs = {
        symbol_file = "libbinder_ndk.map.txt";
        versions = ["29"];
    };
};

in { inherit libbinder_ndk; }
