{ cc_library_headers, cc_library_shared, cc_library_static }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

libdvr_headers = cc_library_headers {
    name = "libdvr_headers";
    export_include_dirs = ["include"];
    vendor_available = true;
};

libdvr_private_headers = cc_library_headers {
    name = "libdvr_private_headers";
    export_include_dirs = ["."];
    vendor_available = false;
};

cflags = [
    "-DDVR_TRACKING_IMPLEMENTED=0"
    "-DLOG_TAG=\"libdvr\""
    "-DTRACE=0"
    "-Wall"
    "-Werror"
];

srcs = [
    "dvr_api.cpp"
    "dvr_buffer.cpp"
    "dvr_buffer_queue.cpp"
    "dvr_configuration_data.cpp"
    "dvr_display_manager.cpp"
    "dvr_hardware_composer_client.cpp"
    "dvr_performance.cpp"
    "dvr_pose.cpp"
    "dvr_surface.cpp"
    "dvr_tracking.cpp"
];

static_libs = [
    "libbroadcastring"
    "libvrsensor"
    "libdisplay"
    "libvirtualtouchpadclient"
    "libvr_hwc-impl"
    "libvr_hwc-binder"
    "libgrallocusage"
    "libperformance"
];

shared_libs = [
    "android.hardware.graphics.bufferqueue@1.0"
    "android.hidl.token@1.0-utils"
    "libbase"
    "libbufferhubqueue"
    "libbinder"
    "liblog"
    "libcutils"
    "libutils"
    "libnativewindow"
    "libgui"
    "libui"
    "libpdx_default_transport"
];

"libdvr.google" = cc_library_shared {
    name = "libdvr.google";
    owner = "google";
    cflags = cflags;
    header_libs = ["libdvr_headers"];
    export_header_lib_headers = ["libdvr_headers"];
    srcs = srcs;
    static_libs = static_libs;
    shared_libs = shared_libs;
    version_script = "exported_apis.lds";
};

#  Also build a static libdvr for linking into tests. The linker script
#  restricting function access in the shared lib makes it inconvenient to use in
#  test code.
"libdvr_static.google" = cc_library_static {
    name = "libdvr_static.google";
    owner = "google";
    cflags = cflags;
    header_libs = ["libdvr_headers"];
    export_header_lib_headers = ["libdvr_headers"];
    srcs = srcs;
    static_libs = static_libs;
    shared_libs = shared_libs;
};

subdirs = [
    "tests"
];

in { inherit "libdvr.google" "libdvr_static.google" libdvr_headers libdvr_private_headers; }
