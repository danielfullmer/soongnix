{ java_library }:
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

cts-signature-common = java_library {
    name = "cts-signature-common";
    visibility = [
        "//cts/tests/signature:__subpackages__"
    ];
    installable = false;
    srcs = [
        "src/android/signature/cts/ApiDocumentParser.java"
        "src/android/signature/cts/ApiParser.java"
        "src/android/signature/cts/CurrentApi.java"
        "src/android/signature/cts/DexMemberChecker.java"
        "src/android/signature/cts/VirtualPath.java"
        "src/android/signature/cts/XmlApiParser.java"

    ];
    static_libs = [
        "signature-common-javalib"
    ];
    sdk_version = "current";
};

in { inherit cts-signature-common; }
