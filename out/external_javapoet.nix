{ java_library_host }:
let

#  Copyright 2018 The Android Open Source Project
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

javapoet = java_library_host {
    name = "javapoet";
    srcs = [
        "src/main/java/com/squareup/javapoet/AnnotationSpec.java"
        "src/main/java/com/squareup/javapoet/ArrayTypeName.java"
        "src/main/java/com/squareup/javapoet/ClassName.java"
        "src/main/java/com/squareup/javapoet/CodeBlock.java"
        "src/main/java/com/squareup/javapoet/CodeWriter.java"
        "src/main/java/com/squareup/javapoet/FieldSpec.java"
        "src/main/java/com/squareup/javapoet/JavaFile.java"
        "src/main/java/com/squareup/javapoet/LineWrapper.java"
        "src/main/java/com/squareup/javapoet/MethodSpec.java"
        "src/main/java/com/squareup/javapoet/NameAllocator.java"
        "src/main/java/com/squareup/javapoet/ParameterSpec.java"
        "src/main/java/com/squareup/javapoet/ParameterizedTypeName.java"
        "src/main/java/com/squareup/javapoet/TypeName.java"
        "src/main/java/com/squareup/javapoet/TypeSpec.java"
        "src/main/java/com/squareup/javapoet/TypeVariableName.java"
        "src/main/java/com/squareup/javapoet/Util.java"
        "src/main/java/com/squareup/javapoet/WildcardTypeName.java"
    ];
};

#  TODO(b/19776637): Add java_test_host

in { inherit javapoet; }
