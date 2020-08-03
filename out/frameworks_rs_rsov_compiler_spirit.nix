{ cc_defaults, cc_library_shared, cc_test_host, genrule, python_binary_host }:
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

spirit_defaults = cc_defaults {
    name = "spirit_defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];
    target = {
        host = {
            compile_multilib = "first";
        };
    };
    product_variables = {
        pdk = {
            enabled = false;
        };
        unbundled_build = {
            enabled = false;
        };
    };
};

libspirit_generate_py = python_binary_host {
    name = "libspirit_generate_py";
    main = "generate.py";
    srcs = ["generate.py"];
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

libspirit_gen = genrule {
    name = "libspirit_gen";
    tools = ["libspirit_generate_py"];
    cmd = "$(location libspirit_generate_py) $(location :spirv.core.grammar.json-1.1) " +
        "--instructions=$(location instructions_generated.h) " +
        "--types=$(location types_generated.h) " +
        "--opcodes=$(location opcodes_generated.h) " +
        "--instruction_dispatches=$(location instruction_dispatches_generated.h) " +
        "--enum_dispatches=$(location enum_dispatches_generated.h) " +
        "--type_inst_dispatches=$(location type_inst_dispatches_generated.h) " +
        "--const_inst_dispatches=$(location const_inst_dispatches_generated.h) " +
        "--factory_methods=$(location factory_methods_generated.h)";
    srcs = [":spirv.core.grammar.json-1.1"];
    out = [
        "instructions_generated.h"
        "types_generated.h"
        "opcodes_generated.h"
        "instruction_dispatches_generated.h"
        "enum_dispatches_generated.h"
        "type_inst_dispatches_generated.h"
        "const_inst_dispatches_generated.h"
        "factory_methods_generated.h"
    ];
};

# =====================================================================
#  Host and device shared library libspirit.so
# =====================================================================
libspirit = cc_library_shared {
    name = "libspirit";
    defaults = ["spirit_defaults"];
    host_supported = true;

    srcs = [
        "builder.cpp"
        "entity.cpp"
        "instructions.cpp"
        "module.cpp"
        "pass.cpp"
        "pass_queue.cpp"
        "transformer.cpp"
        "visitor.cpp"
        "word_stream.cpp"
        "word_stream_impl.cpp"
    ];

    generated_headers = ["libspirit_gen"];
    export_generated_headers = ["libspirit_gen"];

    export_include_dirs = ["."];

    target = {
        android = {
            cflags = ["-Wno-error=non-virtual-dtor"];
        };
    };
};

# =====================================================================
#  Tests for host module word_stream
# =====================================================================
word_stream_test = cc_test_host {
    name = "word_stream_test";
    defaults = ["spirit_defaults"];
    srcs = [
        "word_stream.cpp"
        "word_stream_impl.cpp"
        "word_stream_test.cpp"
    ];
    generated_headers = ["libspirit_gen"];
};

# =====================================================================
#  Tests for host module instructions
# =====================================================================

instructions_test = cc_test_host {
    name = "instructions_test";
    defaults = ["spirit_defaults"];
    srcs = [
        "entity.cpp"
        "instructions.cpp"
        "instructions_test.cpp"
        "visitor.cpp"
        "word_stream.cpp"
        "word_stream_impl.cpp"
    ];
    generated_headers = ["libspirit_gen"];
};

# =====================================================================
#  Tests for host module pass queue
# =====================================================================

pass_queue_test = cc_test_host {
    name = "pass_queue_test";
    defaults = ["spirit_defaults"];
    srcs = [
        "pass.cpp"
        "pass_queue.cpp"
        "pass_queue_test.cpp"
    ];
    shared_libs = ["libspirit"];
};

# =====================================================================
#  Tests for host shared library
# =====================================================================

libspirit_test = cc_test_host {
    name = "libspirit_test";
    defaults = ["spirit_defaults"];
    srcs = [
        "builder_test.cpp"
        "module_test.cpp"
        "transformer_test.cpp"
    ];
    shared_libs = ["libspirit"];
};

in { inherit instructions_test libspirit libspirit_gen libspirit_generate_py libspirit_test pass_queue_test spirit_defaults word_stream_test; }
