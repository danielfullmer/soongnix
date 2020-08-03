{ cc_library_static }:
let

#  Copyright (C) 2008 The Android Open Source Project
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
    "acquired_buffer.cpp"
    "epoll_event_dispatcher.cpp"
    "display_manager_service.cpp"
    "display_service.cpp"
    "display_surface.cpp"
    "hardware_composer.cpp"
    "vr_flinger.cpp"
];

includeFiles = ["include"];

staticLibraries = [
    "libdisplay"
    "libdvrcommon"
    "libperformance"
    "libvrsensor"
    "libbroadcastring"
    "libvr_manager"
    "libbroadcastring"
];

sharedLibraries = [
    "android.frameworks.vr.composer@1.0"
    "android.hardware.graphics.allocator@2.0"
    "android.hardware.graphics.composer@2.1"
    "android.hardware.graphics.composer@2.2"
    "android.hardware.graphics.composer@2.3"
    "libbinder"
    "libbase"
    "libbufferhubqueue"
    "libcutils"
    "liblog"
    "libhardware"
    "libnativewindow"
    "libprocessgroup"
    "libutils"
    "libEGL"
    "libGLESv1_CM"
    "libGLESv2"
    "libvulkan"
    "libui"
    "libgui"
    "libsync"
    "libhidlbase"
    "libhidltransport"
    "libfmq"
    "libpdx_default_transport"
];

headerLibraries = [
    "android.hardware.graphics.composer@2.1-command-buffer"
    "android.hardware.graphics.composer@2.2-command-buffer"
    "android.hardware.graphics.composer@2.3-command-buffer"
    "libdvr_headers"
    "libsurfaceflinger_headers"
];

libvrflinger = cc_library_static {
    srcs = sourceFiles;
    export_include_dirs = includeFiles;

    clang = true;
    cflags = [
        "-DLOG_TAG=\"vr_flinger\""
        "-DTRACE=0"
        "-DATRACE_TAG=ATRACE_TAG_GRAPHICS"
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
        "-Wall"
        "-Werror"
        "-Wno-error=sign-compare" #  to fix later
        "-Wno-unused-variable"
    ];
    shared_libs = sharedLibraries;
    whole_static_libs = staticLibraries;
    header_libs = headerLibraries;
    name = "libvrflinger";
};

subdirs = [
    "tests"
];

in { inherit libvrflinger; }
