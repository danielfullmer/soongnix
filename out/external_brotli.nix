{ cc_binary, cc_library_static, java_library }:
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
#

libbrotli = cc_library_static {
    name = "libbrotli";
    host_supported = true;
    vendor_available = true;
    recovery_available = true;

    apex_available = [
        "//apex_available:platform"
        "com.android.adbd"
    ];

    visibility = [
        "//bootable/recovery:__subpackages__"
        "//external/bsdiff:__subpackages__"
        "//external/puffin:__subpackages__"
        "//system/core/adb:__subpackages__"
        "//system/update_engine:__subpackages__"
    ];

    cflags = [
        "-Werror"
        "-O2"
    ];
    export_include_dirs = ["c/include"];
    srcs = [
        "c/common/dictionary.c"
        "c/common/transform.c"
        "c/dec/bit_reader.c"
        "c/dec/decode.c"
        "c/dec/huffman.c"
        "c/dec/state.c"
        "c/enc/backward_references.c"
        "c/enc/backward_references_hq.c"
        "c/enc/bit_cost.c"
        "c/enc/block_splitter.c"
        "c/enc/brotli_bit_stream.c"
        "c/enc/cluster.c"
        "c/enc/compress_fragment.c"
        "c/enc/compress_fragment_two_pass.c"
        "c/enc/dictionary_hash.c"
        "c/enc/encode.c"
        "c/enc/encoder_dict.c"
        "c/enc/entropy_encode.c"
        "c/enc/histogram.c"
        "c/enc/literal_cost.c"
        "c/enc/memory.c"
        "c/enc/metablock.c"
        "c/enc/static_dict.c"
        "c/enc/utf8_util.c"
    ];
    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
        };
    };
    stl = "none";
};

brotli = cc_binary {
    name = "brotli";
    host_supported = true;
    cflags = ["-Werror"];
    srcs = ["c/tools/brotli.c"];
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
    static_libs = ["libbrotli"];
};

#
#  Support for brotli in java code.
#

brotli-java = java_library {
    name = "brotli-java";
    host_supported = true;
    hostdex = true;
    srcs = [
        "java/org/brotli/dec/BitReader.java"
        "java/org/brotli/dec/BitReaderTest.java"
        "java/org/brotli/dec/BrotliInputStream.java"
        "java/org/brotli/dec/BrotliRuntimeException.java"
        "java/org/brotli/dec/Context.java"
        "java/org/brotli/dec/Decode.java"
        "java/org/brotli/dec/DecodeTest.java"
        "java/org/brotli/dec/Dictionary.java"
        "java/org/brotli/dec/DictionaryData.java"
        "java/org/brotli/dec/DictionaryTest.java"
        "java/org/brotli/dec/EagerStreamTest.java"
        "java/org/brotli/dec/Huffman.java"
        "java/org/brotli/dec/SetDictionaryTest.java"
        "java/org/brotli/dec/State.java"
        "java/org/brotli/dec/SynthTest.java"
        "java/org/brotli/dec/Transform.java"
        "java/org/brotli/dec/TransformTest.java"
        "java/org/brotli/dec/Utils.java"
        "java/org/brotli/integration/BrotliJniTestBase.java"
        "java/org/brotli/integration/BundleChecker.java"
        "java/org/brotli/integration/BundleHelper.java"
        "java/org/brotli/wrapper/common/BrotliCommon.java"
        "java/org/brotli/wrapper/common/CommonJNI.java"
        "java/org/brotli/wrapper/common/SetRfcDictionaryTest.java"
        "java/org/brotli/wrapper/common/SetZeroDictionaryTest.java"
        "java/org/brotli/wrapper/dec/BrotliDecoderChannel.java"
        "java/org/brotli/wrapper/dec/BrotliDecoderChannelTest.java"
        "java/org/brotli/wrapper/dec/BrotliInputStream.java"
        "java/org/brotli/wrapper/dec/BrotliInputStreamTest.java"
        "java/org/brotli/wrapper/dec/Decoder.java"
        "java/org/brotli/wrapper/dec/DecoderJNI.java"
        "java/org/brotli/wrapper/dec/DecoderTest.java"
        "java/org/brotli/wrapper/dec/EagerStreamTest.java"
        "java/org/brotli/wrapper/enc/BrotliEncoderChannel.java"
        "java/org/brotli/wrapper/enc/BrotliEncoderChannelTest.java"
        "java/org/brotli/wrapper/enc/BrotliOutputStream.java"
        "java/org/brotli/wrapper/enc/BrotliOutputStreamTest.java"
        "java/org/brotli/wrapper/enc/EmptyInputTest.java"
        "java/org/brotli/wrapper/enc/Encoder.java"
        "java/org/brotli/wrapper/enc/EncoderJNI.java"
        "java/org/brotli/wrapper/enc/EncoderTest.java"
    ];
    exclude_srcs = [
        "java/org/brotli/dec/BitReaderTest.java"
        "java/org/brotli/dec/DecodeTest.java"
        "java/org/brotli/dec/DictionaryTest.java"
        "java/org/brotli/dec/EagerStreamTest.java"
        "java/org/brotli/dec/SetDictionaryTest.java"
        "java/org/brotli/dec/SynthTest.java"
        "java/org/brotli/dec/TransformTest.java"
        "java/org/brotli/wrapper/common/SetRfcDictionaryTest.java"
        "java/org/brotli/wrapper/common/SetZeroDictionaryTest.java"
        "java/org/brotli/wrapper/dec/BrotliDecoderChannelTest.java"
        "java/org/brotli/wrapper/dec/BrotliInputStreamTest.java"
        "java/org/brotli/wrapper/dec/DecoderTest.java"
        "java/org/brotli/wrapper/dec/EagerStreamTest.java"
        "java/org/brotli/wrapper/enc/BrotliEncoderChannelTest.java"
        "java/org/brotli/wrapper/enc/BrotliOutputStreamTest.java"
        "java/org/brotli/wrapper/enc/EmptyInputTest.java"
        "java/org/brotli/wrapper/enc/EncoderTest.java"
    ];
    sdk_version = "current";
};

in { inherit brotli brotli-java libbrotli; }
