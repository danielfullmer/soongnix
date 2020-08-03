{ cc_library_static }:
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

wifi_offload_types = cc_library_static {
    name = "wifi_offload_types";
    export_include_dirs = [
        "include"
    ];
    srcs = [
        "channel_histogram.cc"
        "flatbuffers_serialization.cc"
        "preferred_network.cc"
        "rpc_log_record.cc"
        "scan_config.cc"
        "scan_filter.cc"
        "scan_params.cc"
        "scan_record.cc"
        "scan_result.cc"
        "scan_result_message.cc"
        "scan_stats.cc"
        "ssid.cc"
        "utility.cc"
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
    header_libs = [
        "chre_flatbuffers"
        "chre_api"
    ];
    export_header_lib_headers = [
        "chre_flatbuffers"
        "chre_api"
    ];
    vendor = true;
    proprietary = true;
};

in { inherit wifi_offload_types; }
