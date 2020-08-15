{ cc_defaults, cc_library_headers, cc_library_static, cc_test }:
let

/*
 * Copyright 2017 The Android Open Source Project
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

libneuralnetworks_common_headers = cc_library_headers {
    name = "libneuralnetworks_common_headers";
    host_supported = false;
    export_include_dirs = ["include"];
};

neuralnetworks_operations = cc_defaults {
    name = "neuralnetworks_operations";
    srcs = [
        "OperationResolver.cpp"
        "operations/Activation.cpp"
        "operations/BidirectionalSequenceRNN.cpp"
        "operations/Broadcast.cpp"
        "operations/ChannelShuffle.cpp"
        "operations/Comparisons.cpp"
        "operations/Concatenation.cpp"
        "operations/Conv2D.cpp"
        "operations/Dequantize.cpp"
        "operations/Elementwise.cpp"
        "operations/FullyConnected.cpp"
        "operations/Gather.cpp"
        "operations/GenerateProposals.cpp"
        "operations/HeatmapMaxKeypoint.cpp"
        "operations/InstanceNormalization.cpp"
        "operations/L2Normalization.cpp"
        "operations/LogicalAndOr.cpp"
        "operations/LogicalNot.cpp"
        "operations/LogSoftmax.cpp"
        "operations/Neg.cpp"
        "operations/Pooling.cpp"
        "operations/PRelu.cpp"
        "operations/Quantize.cpp"
        "operations/Reduce.cpp"
        "operations/ResizeImageOps.cpp"
        "operations/RoiAlign.cpp"
        "operations/RoiPooling.cpp"
        "operations/Select.cpp"
        "operations/Slice.cpp"
        "operations/Softmax.cpp"
        "operations/Transpose.cpp"
        "operations/TransposeConv2D.cpp"
        "operations/UnidirectionalSequenceLSTM.cpp"
        "operations/UnidirectionalSequenceRNN.cpp"
    ];
};

libneuralnetworks_utils = cc_library_static {
    name = "libneuralnetworks_utils";
    defaults = [
        "neuralnetworks_defaults"
        "neuralnetworks_operations"
    ];
    host_supported = false;
    vendor_available = true;
    export_include_dirs = ["include"];
    srcs = [
        "Utils.cpp"
        "ExecutionBurstController.cpp"
        "ExecutionBurstServer.cpp"
    ];
    header_libs = [
        "libneuralnetworks_headers"
        "libeigen"
        "gemmlowp_headers"
        "tensorflow_headers"
    ];
    shared_libs = [
        "libhidltransport"
        "libhidlmemory"
        "libnativewindow"
        "libfmq"
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
    ];
    whole_static_libs = [
        "libarect"
    ];
    cflags = [
        "-DTF_LITE_DISABLE_X86_NEON"
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Wno-extern-c-compat"
        "-Wno-sign-compare"
        "-Wno-unused-local-typedef"
        "-Wno-unused-parameter"
        "-Wno-unused-private-field"
        "-Wno-unused-variable"
        "-Wno-invalid-partial-specialization"
    ];
};

libneuralnetworks_common = cc_library_static {
    name = "libneuralnetworks_common";
    defaults = [
        "neuralnetworks_defaults"
        "neuralnetworks_operations"
    ];
    host_supported = false;
    vendor_available = true;
    #  b/109953668, disable OpenMP
    #  openmp: true,
    export_include_dirs = [
        "include"
    ];
    srcs = [
        "CpuExecutor.cpp"
        "ExecutionBurstController.cpp"
        "ExecutionBurstServer.cpp"
        "GraphDump.cpp"
        "IndexedShapeWrapper.cpp"
        "OperationsUtils.cpp"
        "TokenHasher.cpp"
        "Utils.cpp"
        "ValidateHal.cpp"
        "operations/ArgMinMax.cpp"
        "operations/BidirectionalSequenceLSTM.cpp"
        "operations/Cast.cpp"
        "operations/DepthwiseConv2D.cpp"
        "operations/EmbeddingLookup.cpp"
        "operations/ExpandDims.cpp"
        "operations/GroupedConv2D.cpp"
        "operations/HashtableLookup.cpp"
        "operations/LSHProjection.cpp"
        "operations/LSTM.cpp"
        "operations/MaximumMinimum.cpp"
        "operations/Multinomial.cpp"
        "operations/Normalization.cpp"
        "operations/Pow.cpp"
        "operations/TopK_V2.cpp"
        "operations/QuantizedLSTM.cpp"
        "operations/Reshape.cpp"
        "operations/RNN.cpp"
        "operations/SimpleMath.cpp"
        "operations/Split.cpp"
        "operations/StridedSlice.cpp"
        "operations/SVDF.cpp"
        "operations/Tile.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhidlmemory"
        "libnativewindow"
        "libfmq"
        "libtextclassifier_hash"
        "libui"
        "liblog"
        "libutils"
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
    ];
    static_libs = [
        "libcrypto_static"
    ];
    header_libs = [
        "libneuralnetworks_headers"
        "libtextclassifier_hash_headers"
        "libeigen"
        "gemmlowp_headers"
        "philox_random_headers"
        "tensorflow_headers"
    ];
    whole_static_libs = [
        "libarect"
        "libtflite_kernel_utils"
        "philox_random"
    ];

    cflags = [
        "-DNN_INCLUDE_CPU_IMPLEMENTATION"
        "-DNAMESPACE_FOR_HASH_FUNCTIONS=farmhash"
        "-DTF_LITE_DISABLE_X86_NEON"
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Wno-extern-c-compat"
        "-Wno-sign-compare"
        "-Wno-unused-local-typedef"
        "-Wno-unused-parameter"
        "-Wno-unused-private-field"
        "-Wno-unused-variable"
        "-Wno-invalid-partial-specialization"
        "-Wno-array-bounds"
    ];
};

NeuralNetworksTest_operations = cc_test {
    name = "NeuralNetworksTest_operations";
    shared_libs = [
        "libhidlmemory"
        "libnativewindow"
        "libneuralnetworks"
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
    ];
    static_libs = [
        "libbase"
        "libgmock"
        "liblog"
        "libneuralnetworks_common"
    ];
    cflags = [
        "-Wno-extern-c-compat"
        "-Wno-unused-parameter"
        "-Wno-invalid-partial-specialization"
    ];
    srcs = [
        "operations/EmbeddingLookupTest.cpp"
        "operations/HashtableLookupTest.cpp"
        "operations/LSHProjectionTest.cpp"
        "operations/LSTMTest.cpp"
        "operations/LayerNormLSTMTest.cpp"
        "operations/MultinomialTest.cpp"
        "operations/QuantizedLSTMTest.cpp"
        "operations/RNNTest.cpp"
        "operations/SVDFTest.cpp"
    ];
    local_include_dirs = ["include"];
    header_libs = [
        "libeigen"
        "philox_random_headers"
        "tensorflow_headers"
    ];
};

NeuralNetworksTest_utils = cc_test {
    name = "NeuralNetworksTest_utils";
    shared_libs = [
        "libhidlmemory"
        "libnativewindow"
        "libneuralnetworks"
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
    ];
    static_libs = [
        "libbase"
        "libgmock"
        "liblog"
        "libneuralnetworks_common"
    ];
    cflags = [
        "-Wno-extern-c-compat"
        "-Wno-unused-variable"
    ];
    srcs = [
        "UtilsTest.cpp"
    ];
    local_include_dirs = ["include"];
    header_libs = [
        "tensorflow_headers"
    ];
};

in { inherit NeuralNetworksTest_operations NeuralNetworksTest_utils libneuralnetworks_common libneuralnetworks_common_headers libneuralnetworks_utils neuralnetworks_operations; }
