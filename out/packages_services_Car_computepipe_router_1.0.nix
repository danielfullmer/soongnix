{ cc_binary, cc_library }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

"android.automotive.computepipe.router@1.0-impl" = cc_library {
    name = "android.automotive.computepipe.router@1.0-impl";
    vendor_available = true;
    srcs = [
        "PipeClient.cpp"
        "PipeRunner.cpp"
        "PipeRegistration.cpp"
        "PipeQuery.cpp"
        "RemoteState.cpp"
    ];
    cflags = ["-DLOG_TAG=\"ComputepipeRouter\""] ++
        [
            "-Wall"
            "-Werror"
            "-Wextra"
            "-Wno-unused-parameter"
        ];
    header_libs = [
        "computepipe_router_headers"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
        "liblog"
        "libutils"
        "libbinder_ndk"
        "android.automotive.computepipe.registry-ndk_platform"
        "android.automotive.computepipe.runner-ndk_platform"
    ];
};

"android.automotive.computepipe.router@1.0" = cc_binary {
    name = "android.automotive.computepipe.router@1.0";
    srcs = [
        "service.cpp"
        "RouterSvc.cpp"
    ];
    shared_libs = [
        "libcutils"
        "liblog"
        "libutils"
        "libbinder_ndk"
        "android.automotive.computepipe.router@1.0-impl"
        "android.automotive.computepipe.registry-ndk_platform"
    ];
    header_libs = [
        "computepipe_router_headers"
    ];
    init_rc = ["android.automotive.computepipe.router@1.0.rc"];
    cflags = ["-DLOG_TAG=\"ComputepipeRouter\""] ++ [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
    ] ++ [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit "android.automotive.computepipe.router@1.0" "android.automotive.computepipe.router@1.0-impl"; }
