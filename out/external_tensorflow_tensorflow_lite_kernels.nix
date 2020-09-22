{ cc_library_static }:
let

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

libtflite_kernel_utils = cc_library_static {
    name = "libtflite_kernel_utils";
    defaults = ["tflite_defaults"];
    vendor_available = true;
    apex_available = [
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
        "//apex_available:platform"
    ];
    srcs = [
        "kernel_util.cc"
        "internal/tensor_utils.cc"
        "internal/transpose_utils.cc"
        "internal/quantization_util.cc"
        "internal/reference/portable_tensor_utils.cc"
        "internal/optimized/neon_tensor_utils.cc"
        "internal/optimized/sse_tensor_utils.cc"
    ];
    header_libs = [
        "flatbuffer_headers"
        "gemmlowp_headers"
        "libeigen"
    ];
    cflags = [
        "-Wno-extern-c-compat"
        "-Wno-sign-compare"
        "-Wno-unused-function"
    ];
};

libtflite_kernels = cc_library_static {
    name = "libtflite_kernels";
    defaults = ["tflite_defaults"];
    srcs = [
        "activations.cc"
        "add.cc"
        "add_n.cc"
        "arg_min_max.cc"
        "basic_rnn.cc"
        "batch_to_space_nd.cc"
        "bidirectional_sequence_lstm.cc"
        "bidirectional_sequence_rnn.cc"
        "cast.cc"
        "ceil.cc"
        "comparisons.cc"
        "concatenation.cc"
        "conv.cc"
        "densify.cc"
        "depth_to_space.cc"
        "depthwise_conv.cc"
        "dequantize.cc"
        "detection_postprocess.cc"
        "div.cc"
        "elementwise.cc"
        "embedding_lookup.cc"
        "embedding_lookup_sparse.cc"
        "exp.cc"
        "expand_dims.cc"
        "fake_quant.cc"
        "fill.cc"
        "floor.cc"
        "floor_div.cc"
        "floor_mod.cc"
        "fully_connected.cc"
        "gather.cc"
        "gather_nd.cc"
        "hashtable_lookup.cc"
        "if.cc"
        "kernel_util.cc"
        "l2norm.cc"
        "local_response_norm.cc"
        "logical.cc"
        "lsh_projection.cc"
        "lstm.cc"
        "lstm_eval.cc"
        "matrix_diag.cc"
        "matrix_set_diag.cc"
        "maximum_minimum.cc"
        "mirror_pad.cc"
        "mul.cc"
        "neg.cc"
        "non_max_suppression.cc"
        "numeric_verify.cc"
        "one_hot.cc"
        "pad.cc"
        "pack.cc"
        "pooling.cc"
        "pow.cc"
        "quantize.cc"
        "range.cc"
        "rank.cc"
        "reduce.cc"
        "register.cc"
        "reverse.cc"
        "reverse_sequence.cc"
        "reshape.cc"
        "resize_bilinear.cc"
        "resize_nearest_neighbor.cc"
        "round.cc"
        "scatter_nd.cc"
        "segment_sum.cc"
        "select.cc"
        "shape.cc"
        "skip_gram.cc"
        "slice.cc"
        "space_to_batch_nd.cc"
        "space_to_depth.cc"
        "sparse_to_dense.cc"
        "split.cc"
        "split_v.cc"
        "squared_difference.cc"
        "squeeze.cc"
        "strided_slice.cc"
        "sub.cc"
        "svdf.cc"
        "tile.cc"
        "topk_v2.cc"
        "transpose.cc"
        "transpose_conv.cc"
        "unidirectional_sequence_lstm.cc"
        "unidirectional_sequence_rnn.cc"
        "unique.cc"
        "unpack.cc"
        "where.cc"
        "while.cc"
        "zeros_like.cc"
        "internal/kernel_utils.cc"
        "internal/tensor_utils.cc"
        "internal/transpose_utils.cc"
        "internal/quantization_util.cc"
        "internal/reference/portable_tensor_utils.cc"
        "internal/optimized/neon_tensor_utils.cc"
        "internal/optimized/sse_tensor_utils.cc"
    ];
    header_libs = [
        "flatbuffer_headers"
        "gemmlowp_headers"
        "libeigen"
        "libtextclassifier_hash_headers"
    ];
    cflags = [
        "-DNAMESPACE_FOR_HASH_FUNCTIONS=farmhash"
        "-Wno-array-bounds"
        "-Wno-extern-c-compat"
        "-Wno-invalid-partial-specialization"
        "-Wno-ignored-attributes"
        "-Wno-missing-field-initializers"
        "-Wno-sign-compare"
        "-Wno-unused-local-typedef"
        "-Wno-unused-function"
        "-Wno-unused-variable"
        "-Wno-unused-private-field"
        "-Wno-mismatched-tags"
    ];
};

in { inherit libtflite_kernel_utils libtflite_kernels; }
