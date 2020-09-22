{ filegroup }:
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

libvtswidevine-arm-prebuilts = filegroup {
    name = "libvtswidevine-arm-prebuilts";
    srcs = ["libvtswidevine/arm/libvtswidevine32.so"];
};

libvtswidevine-arm64-prebuilts = filegroup {
    name = "libvtswidevine-arm64-prebuilts";
    srcs = ["libvtswidevine/arm64/libvtswidevine64.so"];
};

libvtswidevine-x86-prebuilts = filegroup {
    name = "libvtswidevine-x86-prebuilts";
    srcs = ["libvtswidevine/x86/libvtswidevine32.so"];
};

libvtswidevine-x86_64-prebuilts = filegroup {
    name = "libvtswidevine-x86_64-prebuilts";
    srcs = ["libvtswidevine/x86_64/libvtswidevine64.so"];
};

in { inherit libvtswidevine-arm-prebuilts libvtswidevine-arm64-prebuilts libvtswidevine-x86-prebuilts libvtswidevine-x86_64-prebuilts; }