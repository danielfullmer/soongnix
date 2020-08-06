{ cc_binary_host, cc_defaults, cc_library_headers, cc_library_host_static, llvm_tblgen }:
let

#
#  Copyright (C) 2010 The Android Open Source Project
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

rs-version = cc_defaults {
    name = "rs-version";
    cflags = [
        "-DRS_VERSION=24"
    ];
};

slang-defaults = cc_defaults {
    name = "slang-defaults";
    defaults = [
        "clang-defaults"
        "rs-version"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-std=c++11"

        "-D__DISABLE_ASSERTS"

        "-DTARGET_BUILD_VARIANT=user"
    ];

    product_variables = {
        debuggable = {
            cflags = [
                "-U__DISABLE_ASSERTS"

                "-UTARGET_BUILD_VARIANT"
                "-DTARGET_BUILD_VARIANT=userdebug"
            ];
        };
        eng = {
            cflags = [
                "-O0"
                "-D__ENABLE_INTERNAL_OPTIONS"

                "-UTARGET_BUILD_VARIANT"
                "-DTARGET_BUILD_VARIANT=eng"
            ];
        };
    };
};

static_libraries_needed_by_slang = [
    "libLLVMBitWriter_2_9"
    "libLLVMBitWriter_2_9_func"
    "libLLVMBitWriter_3_2"
    "libStripUnkAttr"
];

#  Exported header files
slang_headers = cc_library_headers {
    name = "slang_headers";
    vendor_available = true;
    export_include_dirs = ["."];
    host_supported = true;
    target = {
        windows = {
            enabled = true;
        };
    };
};

#  Static library libslang for host
#  ========================================================
libslang = cc_library_host_static {
    name = "libslang";
    defaults = ["slang-defaults"];
    compile_multilib = "first";

    target = {
        windows = {
            #  Skip missing-field-initializer warnings for mingw.
            cflags = ["-Wno-error=missing-field-initializers"];
        };
    };

    srcs = [
        "slang.cpp"
        "slang_bitcode_gen.cpp"
        "slang_backend.cpp"
        "slang_diagnostic_buffer.cpp"
    ];

    shared_libs = ["libbcinfo"];

    product_variables = {
        unbundled_build = {
            enabled = false;
        };
    };
};

#  ========================================================

llvm-rs-as = cc_binary_host {
    name = "llvm-rs-as";
    defaults = ["slang-defaults"];

    srcs = ["llvm-rs-as.cpp"];

    static_libs = ["libslang"] ++ static_libraries_needed_by_slang;
    shared_libs = ["libLLVM_android"];

    product_variables = {
        unbundled_build = {
            enabled = false;
        };
    };
};

#  Executable llvm-rs-cc for host
#  ========================================================

#  For build RSCCOptions.inc from RSCCOptions.td
slang-gen-options = llvm_tblgen {
    name = "slang-gen-options";
    in_ = "RSCCOptions.td";
    outs = ["RSCCOptions.inc"];
};

llvm-rs-cc = cc_binary_host {
    name = "llvm-rs-cc";
    defaults = ["slang-defaults"];

    generated_headers = ["slang-gen-options"];
    srcs = [
        "llvm-rs-cc.cpp"
        "rs_cc_options.cpp"
        "slang_rs_foreach_lowering.cpp"
        "slang_rs_ast_replace.cpp"
        "slang_rs_check_ast.cpp"
        "slang_rs_context.cpp"
        "slang_rs_pragma_handler.cpp"
        "slang_rs_exportable.cpp"
        "slang_rs_export_type.cpp"
        "slang_rs_export_element.cpp"
        "slang_rs_export_var.cpp"
        "slang_rs_export_func.cpp"
        "slang_rs_export_foreach.cpp"
        "slang_rs_export_reduce.cpp"
        "slang_rs_object_ref_count.cpp"
        "slang_rs_reflection.cpp"
        "slang_rs_reflection_cpp.cpp"
        "slang_rs_reflection_state.cpp"
        "slang_rs_reflect_utils.cpp"
        "slang_rs_special_func.cpp"
        "slang_rs_special_kernel_param.cpp"
    ];

    static_libs = ["libslang"] ++ static_libraries_needed_by_slang;

    shared_libs = [
        "libbcinfo"
        "libclang_android"
        "libLLVM_android"
    ];

    target = {
        windows = {
            host_ldlibs = [
                "-limagehlp"
                "-lpsapi"
            ];
            cflags = [
                #  Skip missing-field-initializer warnings for mingw.
                "-Wno-error=missing-field-initializers"
            ];
        };
    };

    product_variables = {
        unbundled_build = {
            enabled = false;
        };
    };
};

lld = cc_binary_host {
    name = "lld";
    srcs = ["lld_main.cpp"];
    ldflags = ["-static"];
    stl = "libc++_static";
    target = {
        darwin = {
            enabled = false;
        };
        linux = {
            enabled = false;
        };
        windows = {
            enabled = true;
        };
    };
};

subdirs = [
    "BitWriter_2_9"
    "BitWriter_2_9_func"
    "BitWriter_3_2"
    "StripUnkAttr"
];

in { inherit libslang lld llvm-rs-as llvm-rs-cc rs-version slang-defaults slang-gen-options slang_headers; }
