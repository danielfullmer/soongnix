{ cc_binary, cc_library_shared }:
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

libbufferhubservice = cc_library_shared {
    name = "libbufferhubservice";
    cflags = [
        "-DLOG_TAG=\"libbufferhubservice\""
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    srcs = [
        "BufferClient.cpp"
        "BufferHubIdGenerator.cpp"
        "BufferHubService.cpp"
        "BufferNode.cpp"
    ];
    header_libs = [
        "libdvr_headers"
        "libnativewindow_headers"
    ];
    shared_libs = [
        "android.frameworks.bufferhub@1.0"
        "libcrypto"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libui"
        "libutils"
    ];
    export_include_dirs = [
        "include"
    ];
};

"android.frameworks.bufferhub@1.0-service" = cc_binary {
    name = "android.frameworks.bufferhub@1.0-service";
    relative_install_path = "hw";
    srcs = [
        "main_bufferhub.cpp"
    ];
    header_libs = [
        "libdvr_headers"
        "libnativewindow_headers"
    ];
    shared_libs = [
        "android.frameworks.bufferhub@1.0"
        "libbufferhubservice"
        "libcrypto"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libui"
        "libutils"
    ];
    cflags = [
        "-DLOG_TAG=\"bufferhub\""
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    init_rc = ["android.frameworks.bufferhub@1.0-service.rc"];
    vintf_fragments = ["android.frameworks.bufferhub@1.0-service.xml"];
};

in { inherit "android.frameworks.bufferhub@1.0-service" libbufferhubservice; }
