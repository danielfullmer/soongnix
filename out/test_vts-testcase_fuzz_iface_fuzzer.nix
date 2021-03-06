{ cc_binary, cc_library }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

libvts_proto_fuzzer = cc_library {
    name = "libvts_proto_fuzzer";
    srcs = [
        "ProtoFuzzerUtils.cpp"
        "ProtoFuzzerMutator.cpp"
        "ProtoFuzzerMutateFns.cpp"
        "ProtoFuzzerRunner.cpp"
        "ProtoFuzzerStats.cpp"
    ];
    include_dirs = [
        "test/vts/drivers/hal/common/include"
        "test/vts-testcase/fuzz/iface_fuzzer/include"
    ];
    shared_libs = [
        "libprotobuf-cpp-full"
        "libvintf"
        "libvts_common"
        "libvts_multidevice_proto"
        "libvts_proto_fuzzer_proto"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

vts_proto_fuzzer = cc_binary {
    name = "vts_proto_fuzzer";
    srcs = [
        "ProtoFuzzerMain.cpp"
    ];
    include_dirs = [
        "external/llvm/lib/Fuzzer"
        "test/vts/drivers/hal/common/include"
        "test/vts-testcase/fuzz/iface_fuzzer/include"
    ];
    shared_libs = [
        "libprotobuf-cpp-full"
        "libvintf"
        "libvts_common"
        "libvts_multidevice_proto"
        "libvts_proto_fuzzer_proto"
    ];
    static_libs = [
        "libFuzzer"
        "libvts_proto_fuzzer"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-macro-redefined"
        "-Wno-extra-tokens"
        "-Wno-c99-extensions"
        "-fno-omit-frame-pointer"
    ];
};

in { inherit libvts_proto_fuzzer vts_proto_fuzzer; }
