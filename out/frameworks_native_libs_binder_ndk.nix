{ cc_defaults, cc_library }:
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

#  TODO(b/31559095): bionic on host should define this
libbinder_ndk_host_user = cc_defaults {
    name = "libbinder_ndk_host_user";
    target = {
        host = {
            cflags = [
                "-D__INTRODUCED_IN(n)="
                "-D__assert(a,b,c)="
                #  We want all the APIs to be available on the host.
                "-D__ANDROID_API__=10000"
            ];
        };
    };
};

libbinder_ndk = cc_library {
    name = "libbinder_ndk";

    defaults = ["libbinder_ndk_host_user"];
    host_supported = true;

    export_include_dirs = [
        "include_ndk"
        "include_platform"
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
        "parcel_jni.cpp"
        "process.cpp"
        "stability.cpp"
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

    target = {
        android = {
            #  Only one copy of this library on an Android device
            static = {
                enabled = false;
            };
        };
        linux = {
            version_script = "libbinder_ndk.map.txt";
        };
    };
    stubs = {
        symbol_file = "libbinder_ndk.map.txt";
        versions = [
            "29"
            "30"
        ];
    };
};

in { inherit libbinder_ndk libbinder_ndk_host_user; }
