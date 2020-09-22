{ cc_binary }:
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

"android.hardware.neuralnetworks@1.0-service-hvx" = cc_binary {
    name = "android.hardware.neuralnetworks@1.0-service-hvx";
    owner = "google";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    proprietary = true;
    init_rc = ["android.hardware.neuralnetworks@1.0-service-hvx.rc"];
    enabled = false;
    srcs = [
        "Device.cpp"
        "HexagonController.cpp"
        "HexagonModel.cpp"
        "HexagonOperationsCheck.cpp"
        "HexagonOperationsPrepare.cpp"
        "HexagonUtils.cpp"
        "PreparedModel.cpp"
        "Service.cpp"
    ];
    header_libs = [
        "libneuralnetworks_headers"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libdl"
        "libhardware"
        "libhidlbase"
        "libhidlmemory"
        "liblog"
        "libutils"
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
    ];
    static_libs = [
        "libneuralnetworks_common"
    ];
};

in { inherit "android.hardware.neuralnetworks@1.0-service-hvx"; }
