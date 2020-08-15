{ java_library_host }:
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

#  dex-tools java library
#  ============================================================
dex-tools = java_library_host {
    name = "dex-tools";

    srcs = [
        "src/dex/reader/DexAnnotationAttributeImpl.java"
        "src/dex/reader/DexAnnotationImpl.java"
        "src/dex/reader/DexBuffer.java"
        "src/dex/reader/DexClassImpl.java"
        "src/dex/reader/DexEncodedAnnotationImpl.java"
        "src/dex/reader/DexEncodedValueImpl.java"
        "src/dex/reader/DexFieldImpl.java"
        "src/dex/reader/DexFileImpl.java"
        "src/dex/reader/DexFileReader.java"
        "src/dex/reader/DexMethodImpl.java"
        "src/dex/reader/DexParameterImpl.java"
        "src/dex/reader/TypeFormatter.java"
        "src/dex/structure/DexAnnotatedElement.java"
        "src/dex/structure/DexAnnotation.java"
        "src/dex/structure/DexAnnotationAttribute.java"
        "src/dex/structure/DexClass.java"
        "src/dex/structure/DexEncodedAnnotation.java"
        "src/dex/structure/DexEncodedValue.java"
        "src/dex/structure/DexEncodedValueType.java"
        "src/dex/structure/DexField.java"
        "src/dex/structure/DexFile.java"
        "src/dex/structure/DexInterface.java"
        "src/dex/structure/DexMethod.java"
        "src/dex/structure/DexParameter.java"
        "src/dex/structure/NamedElement.java"
        "src/dex/structure/WithModifiers.java"
    ];

    libs = ["dx"];
};

in { inherit dex-tools; }
