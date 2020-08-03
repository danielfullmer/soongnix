{ cc_defaults, cc_library_shared, cc_test }:
let

#
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
#

libvts_resource-defaults = cc_defaults {

    name = "libvts_resource-defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    local_include_dirs = ["include"];

    static_libs = [
        "android.hardware.audio@4.0"
        "android.hardware.audio.effect@2.0"
        "android.hardware.audio.effect@4.0"
    ];

    shared_libs = [
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libbase"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libhidlmemory"
        "liblog"
        "libprotobuf-cpp-full"
        "libutils"
    ];

    export_include_dirs = ["include"];

    export_static_lib_headers = [
        "android.hardware.audio@4.0"
        "android.hardware.audio.effect@2.0"
        "android.hardware.audio.effect@4.0"
    ];

    export_shared_lib_headers = [
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libutils"
    ];
};

libvts_resource_driver = cc_library_shared {
    name = "libvts_resource_driver";

    defaults = ["libvts_resource-defaults"];

    srcs = [
        "hidl_handle_driver/VtsHidlHandleDriver.cpp"
        "hidl_memory_driver/VtsHidlMemoryDriver.cpp"
    ];
};

libvts_resource_manager = cc_library_shared {
    name = "libvts_resource_manager";

    defaults = ["libvts_resource-defaults"];

    srcs = [
        "resource_manager/VtsResourceManager.cpp"
    ];

    shared_libs = [
        "libvts_multidevice_proto"
        "libvts_resource_driver"
    ];
};

vts_resource_fmq_test = cc_test {
    name = "vts_resource_fmq_test";

    defaults = ["libvts_resource-defaults"];

    rtti = true;

    srcs = [
        "fmq_driver/VtsFmqDriverTest.cpp"
    ];
};

vts_resource_hidl_memory_test = cc_test {
    name = "vts_resource_hidl_memory_test";

    defaults = ["libvts_resource-defaults"];

    srcs = [
        "hidl_memory_driver/VtsHidlMemoryDriver.cpp"
        "hidl_memory_driver/VtsHidlMemoryDriverTest.cpp"
    ];
};

vts_resource_hidl_handle_test = cc_test {
    name = "vts_resource_hidl_handle_test";

    defaults = ["libvts_resource-defaults"];

    srcs = [
        "hidl_handle_driver/VtsHidlHandleDriver.cpp"
        "hidl_handle_driver/VtsHidlHandleDriverTest.cpp"
    ];
};

in { inherit libvts_resource-defaults libvts_resource_driver libvts_resource_manager vts_resource_fmq_test vts_resource_hidl_handle_test vts_resource_hidl_memory_test; }
