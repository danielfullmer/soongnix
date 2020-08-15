{ cc_library_shared }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

libvibrator = cc_library_shared {
    name = "libvibrator";

    shared_libs = [
        "libbinder"
        "liblog"
        "libutils"
    ];

    header_libs = [
        "libaudio_system_headers"
    ];

    aidl = {
        include_dirs = ["frameworks/base/core/java"];
        local_include_dirs = ["include/"];
        export_aidl_headers = true;
    };

    srcs = [
        ":libvibrator_aidl"
        "ExternalVibration.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-unused-variable"
        "-Wno-unused-parameter"
    ];

    export_include_dirs = ["include"];
};

in { inherit libvibrator; }
