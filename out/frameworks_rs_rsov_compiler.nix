{ cc_binary, cc_test_host }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

# =====================================================================
#  Unit tests for Wrapper module
# =====================================================================

Wrapper_test = cc_test_host {
    name = "Wrapper_test";
    defaults = [
        "llvm-defaults"
        "spirit_defaults"
    ];

    srcs = [
        "Builtin.cpp"
        "Context.cpp"
        "GlobalAllocSPIRITPass.cpp"
        "RSAllocationUtils.cpp"
        "Wrapper.cpp"
        "Wrapper_test.cpp"
    ];

    shared_libs = [
        "libLLVM_android"
        "libbcinfo"
        "libspirit"
    ];
};

# =====================================================================
#  Unit tests for Builtin module
# =====================================================================

Builtin_test = cc_test_host {
    name = "Builtin_test";
    defaults = ["spirit_defaults"];

    srcs = [
        "Builtin.cpp"
        "Builtin_test.cpp"
    ];

    shared_libs = ["libspirit"];
};

# =====================================================================
#  Host and Device Executable rs2spirv
# =====================================================================

rs2spirv = cc_binary {
    name = "rs2spirv";
    defaults = [
        "llvm-defaults"
        "spirit_defaults"
    ];
    host_supported = true;
    device_supported = false;

    srcs = [
        "rs2spirv.cpp"
        "Builtin.cpp"
        "Context.cpp"
        "GlobalAllocPass.cpp"
        "GlobalAllocSPIRITPass.cpp"
        "GlobalMergePass.cpp"
        "InlinePreparationPass.cpp"
        "RemoveNonkernelsPass.cpp"
        "RSAllocationUtils.cpp"
        "RSSPIRVWriter.cpp"
        "Wrapper.cpp"
    ];

    #  TODO: fix the remaining warnings
    cflags = [
        "-D_SPIRV_LLVM_API"
        "-Wno-error=pessimizing-move"
        "-Wno-error=unused-variable"
        "-Wno-error=unused-private-field"
        "-Wno-error=unused-function"
        "-Wno-error=dangling-else"
        "-Wno-error=ignored-qualifiers"
        "-Wno-error=non-virtual-dtor"

        #  For debug builds
        # "-O0",
        # "-DRS2SPIRV_DEBUG=1",
    ];

    shared_libs = [
        "libLLVM_android"
        "libbcinfo"
        "libSPIRV"
        "libspirit"
    ];
};

in { inherit Builtin_test Wrapper_test rs2spirv; }
