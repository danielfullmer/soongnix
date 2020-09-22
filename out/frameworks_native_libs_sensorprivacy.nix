{ cc_library_shared, filegroup }:
let

#  Copyright 2018 The Android Open Source Project
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

libsensorprivacy = cc_library_shared {
    name = "libsensorprivacy";

    aidl = {
        export_aidl_headers = true;
        local_include_dirs = ["aidl"];
    };

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wzero-as-null-pointer-constant"
    ];

    srcs = [
        ":libsensorprivacy_aidl"
        "SensorPrivacyManager.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libcutils"
        "libutils"
        "liblog"
        "libhardware"
    ];

    export_include_dirs = ["include"];

    export_shared_lib_headers = ["libbinder"];
};

libsensorprivacy_aidl = filegroup {
    name = "libsensorprivacy_aidl";
    srcs = [
        "aidl/android/hardware/ISensorPrivacyListener.aidl"
        "aidl/android/hardware/ISensorPrivacyManager.aidl"
    ];
    path = "aidl";
};

in { inherit libsensorprivacy libsensorprivacy_aidl; }
