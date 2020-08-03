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

#  Provides C++ wrappers for system services.

libservices = cc_library_shared {
    name = "libservices";
    srcs = [
        ":IDropBoxManagerService.aidl"
        "src/content/ComponentName.cpp"
        "src/os/DropBoxManager.cpp"
        "src/os/StatsDimensionsValue.cpp"
        "src/os/StatsLogEventWrapper.cpp"
    ];

    shared_libs = [
        "libbinder"
        "liblog"
        "libcutils"
        "libutils"
    ];
    header_libs = [
        "libbase_headers"
    ];
    aidl = {
        include_dirs = ["frameworks/base/core/java/"];
    };

    export_include_dirs = ["include"];
    export_header_lib_headers = ["libbase_headers"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit libservices; }
