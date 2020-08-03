{ cc_library }:
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

libbcc = cc_library {
    name = "libbcc";
    vendor_available = true;
    host_supported = true;
    defaults = ["libbcc-defaults"];

    srcs = [
        "BCCContext.cpp"
        "BCCContextImpl.cpp"
        "Compiler.cpp"
        "CompilerConfig.cpp"
        "FileBase.cpp"
        "Initialization.cpp"
        "RSAddDebugInfoPass.cpp"
        "RSCompilerDriver.cpp"
        "RSEmbedInfo.cpp"
        "RSGlobalInfoPass.cpp"
        "RSInvariant.cpp"
        "RSInvokeHelperPass.cpp"
        "RSIsThreadablePass.cpp"
        "RSKernelExpand.cpp"
        "RSScreenFunctionsPass.cpp"
        "RSScriptGroupFusion.cpp"
        "RSStubsWhiteList.cpp"
        "RSX86CallConvPass.cpp"
        "RSX86TranslateGEPPass.cpp"
        "Script.cpp"
        "Source.cpp"
    ];

    shared_libs = ["libbcinfo"];

    header_libs = ["slang_headers"];

    target = {
        windows = {
            enabled = true;
            shared_libs = ["libLLVM_android"];
        };
        darwin = {
            shared_libs = ["libLLVM_android"];
        };
        linux_glibc = {
            static_libs = ["libLLVMLinker"];
            allow_undefined_symbols = true;
        };
        host = {
            static_libs = [
                "libutils"
                "libcutils"
                "liblog"
            ];
        };
        android = {
            shared_libs = [
                "libLLVM_android"
                "libdl"
                "liblog"
            ];
        };
    };

    product_variables = {
        unbundled_build = {
            #  Don't build in unbundled branches
            enabled = false;
        };
    };
};

in { inherit libbcc; }
