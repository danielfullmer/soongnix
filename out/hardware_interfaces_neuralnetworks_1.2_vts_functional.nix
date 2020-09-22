{ cc_library_static, cc_test }:
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

VtsHalNeuralNetworksV1_2_utils = cc_library_static {
    name = "VtsHalNeuralNetworksV1_2_utils";
    defaults = ["neuralnetworks_vts_functional_defaults"];
    export_include_dirs = ["include"];
    srcs = [
        "Callbacks.cpp"
        "Utils.cpp"
    ];
    static_libs = [
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
    ];
    header_libs = [
        "libbase_headers"
    ];
};

VtsHalNeuralnetworksV1_2TargetTest = cc_test {
    name = "VtsHalNeuralnetworksV1_2TargetTest";
    defaults = ["neuralnetworks_vts_functional_defaults"];
    srcs = [
        "BasicTests.cpp"
        "CompilationCachingTests.cpp"
        "GeneratedTestHarness.cpp"
        "TestAssertions.cpp"
        "TestMain.cpp"
        "ValidateBurst.cpp"
        "ValidateModel.cpp"
        "ValidateRequest.cpp"
        "VtsHalNeuralnetworks.cpp"
    ];
    local_include_dirs = ["include"];
    shared_libs = [
        "libfmq"
        "libnativewindow"
    ];
    static_libs = [
        "VtsHalNeuralNetworksV1_0_utils"
        "VtsHalNeuralNetworksV1_2_utils"
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libgmock"
        "libhidlmemory"
        "libneuralnetworks_generated_test_harness"
        "libneuralnetworks_utils"
    ];
    whole_static_libs = [
        "neuralnetworks_generated_V1_0_example"
        "neuralnetworks_generated_V1_1_example"
        "neuralnetworks_generated_V1_2_example"
    ];
    header_libs = [
        "libneuralnetworks_headers"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalNeuralNetworksV1_2_utils VtsHalNeuralnetworksV1_2TargetTest; }
