{ cc_test }:
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

VtsHalGraphicsComposerV2_2TargetTest = cc_test {
    name = "VtsHalGraphicsComposerV2_2TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "VtsHalGraphicsComposerV2_2ReadbackTest.cpp"
        "VtsHalGraphicsComposerV2_2TargetTest.cpp"
    ];

    #  TODO(b/64437680): Assume these libs are always available on the device.
    shared_libs = [
        "libfmq"
        "libhidlbase"
        "libhidltransport"
        "libsync"
    ];
    static_libs = [
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.allocator@3.0"
        "android.hardware.graphics.common@1.1"
        "android.hardware.graphics.composer@2.1"
        "android.hardware.graphics.composer@2.1-vts"
        "android.hardware.graphics.composer@2.2"
        "android.hardware.graphics.composer@2.2-vts"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@2.0-vts"
        "android.hardware.graphics.mapper@2.1"
        "android.hardware.graphics.mapper@2.1-vts"
        "android.hardware.graphics.mapper@3.0"
        "android.hardware.graphics.mapper@3.0-vts"
    ];
    header_libs = [
        "android.hardware.graphics.composer@2.1-command-buffer"
        "android.hardware.graphics.composer@2.2-command-buffer"
    ];
    test_suites = ["general-tests"];
};

in { inherit VtsHalGraphicsComposerV2_2TargetTest; }
