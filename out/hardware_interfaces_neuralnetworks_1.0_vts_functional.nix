{ cc_defaults, cc_library_static, cc_test }:
let

#
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
#

neuralnetworks_vts_functional_defaults = cc_defaults {
    name = "neuralnetworks_vts_functional_defaults";
    defaults = ["VtsHalTargetTestDefaults"];
    arch = {
        x86 = {
            cflags = [
                "-D_Float16=__fp16"
                "-Xclang"
                "-fnative-half-type"
                "-Xclang"
                "-fallow-half-arguments-and-returns"
            ];
        };
        x86_64 = {
            cflags = [
                "-D_Float16=__fp16"
                "-Xclang"
                "-fnative-half-type"
                "-Xclang"
                "-fallow-half-arguments-and-returns"
            ];
        };
    };
};

VtsHalNeuralNetworksV1_0_utils = cc_library_static {
    name = "VtsHalNeuralNetworksV1_0_utils";
    srcs = [
        "Callbacks.cpp"
        "Utils.cpp"
    ];
    defaults = ["neuralnetworks_vts_functional_defaults"];
    export_include_dirs = ["include"];
    shared_libs = [
        "libfmq"
        "libnativewindow"
    ];
    static_libs = [
        "android.hardware.neuralnetworks@1.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libgmock"
        "libhidlmemory"
        "libneuralnetworks_generated_test_harness"
        "libneuralnetworks_utils"
    ];
    header_libs = [
        "libneuralnetworks_headers"
    ];
};

VtsHalNeuralnetworksV1_0TargetTest = cc_test {
    name = "VtsHalNeuralnetworksV1_0TargetTest";
    defaults = ["neuralnetworks_vts_functional_defaults"];
    srcs = [
        "BasicTests.cpp"
        "GeneratedTestHarness.cpp"
        "TestAssertions.cpp"
        "TestMain.cpp"
        "ValidateModel.cpp"
        "ValidateRequest.cpp"
        "VtsHalNeuralnetworks.cpp"
    ];
    shared_libs = [
        "libfmq"
        "libnativewindow"
    ];
    static_libs = [
        "android.hardware.neuralnetworks@1.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libgmock"
        "libhidlmemory"
        "libneuralnetworks_generated_test_harness"
        "libneuralnetworks_utils"
        "VtsHalNeuralNetworksV1_0_utils"
    ];
    whole_static_libs = [
        "neuralnetworks_generated_V1_0_example"
    ];
    header_libs = [
        "libneuralnetworks_headers"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalNeuralNetworksV1_0_utils VtsHalNeuralnetworksV1_0TargetTest neuralnetworks_vts_functional_defaults; }
