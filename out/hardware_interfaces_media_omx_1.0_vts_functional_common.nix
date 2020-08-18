{ cc_defaults, cc_library_static }:
let

#
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
#

VtsHalMediaOmxV1_0CommonUtil = cc_library_static {
    name = "VtsHalMediaOmxV1_0CommonUtil";
    srcs = ["media_hidl_test_common.cpp"];

    header_libs = ["media_plugin_headers"];
    export_header_lib_headers = ["media_plugin_headers"];
    export_include_dirs = ["."];

    static_libs = [
        "VtsHalHidlTargetTestBase"
        "libhidlmemory"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "android.hardware.media.omx@1.0"
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.allocator@3.0"
        "android.hardware.graphics.common@1.0"
        "android.hardware.graphics.common@1.1"
        "android.hardware.graphics.common@1.2"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
    ];
    export_static_lib_headers = [
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.allocator@3.0"
        "android.hardware.graphics.common@1.0"
        "android.hardware.graphics.common@1.1"
        "android.hardware.graphics.common@1.2"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
    ];
};

VtsHalMediaOmxV1_0Defaults = cc_defaults {
    name = "VtsHalMediaOmxV1_0Defaults";
    defaults = ["VtsHalTargetTestDefaults"];

    #  Link to these statically as they are not guaranteed to be on the device.
    static_libs = [
        "VtsHalMediaOmxV1_0CommonUtil"
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.allocator@3.0"
        "android.hardware.graphics.common@1.0"
        "android.hardware.graphics.common@1.1"
        "android.hardware.graphics.common@1.2"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.graphics.common@1.0"
        "android.hardware.media.omx@1.0"
        "android.hardware.media@1.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libhidlmemory"
        "libnativehelper"
    ];

    #  TODO(b/64437680): Assume these libs are always available on the device.
    shared_libs = [
        "libstagefright_foundation"
    ];
};

in { inherit VtsHalMediaOmxV1_0CommonUtil VtsHalMediaOmxV1_0Defaults; }
