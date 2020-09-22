{ java_library_static }:
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

signature-common-javalib = java_library_static {
    name = "signature-common-javalib";
    visibility = [
        "//cts/tests/signature:__subpackages__"
    ];
    host_supported = true;
    installable = false;
    srcs = [
        "src/android/signature/cts/AbstractApiChecker.java"
        "src/android/signature/cts/AnnotationChecker.java"
        "src/android/signature/cts/ApiComplianceChecker.java"
        "src/android/signature/cts/BufferedReaderLineSpliterator.java"
        "src/android/signature/cts/ByteBufferLineSpliterator.java"
        "src/android/signature/cts/ClassProvider.java"
        "src/android/signature/cts/DexApiDocumentParser.java"
        "src/android/signature/cts/DexField.java"
        "src/android/signature/cts/DexMember.java"
        "src/android/signature/cts/DexMethod.java"
        "src/android/signature/cts/ExcludingClassProvider.java"
        "src/android/signature/cts/FailureType.java"
        "src/android/signature/cts/InterfaceChecker.java"
        "src/android/signature/cts/JDiffClassDescription.java"
        "src/android/signature/cts/LogHelper.java"
        "src/android/signature/cts/ReflectionHelper.java"
        "src/android/signature/cts/ResultObserver.java"
    ];
    sdk_version = "current";
};

in { inherit signature-common-javalib; }
