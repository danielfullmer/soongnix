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

#  Create a static version for apps to use.
libtflite_static = cc_library_static {
    name = "libtflite_static";
    sdk_version = "current";
    rtti = true;
    srcs = [
        "allocation.cc"
        "arena_planner.cc"
        "c/c_api_internal.c"
        "core/api/error_reporter.cc"
        "core/api/flatbuffer_conversions.cc"
        "core/api/op_resolver.cc"
        "core/subgraph.cc"
        "delegates/nnapi/nnapi_delegate.cc"
        "graph_info.cc"
        "interpreter.cc"
        "minimal_logging.cc"
        "minimal_logging_android.cc"
        "mmap_allocation.cc"
        "model.cc"
        "mutable_op_resolver.cc"
        "nnapi_delegate.cc"
        "optional_debug_tools.cc"
        "simple_memory_arena.cc"
        "stderr_reporter.cc"
        "string_util.cc"
        "util.cc"
        "kernels/elementwise.cc"
        "kernels/split.cc"
        "kernels/topk_v2.cc"
        "kernels/activations.cc"
        "kernels/add.cc"
        "kernels/add_n.cc"
        "kernels/arg_min_max.cc"
        "kernels/basic_rnn.cc"
        "kernels/batch_to_space_nd.cc"
        "kernels/bidirectional_sequence_lstm.cc"
        "kernels/bidirectional_sequence_rnn.cc"
        "kernels/cast.cc"
        "kernels/ceil.cc"
        "kernels/comparisons.cc"
        "kernels/concatenation.cc"
        "kernels/conv.cc"
        "kernels/depthwise_conv.cc"
        "kernels/dequantize.cc"
        "kernels/detection_postprocess.cc"
        "kernels/div.cc"
        "kernels/eigen_support.cc"
        "kernels/embedding_lookup.cc"
        "kernels/embedding_lookup_sparse.cc"
        "kernels/exp.cc"
        "kernels/expand_dims.cc"
        "kernels/fill.cc"
        "kernels/fake_quant.cc"
        "kernels/floor.cc"
        "kernels/floor_div.cc"
        "kernels/floor_mod.cc"
        "kernels/fully_connected.cc"
        "kernels/gather.cc"
        "kernels/gather_nd.cc"
        "kernels/gemm_support.cc"
        "kernels/hashtable_lookup.cc"
        "kernels/if.cc"
        "kernels/kernel_util.cc"
        "kernels/l2norm.cc"
        "kernels/local_response_norm.cc"
        "kernels/logical.cc"
        "kernels/lsh_projection.cc"
        "kernels/lstm.cc"
        "kernels/lstm_eval.cc"
        "kernels/maximum_minimum.cc"
        "kernels/mirror_pad.cc"
        "kernels/mul.cc"
        "kernels/neg.cc"
        "kernels/one_hot.cc"
        "kernels/pad.cc"
        "kernels/pack.cc"
        "kernels/pooling.cc"
        "kernels/pow.cc"
        "kernels/range.cc"
        "kernels/rank.cc"
        "kernels/reduce.cc"
        "kernels/register.cc"
        "kernels/register_ref.cc"
        "kernels/reshape.cc"
        "kernels/resize_bilinear.cc"
        "kernels/resize_nearest_neighbor.cc"
        "kernels/reverse.cc"
        "kernels/reverse_sequence.cc"
        "kernels/select.cc"
        "kernels/shape.cc"
        "kernels/skip_gram.cc"
        "kernels/slice.cc"
        "kernels/space_to_batch_nd.cc"
        "kernels/space_to_depth.cc"
        "kernels/sparse_to_dense.cc"
        "kernels/split_v.cc"
        "kernels/squeeze.cc"
        "kernels/squared_difference.cc"
        "kernels/strided_slice.cc"
        "kernels/sub.cc"
        "kernels/svdf.cc"
        "kernels/tile.cc"
        "kernels/transpose.cc"
        "kernels/transpose_conv.cc"
        "kernels/unidirectional_sequence_lstm.cc"
        "kernels/unidirectional_sequence_rnn.cc"
        "kernels/unique.cc"
        "kernels/unpack.cc"
        "kernels/where.cc"
        "kernels/while.cc"
        "kernels/zeros_like.cc"
        "kernels/internal/kernel_utils.cc"
        "kernels/internal/tensor_utils.cc"
        "kernels/internal/quantization_util.cc"
        "kernels/internal/reference/portable_tensor_utils.cc"
        "kernels/internal/optimized/neon_tensor_utils.cc"
        "nnapi/nnapi_implementation.cc"
    ];
    include_dirs = [
        "external/eigen"
        "external/flatbuffers/include"
        "external/gemmlowp"
        "external/libtextclassifier"
        "external/tensorflow"
    ];
    whole_static_libs = [
        "libtextclassifier_hash_static"
    ];
    cflags = [
        "-DTF_LITE_DISABLE_X86_NEON"
        "-DNAMESPACE_FOR_HASH_FUNCTIONS=farmhash"
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-array-bounds"
        "-Wno-deprecated-declarations"
        "-Wno-extern-c-compat"
        "-Wno-invalid-partial-specialization"
        "-Wno-mismatched-tags"
        "-Wno-missing-field-initializers"
        "-Wno-sign-compare"
        "-Wno-typedef-redefinition"
        "-Wno-unused-function"
        "-Wno-unused-lambda-capture"
        "-Wno-unused-local-typedef"
        "-Wno-unused-parameter"
        "-Wno-unused-private-field"
        "-Wno-unused-variable"
        "-Wno-invalid-partial-specialization"
        "-Wno-mismatched-tags"
        "-Wno-visibility"
    ];
    stl = "libc++_static";
};

in { inherit libtflite_static; }
