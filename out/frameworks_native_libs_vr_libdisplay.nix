{ cc_library }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

sourceFiles = [
    "display_client.cpp"
    "display_manager_client.cpp"
    "display_protocol.cpp"
    "shared_buffer_helpers.cpp"
    "vsync_service.cpp"
];

localIncludeFiles = [
    "include"
];

sharedLibraries = [
    "libbase"
    "libbinder"
    "libbufferhubqueue"
    "libcutils"
    "liblog"
    "libutils"
    "libui"
    "libgui"
    "libhardware"
    "libsync"
    "libnativewindow"
    "libpdx_default_transport"
];

staticLibraries = [
    "libdvrcommon"
    "libbroadcastring"
];

headerLibraries = [
    "vulkan_headers"
    "libdvr_headers"
];

libdisplay = cc_library {
    srcs = sourceFiles;
    cflags = [
        "-DLOG_TAG=\"libdisplay\""
        "-DTRACE=0"
        "-DATRACE_TAG=ATRACE_TAG_GRAPHICS"
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
        "-Wall"
        "-Werror"
    ]; #  + [ "-UNDEBUG", "-DDEBUG", "-O0", "-g" ],
    export_include_dirs = localIncludeFiles;
    shared_libs = sharedLibraries;
    static_libs = staticLibraries;
    header_libs = headerLibraries;
    export_header_lib_headers = headerLibraries;

    name = "libdisplay";
};

in { inherit libdisplay; }
