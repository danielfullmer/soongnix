{ cc_library_static }:
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

libvr_manager = cc_library_static {
    name = "libvr_manager";
    srcs = [
        "vr_manager.cpp"
        "trusted_uids.cpp"
    ];
    include_dirs = ["frameworks/native/include/vr/vr_manager"];
    export_include_dirs = ["include"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
    shared_libs = [
        "libutils"
        "libbinder"
    ];
};

in { inherit libvr_manager; }
