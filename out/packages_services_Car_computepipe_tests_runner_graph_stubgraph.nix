{ cc_prebuilt_library_shared }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

libstubgraphimpl = cc_prebuilt_library_shared {
    name = "libstubgraphimpl";
    target = {
        android_arm64 = {
            srcs = ["arm64/libstubgraphimpl.so"];
        };
        android_arm = {
            srcs = ["arm/libstubgraphimpl.so"];
        };
        android_x86 = {
            srcs = ["x86/libstubgraphimpl.so"];
        };
        android_x86_64 = {
            srcs = ["x86_64/libstubgraphimpl.so"];
        };
    };

    shared_libs = [
        "libc"
        "libdl"
        "liblog"
        "libm"
    ];
    strip = {
        keep_symbols = true;
    };
};

in { inherit libstubgraphimpl; }