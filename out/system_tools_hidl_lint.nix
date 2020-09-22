{ cc_binary_host, cc_library_host_static }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
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

libhidl-lint = cc_library_host_static {
    name = "libhidl-lint";
    defaults = ["hidl-gen-defaults"];
    export_shared_lib_headers = ["libjsoncpp"];
    srcs = [
        "Lint.cpp"
        "LintRegistry.cpp"
        "lints/emptyStructs.cpp"
        "lints/enumMaxAndAll.cpp"
        "lints/importTypes.cpp"
        "lints/methodDocComment.cpp"
        "lints/methodVersions.cpp"
        "lints/namingConventions.cpp"
        "lints/oneway.cpp"
        "lints/safeunion.cpp"
        "lints/unhandledComments.cpp"
    ];
    shared_libs = [
        "libbase"
        "libjsoncpp"
        "liblog"
    ];
    static_libs = [
        "libcrypto"
        "libhidl-gen"
        "libhidl-gen-ast"
        "libhidl-gen-hash"
        "libhidl-gen-host-utils"
        "libhidl-gen-utils"
    ];
};

hidl-lint = cc_binary_host {
    name = "hidl-lint";
    defaults = ["hidl-gen-defaults"];
    srcs = ["main.cpp"];
    static_libs = [
        "libbase"
        "libcrypto"
        "libhidl-gen"
        "libhidl-gen-ast"
        "libhidl-gen-hash"
        "libhidl-gen-host-utils"
        "libhidl-gen-utils"
        "libjsoncpp"
        "liblog"
    ];
    whole_static_libs = ["libhidl-lint"];
};

in { inherit hidl-lint libhidl-lint; }