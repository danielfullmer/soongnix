{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsProtoTestCases = android_test {
    name = "CtsProtoTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/util/proto/cts/DebuggingTest.java"
        "src/android/util/proto/cts/EncodedBufferTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamBoolTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamBytesTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamDoubleTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamEnumTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamFixed32Test.java"
        "src/android/util/proto/cts/ProtoOutputStreamFixed64Test.java"
        "src/android/util/proto/cts/ProtoOutputStreamFloatTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamInt32Test.java"
        "src/android/util/proto/cts/ProtoOutputStreamInt64Test.java"
        "src/android/util/proto/cts/ProtoOutputStreamObjectTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamSFixed32Test.java"
        "src/android/util/proto/cts/ProtoOutputStreamSFixed64Test.java"
        "src/android/util/proto/cts/ProtoOutputStreamSInt32Test.java"
        "src/android/util/proto/cts/ProtoOutputStreamSInt64Test.java"
        "src/android/util/proto/cts/ProtoOutputStreamStringTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamSwitchedWriteTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamTagTest.java"
        "src/android/util/proto/cts/ProtoOutputStreamUInt32Test.java"
        "src/android/util/proto/cts/ProtoOutputStreamUInt64Test.java"
        "src/android/util/proto/cts/ProtoTests.java"
        "src/android/util/proto/cts/test.proto"
    ];
    proto = {
        type = "nano";
    };
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    # sdl_version: "current",
    platform_apis = true;
    libs = ["android.test.runner.stubs"];
    static_libs = ["ctstestrunner-axt"];
};

in { inherit CtsProtoTestCases; }
