{ cc_library_static, java_library_static, python_library_host }:
let

/*
 * Copyright (C) 2018 The Android Open Source Project
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

lib_apex_manifest_proto = cc_library_static {
    name = "lib_apex_manifest_proto";
    host_supported = true;
    proto = {
        export_proto_headers = true;
        type = "full";
    };
    srcs = ["apex_manifest.proto"];
};

lib_apex_manifest_proto_lite = cc_library_static {
    name = "lib_apex_manifest_proto_lite";
    host_supported = true;
    recovery_available = true;
    proto = {
        export_proto_headers = true;
        type = "lite";
    };
    srcs = ["apex_manifest.proto"];
};

apex_manifest_proto = python_library_host {
    name = "apex_manifest_proto";
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    srcs = [
        "apex_manifest.proto"
    ];
    proto = {
        canonical_path_from_root = false;
    };
};

apex_build_info_proto = python_library_host {
    name = "apex_build_info_proto";
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    srcs = [
        "apex_build_info.proto"
    ];
    proto = {
        canonical_path_from_root = false;
    };
};

apex_manifest_proto_java = java_library_static {
    name = "apex_manifest_proto_java";
    host_supported = true;
    device_supported = false;
    proto = {
        type = "full";
    };
    srcs = ["apex_manifest.proto"];
};

lib_apex_session_state_proto = cc_library_static {
    name = "lib_apex_session_state_proto";
    host_supported = true;
    proto = {
        export_proto_headers = true;
        type = "full";
    };
    srcs = ["session_state.proto"];
};

in { inherit apex_build_info_proto apex_manifest_proto apex_manifest_proto_java lib_apex_manifest_proto lib_apex_manifest_proto_lite lib_apex_session_state_proto; }
