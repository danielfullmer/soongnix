{ cc_binary_host }:
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

hidl2aidl = cc_binary_host {
    name = "hidl2aidl";
    defaults = ["hidl-gen-defaults"];
    srcs = [
        "AidlHelper.cpp"
        "AidlInterface.cpp"
        "AidlNamedType.cpp"
        "AidlScope.cpp"
        "AidlType.cpp"
        "main.cpp"
    ];
    static_libs = [
        "libbase"
        "libcrypto"
        "libhidl-gen"
        "libhidl-gen-ast"
        "libhidl-gen-hash"
        "libhidl-gen-host-utils"
        "libhidl-gen-utils"
        "liblog"
    ];
};

in { inherit hidl2aidl; }
