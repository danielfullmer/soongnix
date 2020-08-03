{ cc_defaults, cc_library_shared, cc_library_static }:
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

tflite_defaults = cc_defaults {
    name = "tflite_defaults";
    header_libs = [
        "tensorflow_headers"
    ];
    cflags = [
        "-DTF_LITE_DISABLE_X86_NEON"
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
    ];
    shared_libs = [
        "liblog"
    ];
};

libtflite_context = cc_library_static {
    name = "libtflite_context";
    defaults = ["tflite_defaults"];
    srcs = ["c/c_api_internal.c"];
    cflags = [
        "-Wno-typedef-redefinition"
        "-Wno-visibility"
    ];
};

libtflite_framework = cc_library_static {
    name = "libtflite_framework";
    defaults = ["tflite_defaults"];
    rtti = true;
    srcs = [
        "allocation.cc"
        "arena_planner.cc"
        "core/api/error_reporter.cc"
        "core/api/flatbuffer_conversions.cc"
        "core/api/op_resolver.cc"
        "core/subgraph.cc"
        "graph_info.cc"
        "interpreter.cc"
        "minimal_logging.cc"
        "minimal_logging_android.cc"
        "mmap_allocation.cc"
        "model.cc"
        "mutable_op_resolver.cc"
        "nnapi_delegate.cc"
        "nnapi/nnapi_implementation.cc"
        "optional_debug_tools.cc"
        "simple_memory_arena.cc"
        "stderr_reporter.cc"
        "string_util.cc"
        "util.cc"
        "kernels/eigen_support.cc"
        "kernels/gemm_support.cc"
    ];
    header_libs = [
        "libeigen"
        "flatbuffer_headers"
        "gemmlowp_headers"
    ];
    cflags = [
        "-Wno-deprecated-declarations"
        "-Wno-extern-c-compat"
        "-Wno-ignored-attributes"
        "-Wno-invalid-partial-specialization"
        "-Wno-mismatched-tags"
        "-Wno-sign-compare"
        "-Wno-unused-lambda-capture"
    ];
};

libtflite = cc_library_shared {
    name = "libtflite";
    defaults = ["tflite_defaults"];
    shared_libs = [
        "libtextclassifier_hash"
    ];
    whole_static_libs = [
        "libtflite_context"
        "libtflite_framework"
        "libtflite_kernels"
    ];
    stl = "libc++_static";
};

build = [
    "tflite_static.bp"
];

subdirs = ["kernels"];

in { inherit libtflite libtflite_context libtflite_framework tflite_defaults; }
