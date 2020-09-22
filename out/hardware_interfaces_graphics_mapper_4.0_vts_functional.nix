{ cc_test }:
let

#
#  Copyright 2019 The Android Open Source Project
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

VtsHalGraphicsMapperV4_0TargetTest = cc_test {
    name = "VtsHalGraphicsMapperV4_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["VtsHalGraphicsMapperV4_0TargetTest.cpp"];
    static_libs = [
        "android.hardware.graphics.common-ndk_platform"
        "android.hardware.graphics.mapper@4.0-vts"
        "libgralloctypes"
        "libsync"
    ];
    shared_libs = [
        "android.hardware.graphics.allocator@4.0"
        "android.hardware.graphics.common@1.0"
        "android.hardware.graphics.common@1.1"
        "android.hardware.graphics.common@1.2"
        "android.hardware.graphics.mapper@4.0"
    ];
    header_libs = [
        "libsystem_headers"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalGraphicsMapperV4_0TargetTest; }
