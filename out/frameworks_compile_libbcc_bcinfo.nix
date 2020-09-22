{ cc_library_headers, cc_library_shared }:
let

#
#  Copyright (C) 2011-2012 The Android Open Source Project
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

libbcinfo = cc_library_shared {
    name = "libbcinfo";
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    host_supported = true;
    defaults = [
        "llvm-defaults"
        "rs-version"
    ];

    srcs = [
        "BitcodeTranslator.cpp"
        "BitcodeWrapper.cpp"
        "MetadataExtractor.cpp"
    ];

    cflags = [
        "-Wall"
        "-Wno-unused-parameter"
        "-Werror"

        "-D__DISABLE_ASSERTS"
    ];

    product_variables = {
        eng = {
            cflags = ["-U__DISABLE_ASSERTS"];
        };
    };

    header_libs = ["libbcinfo-headers"];
    export_header_lib_headers = ["libbcinfo-headers"];

    include_dirs = [
        "frameworks/rs"
        "frameworks/compile/slang"
        "frameworks/compile/libbcc/lib"
    ];

    static_libs = [
        "libLLVMWrap"
        "libLLVMBitReader_2_7"
        "libLLVMBitReader_3_0"
        "libLLVMBitWriter_3_2"
        "libStripUnkAttr"
    ];

    target = {
        windows = {
            enabled = true;
            shared_libs = ["libLLVM_android"];
        };
        darwin = {
            shared_libs = ["libLLVM_android"];
        };
        linux_glibc = {
            allow_undefined_symbols = true;
        };
        host = {
            compile_multilib = "first";
            static_libs = [
                "libcutils"
                "liblog"
            ];
            product_variables = {
                unbundled_build = {
                    #  don't build for unbundled branches
                    enabled = false;
                };
            };
        };
        android = {
            shared_libs = [
                "liblog"
            ];
            static_libs = [
                #  Statically link-in the required LLVM libraries
                "libLLVMBitReader"
                "libLLVMCore"
                "libLLVMSupport"
            ];
            #  Export only the symbols in the bcinfo namespace.  In particular,
            #  do not, export symbols from the LLVM libraries.
            version_script = "libbcinfo.map";
        };
    };
};

libbcinfo-headers = cc_library_headers {
    name = "libbcinfo-headers";
    vendor_available = true;
    host_supported = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    export_include_dirs = ["include"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

subdirs = [
    "BitReader_2_7"
    "BitReader_3_0"
    "tools"
    "Wrap"
];

in { inherit libbcinfo libbcinfo-headers; }
