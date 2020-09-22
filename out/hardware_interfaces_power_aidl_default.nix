{ cc_binary }:
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

"android.hardware.power-service.example" = cc_binary {
    name = "android.hardware.power-service.example";
    relative_install_path = "hw";
    init_rc = ["power-default.rc"];
    vintf_fragments = ["power-default.xml"];
    vendor = true;
    shared_libs = [
        "libbase"
        "libbinder_ndk"
        "android.hardware.power-ndk_platform"
    ];
    srcs = [
        "main.cpp"
        "Power.cpp"
    ];
};

in { inherit "android.hardware.power-service.example"; }
