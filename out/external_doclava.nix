{ droiddoc_exported_dir, java_library_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

droiddoc-templates-sdk = droiddoc_exported_dir {
    name = "droiddoc-templates-sdk";
    path = "res/assets/templates-sdk";
};

doclava = java_library_host {
    name = "doclava";
    srcs = [
        "src/com/google/doclava/AndroidAuxSource.java"
        "src/com/google/doclava/AndroidLinter.java"
        "src/com/google/doclava/AnnotationInstanceInfo.java"
        "src/com/google/doclava/AnnotationValueInfo.java"
        "src/com/google/doclava/ArtifactTagger.java"
        "src/com/google/doclava/AtLinksNavTree.java"
        "src/com/google/doclava/AttrTagInfo.java"
        "src/com/google/doclava/AttributeInfo.java"
        "src/com/google/doclava/AuxSource.java"
        "src/com/google/doclava/AuxTagInfo.java"
        "src/com/google/doclava/ClassInfo.java"
        "src/com/google/doclava/ClearPage.java"
        "src/com/google/doclava/CodeTagInfo.java"
        "src/com/google/doclava/Comment.java"
        "src/com/google/doclava/ContainerInfo.java"
        "src/com/google/doclava/Converter.java"
        "src/com/google/doclava/DocFile.java"
        "src/com/google/doclava/DocInfo.java"
        "src/com/google/doclava/Doclava.java"
        "src/com/google/doclava/Doclava2.java"
        "src/com/google/doclava/DoclavaDiff.java"
        "src/com/google/doclava/Errors.java"
        "src/com/google/doclava/FederatedSite.java"
        "src/com/google/doclava/FederationTagger.java"
        "src/com/google/doclava/FieldInfo.java"
        "src/com/google/doclava/Hierarchy.java"
        "src/com/google/doclava/InfoBuilder.java"
        "src/com/google/doclava/InheritedTags.java"
        "src/com/google/doclava/JarUtils.java"
        "src/com/google/doclava/KeywordEntry.java"
        "src/com/google/doclava/LinkReference.java"
        "src/com/google/doclava/Linter.java"
        "src/com/google/doclava/LiteralTagInfo.java"
        "src/com/google/doclava/MemberInfo.java"
        "src/com/google/doclava/MethodInfo.java"
        "src/com/google/doclava/NavTree.java"
        "src/com/google/doclava/PackageInfo.java"
        "src/com/google/doclava/PageMetadata.java"
        "src/com/google/doclava/ParamTagInfo.java"
        "src/com/google/doclava/ParameterInfo.java"
        "src/com/google/doclava/ParsedTagInfo.java"
        "src/com/google/doclava/Proofread.java"
        "src/com/google/doclava/Resolution.java"
        "src/com/google/doclava/Resolvable.java"
        "src/com/google/doclava/SampleCode.java"
        "src/com/google/doclava/SampleTagInfo.java"
        "src/com/google/doclava/Scoped.java"
        "src/com/google/doclava/SeeTagInfo.java"
        "src/com/google/doclava/SinceTagger.java"
        "src/com/google/doclava/Sorter.java"
        "src/com/google/doclava/SourcePositionInfo.java"
        "src/com/google/doclava/Stubs.java"
        "src/com/google/doclava/TagInfo.java"
        "src/com/google/doclava/TextTagInfo.java"
        "src/com/google/doclava/ThrowsTagInfo.java"
        "src/com/google/doclava/TodoFile.java"
        "src/com/google/doclava/TypeInfo.java"
        "src/com/google/doclava/apicheck/AbstractMethodInfo.java"
        "src/com/google/doclava/apicheck/ApiCheck.java"
        "src/com/google/doclava/apicheck/ApiFile.java"
        "src/com/google/doclava/apicheck/ApiInfo.java"
        "src/com/google/doclava/apicheck/ApiParseException.java"
        "src/com/google/doclava/apicheck/XmlApiFile.java"
        "src/com/google/doclava/parser/JavaLexer.java"
        "src/com/google/doclava/parser/JavaParser.java"
    ];
    static_libs = [
        "jsilver"
        "guava"
        "antlr-runtime"
        "tagsoup"
    ];
    use_tools_jar = true;
    java_resource_dirs = ["res"];
};

doclava-no-guava = java_library_host {
    name = "doclava-no-guava";
    srcs = [
        "src/com/google/doclava/AndroidAuxSource.java"
        "src/com/google/doclava/AndroidLinter.java"
        "src/com/google/doclava/AnnotationInstanceInfo.java"
        "src/com/google/doclava/AnnotationValueInfo.java"
        "src/com/google/doclava/ArtifactTagger.java"
        "src/com/google/doclava/AtLinksNavTree.java"
        "src/com/google/doclava/AttrTagInfo.java"
        "src/com/google/doclava/AttributeInfo.java"
        "src/com/google/doclava/AuxSource.java"
        "src/com/google/doclava/AuxTagInfo.java"
        "src/com/google/doclava/ClassInfo.java"
        "src/com/google/doclava/ClearPage.java"
        "src/com/google/doclava/CodeTagInfo.java"
        "src/com/google/doclava/Comment.java"
        "src/com/google/doclava/ContainerInfo.java"
        "src/com/google/doclava/Converter.java"
        "src/com/google/doclava/DocFile.java"
        "src/com/google/doclava/DocInfo.java"
        "src/com/google/doclava/Doclava.java"
        "src/com/google/doclava/Doclava2.java"
        "src/com/google/doclava/DoclavaDiff.java"
        "src/com/google/doclava/Errors.java"
        "src/com/google/doclava/FederatedSite.java"
        "src/com/google/doclava/FederationTagger.java"
        "src/com/google/doclava/FieldInfo.java"
        "src/com/google/doclava/Hierarchy.java"
        "src/com/google/doclava/InfoBuilder.java"
        "src/com/google/doclava/InheritedTags.java"
        "src/com/google/doclava/JarUtils.java"
        "src/com/google/doclava/KeywordEntry.java"
        "src/com/google/doclava/LinkReference.java"
        "src/com/google/doclava/Linter.java"
        "src/com/google/doclava/LiteralTagInfo.java"
        "src/com/google/doclava/MemberInfo.java"
        "src/com/google/doclava/MethodInfo.java"
        "src/com/google/doclava/NavTree.java"
        "src/com/google/doclava/PackageInfo.java"
        "src/com/google/doclava/PageMetadata.java"
        "src/com/google/doclava/ParamTagInfo.java"
        "src/com/google/doclava/ParameterInfo.java"
        "src/com/google/doclava/ParsedTagInfo.java"
        "src/com/google/doclava/Proofread.java"
        "src/com/google/doclava/Resolution.java"
        "src/com/google/doclava/Resolvable.java"
        "src/com/google/doclava/SampleCode.java"
        "src/com/google/doclava/SampleTagInfo.java"
        "src/com/google/doclava/Scoped.java"
        "src/com/google/doclava/SeeTagInfo.java"
        "src/com/google/doclava/SinceTagger.java"
        "src/com/google/doclava/Sorter.java"
        "src/com/google/doclava/SourcePositionInfo.java"
        "src/com/google/doclava/Stubs.java"
        "src/com/google/doclava/TagInfo.java"
        "src/com/google/doclava/TextTagInfo.java"
        "src/com/google/doclava/ThrowsTagInfo.java"
        "src/com/google/doclava/TodoFile.java"
        "src/com/google/doclava/TypeInfo.java"
        "src/com/google/doclava/apicheck/AbstractMethodInfo.java"
        "src/com/google/doclava/apicheck/ApiCheck.java"
        "src/com/google/doclava/apicheck/ApiFile.java"
        "src/com/google/doclava/apicheck/ApiInfo.java"
        "src/com/google/doclava/apicheck/ApiParseException.java"
        "src/com/google/doclava/apicheck/XmlApiFile.java"
        "src/com/google/doclava/parser/JavaLexer.java"
        "src/com/google/doclava/parser/JavaParser.java"
    ];
    libs = [
        "guava"
    ];
    static_libs = [
        "jsilver"
        "antlr-runtime"
        "tagsoup"
    ];
    use_tools_jar = true;
    java_resource_dirs = ["res"];
};

#  TODO: add a test target.
#  For now, you can run the unit tests thus:
#  vogar --classpath /usr/lib/jvm/java-6-sun/lib/tools.jar --classpath ../../out/host/common/obj/JAVA_LIBRARIES/antlr_intermediates/javalib.jar --sourcepath src/ --sourcepath ../jsilver/src/ --mode jvm test/doclava/ApiCheckTest.java

in { inherit doclava doclava-no-guava droiddoc-templates-sdk; }
