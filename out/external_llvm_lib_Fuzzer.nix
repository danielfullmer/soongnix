{ cc_library_static }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

libLLVMFuzzerNoMain = cc_library_static {
    name = "libLLVMFuzzerNoMain";
    host_supported = true;
    include_dirs = ["external/compiler-rt/include"];
    cflags = [
        "-W"
        "-Wall"
        "-Werror"
        "-Wno-unused-lambda-capture"
        "-Wno-unused-parameter"
    ];
    cpp_std = "gnu++11";
    srcs = [
        "FuzzerCrossOver.cpp"
        "FuzzerDriver.cpp"
        "FuzzerExtFunctionsDlsym.cpp"
        "FuzzerExtFunctionsWeak.cpp"
        "FuzzerIO.cpp"
        "FuzzerLoop.cpp"
        "FuzzerMain.cpp"
        "FuzzerMutate.cpp"
        "FuzzerSHA1.cpp"
        "FuzzerTracePC.cpp"
        "FuzzerTraceState.cpp"
        "FuzzerUtil.cpp"
    ];
    exclude_srcs = ["FuzzerMain.cpp"];
    sanitize = {
        address = false;
        coverage = false;
    };
};

libLLVMFuzzer = cc_library_static {
    name = "libLLVMFuzzer";
    host_supported = true;
    cflags = [
        "-W"
        "-Wall"
        "-Werror"
        "-Wno-unused-lambda-capture"
        "-Wno-unused-parameter"
    ];
    cpp_std = "gnu++11";
    srcs = ["FuzzerMain.cpp"];
    whole_static_libs = ["libLLVMFuzzerNoMain"];
    sanitize = {
        address = false;
        coverage = false;
    };
};

in { inherit libLLVMFuzzer libLLVMFuzzerNoMain; }
