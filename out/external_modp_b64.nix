{ cc_library_static }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

libmodpb64 = cc_library_static {
    name = "libmodpb64";
    host_supported = true;
    recovery_available = true;
    vendor_available = true;
    srcs = ["modp_b64.cc"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
    local_include_dirs = ["modp_b64"];
    export_include_dirs = ["."];
};

libmodpb64_ndk = cc_library_static {
    name = "libmodpb64_ndk";
    vendor_available = false;
    srcs = ["modp_b64.cc"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
    local_include_dirs = ["modp_b64"];
    export_include_dirs = ["."];
    sdk_version = "current";
    stl = "c++_static";
};

in { inherit libmodpb64 libmodpb64_ndk; }
