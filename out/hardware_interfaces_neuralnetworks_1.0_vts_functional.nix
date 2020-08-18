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

VtsHalNeuralnetworksTest_utils = cc_library_static {
    name = "VtsHalNeuralnetworksTest_utils";
    srcs = [
        "Callbacks.cpp"
        "GeneratedTestHarness.cpp"
    ];
    defaults = ["VtsHalTargetTestDefaults"];
    export_include_dirs = ["."];
    shared_libs = [
        "libfmq"
        "libnativewindow"
    ];
    static_libs = [
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libgmock"
        "libhidlmemory"
        "libneuralnetworks_utils"
    ];
    header_libs = [
        "libneuralnetworks_headers"
        "libneuralnetworks_generated_test_harness_headers"
        "libneuralnetworks_generated_tests"
    ];
};

VtsHalNeuralNetworksTargetTestDefaults = cc_defaults {
    name = "VtsHalNeuralNetworksTargetTestDefaults";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
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
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libgmock"
        "libhidlmemory"
        "libneuralnetworks_utils"
        "VtsHalNeuralnetworksTest_utils"
    ];
    header_libs = [
        "libneuralnetworks_headers"
        "libneuralnetworks_generated_test_harness_headers"
        "libneuralnetworks_generated_tests"
    ];
    #  Bug: http://b/74200014 - Disable arm32 asan since it triggers internal
    #  error in ld.gold.
    arch = {
        arm = {
            sanitize = {
                never = true;
            };
        };
    };
    test_suites = ["general-tests"];
};

VtsHalNeuralnetworksV1_0TargetTest = cc_test {
    name = "VtsHalNeuralnetworksV1_0TargetTest";
    defaults = ["VtsHalNeuralNetworksTargetTestDefaults"];
    srcs = [
        "BasicTests.cpp"
        "GeneratedTests.cpp"
    ];
};

PresubmitHalNeuralnetworksV1_0TargetTest = cc_test {
    name = "PresubmitHalNeuralnetworksV1_0TargetTest";
    defaults = ["VtsHalNeuralNetworksTargetTestDefaults"];
    srcs = [
        "BasicTests.cpp"
        "GeneratedTests.cpp"
    ];
    cflags = [
        "-DPRESUBMIT_NOT_VTS"
    ];
};

in { inherit PresubmitHalNeuralnetworksV1_0TargetTest VtsHalNeuralNetworksTargetTestDefaults VtsHalNeuralnetworksTest_utils VtsHalNeuralnetworksV1_0TargetTest; }
