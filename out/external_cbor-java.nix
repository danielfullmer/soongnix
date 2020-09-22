{ java_library }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

cbor-java = java_library {
    name = "cbor-java";

    srcs = [
        "src/main/java/co/nstant/in/cbor/CborBuilder.java"
        "src/main/java/co/nstant/in/cbor/CborDecoder.java"
        "src/main/java/co/nstant/in/cbor/CborEncoder.java"
        "src/main/java/co/nstant/in/cbor/CborException.java"
        "src/main/java/co/nstant/in/cbor/DataItemListener.java"
        "src/main/java/co/nstant/in/cbor/builder/AbstractBuilder.java"
        "src/main/java/co/nstant/in/cbor/builder/ArrayBuilder.java"
        "src/main/java/co/nstant/in/cbor/builder/ByteStringBuilder.java"
        "src/main/java/co/nstant/in/cbor/builder/MapBuilder.java"
        "src/main/java/co/nstant/in/cbor/builder/UnicodeStringBuilder.java"
        "src/main/java/co/nstant/in/cbor/decoder/AbstractDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/ArrayDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/ByteStringDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/DoublePrecisionFloatDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/HalfPrecisionFloatDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/MapDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/NegativeIntegerDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/SinglePrecisionFloatDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/SpecialDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/TagDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/UnicodeStringDecoder.java"
        "src/main/java/co/nstant/in/cbor/decoder/UnsignedIntegerDecoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/AbstractEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/ArrayEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/ByteStringEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/DoublePrecisionFloatEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/HalfPrecisionFloatEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/MapEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/NegativeIntegerEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/SinglePrecisionFloatEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/SpecialEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/TagEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/UnicodeStringEncoder.java"
        "src/main/java/co/nstant/in/cbor/encoder/UnsignedIntegerEncoder.java"
        "src/main/java/co/nstant/in/cbor/model/AbstractFloat.java"
        "src/main/java/co/nstant/in/cbor/model/AdditionalInformation.java"
        "src/main/java/co/nstant/in/cbor/model/Array.java"
        "src/main/java/co/nstant/in/cbor/model/ByteString.java"
        "src/main/java/co/nstant/in/cbor/model/ChunkableDataItem.java"
        "src/main/java/co/nstant/in/cbor/model/DataItem.java"
        "src/main/java/co/nstant/in/cbor/model/DoublePrecisionFloat.java"
        "src/main/java/co/nstant/in/cbor/model/HalfPrecisionFloat.java"
        "src/main/java/co/nstant/in/cbor/model/LanguageTaggedString.java"
        "src/main/java/co/nstant/in/cbor/model/MajorType.java"
        "src/main/java/co/nstant/in/cbor/model/Map.java"
        "src/main/java/co/nstant/in/cbor/model/NegativeInteger.java"
        "src/main/java/co/nstant/in/cbor/model/Number.java"
        "src/main/java/co/nstant/in/cbor/model/RationalNumber.java"
        "src/main/java/co/nstant/in/cbor/model/SimpleValue.java"
        "src/main/java/co/nstant/in/cbor/model/SimpleValueType.java"
        "src/main/java/co/nstant/in/cbor/model/SinglePrecisionFloat.java"
        "src/main/java/co/nstant/in/cbor/model/Special.java"
        "src/main/java/co/nstant/in/cbor/model/SpecialType.java"
        "src/main/java/co/nstant/in/cbor/model/Tag.java"
        "src/main/java/co/nstant/in/cbor/model/UnicodeString.java"
        "src/main/java/co/nstant/in/cbor/model/UnsignedInteger.java"
    ];

    sdk_version = "core_current";
};

in { inherit cbor-java; }
