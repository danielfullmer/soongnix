{ cc_test }:
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

#  Tests for V1_0 models using the V1_2 HAL.
VtsHalNeuralnetworksV1_2CompatV1_0TargetTest = cc_test {
    name = "VtsHalNeuralnetworksV1_2CompatV1_0TargetTest";
    defaults = ["VtsHalNeuralNetworksTargetTestDefaults"];
    srcs = [
        "GeneratedTestsV1_0.cpp"
        "ValidateBurst.cpp"
    ];
    cflags = [
        "-DNN_TEST_DYNAMIC_OUTPUT_SHAPE"
    ];
};

#  Tests for V1_1 models using the V1_2 HAL.
VtsHalNeuralnetworksV1_2CompatV1_1TargetTest = cc_test {
    name = "VtsHalNeuralnetworksV1_2CompatV1_1TargetTest";
    defaults = ["VtsHalNeuralNetworksTargetTestDefaults"];
    srcs = [
        "GeneratedTestsV1_1.cpp"
        "ValidateBurst.cpp"
    ];
    cflags = [
        "-DNN_TEST_DYNAMIC_OUTPUT_SHAPE"
    ];
};

#  Tests for V1_2 models.
VtsHalNeuralnetworksV1_2TargetTest = cc_test {
    name = "VtsHalNeuralnetworksV1_2TargetTest";
    defaults = ["VtsHalNeuralNetworksTargetTestDefaults"];
    srcs = [
        "BasicTests.cpp"
        "CompilationCachingTests.cpp"
        "GeneratedTests.cpp"
        "ValidateBurst.cpp"
    ];
    cflags = [
        "-DNN_TEST_DYNAMIC_OUTPUT_SHAPE"
    ];
};

PresubmitHalNeuralnetworksV1_2TargetTest = cc_test {
    name = "PresubmitHalNeuralnetworksV1_2TargetTest";
    defaults = ["VtsHalNeuralNetworksTargetTestDefaults"];
    srcs = [
        "BasicTests.cpp"
        "GeneratedTests.cpp"
        "ValidateBurst.cpp"
    ];
    cflags = [
        "-DNN_TEST_DYNAMIC_OUTPUT_SHAPE"
        "-DPRESUBMIT_NOT_VTS"
    ];
};

in { inherit PresubmitHalNeuralnetworksV1_2TargetTest VtsHalNeuralnetworksV1_2CompatV1_0TargetTest VtsHalNeuralnetworksV1_2CompatV1_1TargetTest VtsHalNeuralnetworksV1_2TargetTest; }
