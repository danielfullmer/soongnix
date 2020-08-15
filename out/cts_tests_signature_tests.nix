{ java_test_host }:
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

signature-host-tests = java_test_host {
    name = "signature-host-tests";
    srcs = [
        "src/android/signature/cts/tests/AbstractApiCheckerTest.java"
        "src/android/signature/cts/tests/AnnotationCheckerTest.java"
        "src/android/signature/cts/tests/ApiComplianceCheckerTest.java"
        "src/android/signature/cts/tests/BufferedReaderLineSpliteratorTest.java"
        "src/android/signature/cts/tests/ByteBufferLineSpliteratorTest.java"
        "src/android/signature/cts/tests/LineSpliteratorTestBase.java"
        "src/android/signature/cts/tests/TestClassesProvider.java"
        "src/android/signature/cts/tests/data/AbstractClass.java"
        "src/android/signature/cts/tests/data/ApiAnnotation.java"
        "src/android/signature/cts/tests/data/ExtendedNormalInterface.java"
        "src/android/signature/cts/tests/data/FinalClass.java"
        "src/android/signature/cts/tests/data/ForciblyPublicizedPrivateClass.java"
        "src/android/signature/cts/tests/data/NormalClass.java"
        "src/android/signature/cts/tests/data/NormalException.java"
        "src/android/signature/cts/tests/data/NormalInterface.java"
        "src/android/signature/cts/tests/data/PrivateClass.java"
        "src/android/signature/cts/tests/data/PublicApiClass.java"
        "src/android/signature/cts/tests/data/PublicApiClassParent.java"
        "src/android/signature/cts/tests/data/SystemApiClass.java"
    ];
    static_libs = [
        "junit"
        "signature-hostside"
    ];
    test_suites = ["general-tests"];
};

in { inherit signature-host-tests; }
