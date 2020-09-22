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
        "operations/DepthwiseConv2D.cpp"
        "operations/Dequantize.cpp"
        "operations/Elementwise.cpp"
        "operations/Elu.cpp"
        "operations/Fill.cpp"
        "operations/FullyConnected.cpp"
        "operations/Gather.cpp"
        "operations/GenerateProposals.cpp"
        "operations/HeatmapMaxKeypoint.cpp"
        "operations/InstanceNormalization.cpp"
        "operations/L2Normalization.cpp"
        "operations/LocalResponseNormalization.cpp"
        "operations/LogSoftmax.cpp"
        "operations/LogicalAndOr.cpp"
        "operations/LogicalNot.cpp"
        "operations/Neg.cpp"
        "operations/PRelu.cpp"
        "operations/Pooling.cpp"
        "operations/QLSTM.cpp"
        "operations/Quantize.cpp"
        "operations/Rank.cpp"
        "operations/Reduce.cpp"
        "operations/ResizeImageOps.cpp"
        "operations/RoiAlign.cpp"
        "operations/RoiPooling.cpp"
        "operations/Select.cpp"
        "operations/Slice.cpp"
        "operations/Softmax.cpp"
        "operations/Squeeze.cpp"
        "operations/StridedSlice.cpp"
        "operations/TopK_V2.cpp"
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
    apex_available = [
        "//apex_available:platform"
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
    ];
    export_include_dirs = ["include"];
    srcs = [
        "ExecutionBurstController.cpp"
        "ExecutionBurstServer.cpp"
        "MemoryUtils.cpp"
        "Utils.cpp"
    ];
    header_libs = [
        "gemmlowp_headers"
        "libeigen"
        "libneuralnetworks_headers"
        "tensorflow_headers"
    ];
    shared_libs = [
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hardware.neuralnetworks@1.3"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libfmq"
        "libhidlbase"
        "libhidlmemory"
        "libnativewindow"
    ];
    whole_static_libs = [
        "libarect"
    ];
    cflags = [
        "-DTF_LITE_DISABLE_X86_NEON"
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-extern-c-compat"
        "-Wno-invalid-partial-specialization"
        "-Wno-sign-compare"
        "-Wno-unused-local-typedef"
        "-Wno-unused-parameter"
        "-Wno-unused-private-field"
        "-Wno-unused-variable"
    ];
};

libneuralnetworks_common = cc_library_static {
    name = "libneuralnetworks_common";
    defaults = [
        "neuralnetworks_defaults"
        "neuralnetworks_operations"
    ];
    apex_available = [
        "//apex_available:platform"
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
    ];
    host_supported = false;
    vendor_available = true;
    #  b/109953668, disable OpenMP
    #  openmp: true,
    export_include_dirs = [
        "include"
    ];
    srcs = [
        "BufferTracker.cpp"
        "CpuExecutor.cpp"
        "ExecutionBurstController.cpp"
        "ExecutionBurstServer.cpp"
        "GraphDump.cpp"
        "IndexedShapeWrapper.cpp"
        "MemoryUtils.cpp"
        "MetaModel.cpp"
        "OperationsUtils.cpp"
        "QuantUtils.cpp"
        "TokenHasher.cpp"
        "Utils.cpp"
        "ValidateHal.cpp"
        "operations/ArgMinMax.cpp"
        "operations/BidirectionalSequenceLSTM.cpp"
        "operations/Cast.cpp"
        "operations/EmbeddingLookup.cpp"
        "operations/ExpandDims.cpp"
        "operations/GroupedConv2D.cpp"
        "operations/HashtableLookup.cpp"
        "operations/LSHProjection.cpp"
        "operations/LSTM.cpp"
        "operations/MaximumMinimum.cpp"
        "operations/Multinomial.cpp"
        "operations/Pow.cpp"
        "operations/QuantizedLSTM.cpp"
        "operations/RNN.cpp"
        "operations/Reshape.cpp"
        "operations/SVDF.cpp"
        "operations/SimpleMath.cpp"
        "operations/Split.cpp"
        "operations/Tile.cpp"
    ];
    shared_libs = [
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hardware.neuralnetworks@1.3"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libbase"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libhidlmemory"
        "liblog"
        "libnativewindow"
        "libutils"
    ];
    header_libs = [
        "gemmlowp_headers"
        "libeigen"
        "libneuralnetworks_headers"
        "libtextclassifier_hash_headers"
        "philox_random_headers"
        "tensorflow_headers"
    ];
    whole_static_libs = [
        "libarect"
        "libtflite_kernel_utils"
        "philox_random"
    ];
    static_libs = [
        "libcrypto_static"
        "libtextclassifier_hash_static"
    ];
    cflags = [
        "-DNAMESPACE_FOR_HASH_FUNCTIONS=farmhash"
        "-DNN_INCLUDE_CPU_IMPLEMENTATION"
        "-DTF_LITE_DISABLE_X86_NEON"
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-array-bounds"
        "-Wno-extern-c-compat"
        "-Wno-invalid-partial-specialization"
        "-Wno-sign-compare"
        "-Wno-unused-local-typedef"
        "-Wno-unused-parameter"
        "-Wno-unused-private-field"
        "-Wno-unused-variable"
    ];
};

NeuralNetworksTest_common = cc_defaults {
    name = "NeuralNetworksTest_common";
    defaults = ["neuralnetworks_float16"];
    shared_libs = [
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libhidlbase"
        "libhidlmemory"
        "libnativewindow"
        "libneuralnetworks"
        "libneuralnetworks_packageinfo"
    ];
    static_libs = [
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hardware.neuralnetworks@1.3"
        "libbase"
        "libgmock"
        "liblog"
        "libneuralnetworks_common"
    ];
    cflags = [
        "-Wno-extern-c-compat"
    ];
    local_include_dirs = ["include"];
};

NeuralNetworksTest_operations = cc_test {
    name = "NeuralNetworksTest_operations";
    defaults = ["NeuralNetworksTest_common"];
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
    header_libs = [
        "gemmlowp_headers"
        "libeigen"
        "philox_random_headers"
        "tensorflow_headers"
    ];
    cflags = [
        "-Wno-invalid-partial-specialization"
        "-Wno-unused-parameter"
    ];
};

NeuralNetworksTest_utils = cc_test {
    name = "NeuralNetworksTest_utils";
    defaults = ["NeuralNetworksTest_common"];
    srcs = [
        "UtilsTest.cpp"
    ];
    header_libs = [
        "gemmlowp_headers"
        "libeigen"
        "tensorflow_headers"
    ];
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];
    test_suites = [
        "general-tests"
    ];
};

NeuralNetworksTest_logtag = cc_test {
    name = "NeuralNetworksTest_logtag";
    defaults = ["NeuralNetworksTest_common"];
    srcs = [
        "LogTagTest.cpp"
        "LogTagTestExtra.cpp"
    ];
};

in { inherit NeuralNetworksTest_common NeuralNetworksTest_logtag NeuralNetworksTest_operations NeuralNetworksTest_utils libneuralnetworks_common libneuralnetworks_common_headers libneuralnetworks_utils neuralnetworks_operations; }
