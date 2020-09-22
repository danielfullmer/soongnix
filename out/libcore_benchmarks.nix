{ java_test }:
let

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

benchmarks = java_test {
    name = "benchmarks";
    srcs = [
        "src/benchmarks/AdditionBenchmark.java"
        "src/benchmarks/ArrayCopyBenchmark.java"
        "src/benchmarks/ArrayIterationBenchmark.java"
        "src/benchmarks/ArrayListIterationBenchmark.java"
        "src/benchmarks/BufferedZipFileBenchmark.java"
        "src/benchmarks/ClassLoaderResourceBenchmark.java"
        "src/benchmarks/CloneBenchmark.java"
        "src/benchmarks/DeepArrayOpsBenchmark.java"
        "src/benchmarks/FieldAccessBenchmark.java"
        "src/benchmarks/Foo.java"
        "src/benchmarks/GetSystemPropertyBenchmark.java"
        "src/benchmarks/HashedCollectionsBenchmark.java"
        "src/benchmarks/ImtConflictBenchmark.java"
        "src/benchmarks/InvokeInterface.java"
        "src/benchmarks/MethodInvocationBenchmark.java"
        "src/benchmarks/MultiplicationBenchmark.java"
        "src/benchmarks/ReferenceBenchmark.java"
        "src/benchmarks/ReferenceGetBenchmark.java"
        "src/benchmarks/SmallBigIntegerBenchmark.java"
        "src/benchmarks/StringDexCacheBenchmark.java"
        "src/benchmarks/StringIterationBenchmark.java"
        "src/benchmarks/SystemArrayCopyBenchmark.java"
        "src/benchmarks/VirtualVersusInterfaceBenchmark.java"
        "src/benchmarks/XmlParseBenchmark.java"
        "src/benchmarks/XmlSerializeBenchmark.java"
        "src/benchmarks/ZipFileBenchmark.java"
        "src/benchmarks/ZipFileReadBenchmark.java"
        "src/benchmarks/regression/AnnotatedElementBenchmark.java"
        "src/benchmarks/regression/BidiBenchmark.java"
        "src/benchmarks/regression/BigIntegerBenchmark.java"
        "src/benchmarks/regression/BitSetBenchmark.java"
        "src/benchmarks/regression/BreakIteratorBenchmark.java"
        "src/benchmarks/regression/ByteBufferBenchmark.java"
        "src/benchmarks/regression/ByteBufferBulkBenchmark.java"
        "src/benchmarks/regression/ByteBufferScalarVersusVectorBenchmark.java"
        "src/benchmarks/regression/CharacterBenchmark.java"
        "src/benchmarks/regression/CharsetBenchmark.java"
        "src/benchmarks/regression/CharsetForNameBenchmark.java"
        "src/benchmarks/regression/CharsetUtf8Benchmark.java"
        "src/benchmarks/regression/ChecksumBenchmark.java"
        "src/benchmarks/regression/CipherBenchmark.java"
        "src/benchmarks/regression/CipherInputStreamBenchmark.java"
        "src/benchmarks/regression/CollatorBenchmark.java"
        "src/benchmarks/regression/CollectionsBenchmark.java"
        "src/benchmarks/regression/DateFormatBenchmark.java"
        "src/benchmarks/regression/DecimalFormatBenchmark.java"
        "src/benchmarks/regression/DecimalFormatSymbolsBenchmark.java"
        "src/benchmarks/regression/DefaultCharsetBenchmark.java"
        "src/benchmarks/regression/DnsBenchmark.java"
        "src/benchmarks/regression/DoPrivilegedBenchmark.java"
        "src/benchmarks/regression/DoubleBenchmark.java"
        "src/benchmarks/regression/EqualsHashCodeBenchmark.java"
        "src/benchmarks/regression/ExpensiveObjectsBenchmark.java"
        "src/benchmarks/regression/FileBenchmark.java"
        "src/benchmarks/regression/FloatBenchmark.java"
        "src/benchmarks/regression/FormatterBenchmark.java"
        "src/benchmarks/regression/HostnameVerifierBenchmark.java"
        "src/benchmarks/regression/IdnBenchmark.java"
        "src/benchmarks/regression/IntConstantDivisionBenchmark.java"
        "src/benchmarks/regression/IntConstantMultiplicationBenchmark.java"
        "src/benchmarks/regression/IntConstantRemainderBenchmark.java"
        "src/benchmarks/regression/IntegerBenchmark.java"
        "src/benchmarks/regression/IntegralToStringBenchmark.java"
        "src/benchmarks/regression/JarFileBenchmark.java"
        "src/benchmarks/regression/KeyPairGeneratorBenchmark.java"
        "src/benchmarks/regression/LoopingBackwardsBenchmark.java"
        "src/benchmarks/regression/MathBenchmark.java"
        "src/benchmarks/regression/MessageDigestBenchmark.java"
        "src/benchmarks/regression/MutableIntBenchmark.java"
        "src/benchmarks/regression/NativeMethodBenchmark.java"
        "src/benchmarks/regression/NumberFormatBenchmark.java"
        "src/benchmarks/regression/PriorityQueueBenchmark.java"
        "src/benchmarks/regression/PropertyAccessBenchmark.java"
        "src/benchmarks/regression/ProviderBenchmark.java"
        "src/benchmarks/regression/R.java"
        "src/benchmarks/regression/RandomBenchmark.java"
        "src/benchmarks/regression/RealToStringBenchmark.java"
        "src/benchmarks/regression/ReflectionBenchmark.java"
        "src/benchmarks/regression/SSLLoopbackBenchmark.java"
        "src/benchmarks/regression/SSLSocketBenchmark.java"
        "src/benchmarks/regression/SSLSocketFactoryBenchmark.java"
        "src/benchmarks/regression/SchemePrefixBenchmark.java"
        "src/benchmarks/regression/SerializationBenchmark.java"
        "src/benchmarks/regression/SignatureBenchmark.java"
        "src/benchmarks/regression/SimpleDateFormatBenchmark.java"
        "src/benchmarks/regression/StrictMathBenchmark.java"
        "src/benchmarks/regression/StringBenchmark.java"
        "src/benchmarks/regression/StringBuilderBenchmark.java"
        "src/benchmarks/regression/StringEqualsBenchmark.java"
        "src/benchmarks/regression/StringIsEmptyBenchmark.java"
        "src/benchmarks/regression/StringLengthBenchmark.java"
        "src/benchmarks/regression/StringReplaceAllBenchmark.java"
        "src/benchmarks/regression/StringReplaceBenchmark.java"
        "src/benchmarks/regression/StringSplitBenchmark.java"
        "src/benchmarks/regression/StringToBytesBenchmark.java"
        "src/benchmarks/regression/StringToRealBenchmark.java"
        "src/benchmarks/regression/ThreadLocalBenchmark.java"
        "src/benchmarks/regression/TimeZoneBenchmark.java"
        "src/benchmarks/regression/URLConnectionBenchmark.java"
        "src/benchmarks/regression/XmlEntitiesBenchmark.java"
    ];
    static_libs = [
        "mockwebserver"
        "core-tests-support"
    ];
    sdk_version = "none";
    system_modules = "core-all-system-modules";
    libs = [
        "caliper-api-target"
        "android.test.base"
    ];
};

in { inherit benchmarks; }
