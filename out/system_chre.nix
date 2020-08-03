{ cc_binary, cc_library_headers, cc_library_shared, cc_library_static, cc_test }:
let

/*
 * Copyright (C) 2017 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

chre_client = cc_library_static {
    name = "chre_client";
    vendor = true;
    export_include_dirs = [
        "host/common/include"
        "platform/shared/include"
        "util/include"
    ];
    srcs = [
        "host/common/fragmented_load_transaction.cc"
        "host/common/host_protocol_host.cc"
        "host/common/socket_client.cc"
        "platform/shared/host_protocol_common.cc"
    ];
    header_libs = ["chre_flatbuffers"];
    export_header_lib_headers = ["chre_flatbuffers"];
    shared_libs = [
        "libcutils"
        "liblog"
        "libutils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

chre_test_client = cc_binary {
    name = "chre_test_client";
    vendor = true;
    local_include_dirs = [
        "chre_api/include/chre_api"
        "util/include"
    ];
    srcs = [
        "host/common/test/chre_test_client.cc"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libcutils"
        "liblog"
        "libutils"
    ];
    static_libs = ["chre_client"];
};

audio_stress_test = cc_test {
    name = "audio_stress_test";
    vendor = true;
    local_include_dirs = [
        "chre_api/include/chre_api"
        "util/include"
    ];
    srcs = [
        "host/common/audio_stress_test/audio_stress_test.cc"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libcutils"
        "liblog"
        "libutils"
    ];
    static_libs = ["chre_client"];
    gtest = false;
};

"android.hardware.contexthub@1.0-impl.generic" = cc_library_shared {
    name = "android.hardware.contexthub@1.0-impl.generic";
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "host/hal_generic/generic_context_hub.cc"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libcutils"
        "liblog"
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "android.hardware.contexthub@1.0"
    ];
    static_libs = ["chre_client"];
};

chre_api = cc_library_headers {
    name = "chre_api";
    vendor = true;
    export_include_dirs = [
        "chre_api/include/chre_api"
    ];
};

chre_flatbuffers = cc_library_headers {
    name = "chre_flatbuffers";
    vendor = true;
    export_include_dirs = [
        "external/flatbuffers/include"
    ];
};

subdirs = [
    "apps/wifi_offload"
];

in { inherit "android.hardware.contexthub@1.0-impl.generic" audio_stress_test chre_api chre_client chre_flatbuffers chre_test_client; }
