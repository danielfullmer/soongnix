{ java_import_host, java_library_host, package }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

_missingName = package {
    default_visibility = ["//visibility:private"];
};

#  Host prebuilt dependencies.
#  ============================================================

"currysrc_org.eclipse" = java_import_host {
    name = "currysrc_org.eclipse";
    jars = [
        "libs/org.eclipse.core.contenttype_3.7.0.v20180426-1644.jar"
        "libs/org.eclipse.core.jobs_3.10.0.v20180427-1454.jar"
        "libs/org.eclipse.core.resources_3.13.0.v20180512-1138.jar"
        "libs/org.eclipse.core.runtime_3.14.0.v20180417-0825.jar"
        "libs/org.eclipse.equinox.common_3.10.0.v20180412-1130.jar"
        "libs/org.eclipse.equinox.preferences_3.7.100.v20180510-1129.jar"
        "libs/org.eclipse.jdt.core_3.14.0.v20180528-0519.jar"
        "libs/org.eclipse.osgi_3.13.0.v20180409-1500.jar"
        "libs/org.eclipse.text_3.6.300.v20180430-1330.jar"
    ];
    #  Remove signature files found in META-INF/ that cause the combined jar to be rejected.
    #  http://b/111389216
    exclude_files = [
        "META-INF/ECLIPSE_.SF"
        "META-INF/ECLIPSE_.RSA"
    ];
};

#  build currysrc jar
#  ============================================================

currysrc = java_library_host {
    name = "currysrc";
    visibility = [
        "//external/icu/tools/srcgen"
    ];
    static_libs = [
        "currysrc_org.eclipse"
        "guavalib"
        "gson-prebuilt-jar"
        "jopt-simple-4.9"
    ];
    srcs = [
        "src/main/java/com/google/currysrc/Main.java"
        "src/main/java/com/google/currysrc/aosp/Annotations.java"
        "src/main/java/com/google/currysrc/aosp/RepackagingTransform.java"
        "src/main/java/com/google/currysrc/aosp/package-info.java"
        "src/main/java/com/google/currysrc/api/RuleSet.java"
        "src/main/java/com/google/currysrc/api/Rules.java"
        "src/main/java/com/google/currysrc/api/input/CompoundDirectoryInputFileGenerator.java"
        "src/main/java/com/google/currysrc/api/input/DirectoryInputFileGenerator.java"
        "src/main/java/com/google/currysrc/api/input/FilesInputFileGenerator.java"
        "src/main/java/com/google/currysrc/api/input/InputFileGenerator.java"
        "src/main/java/com/google/currysrc/api/match/SourceMatcher.java"
        "src/main/java/com/google/currysrc/api/match/SourceMatchers.java"
        "src/main/java/com/google/currysrc/api/match/TypeName.java"
        "src/main/java/com/google/currysrc/api/output/BasicOutputSourceFileGenerator.java"
        "src/main/java/com/google/currysrc/api/output/NullOutputSourceFileGenerator.java"
        "src/main/java/com/google/currysrc/api/output/OutputSourceFileGenerator.java"
        "src/main/java/com/google/currysrc/api/process/Context.java"
        "src/main/java/com/google/currysrc/api/process/DefaultRule.java"
        "src/main/java/com/google/currysrc/api/process/JavadocUtils.java"
        "src/main/java/com/google/currysrc/api/process/Processor.java"
        "src/main/java/com/google/currysrc/api/process/Reporter.java"
        "src/main/java/com/google/currysrc/api/process/Rule.java"
        "src/main/java/com/google/currysrc/api/process/Rules.java"
        "src/main/java/com/google/currysrc/api/process/ast/AstNodes.java"
        "src/main/java/com/google/currysrc/api/process/ast/BodyDeclarationLocator.java"
        "src/main/java/com/google/currysrc/api/process/ast/BodyDeclarationLocatorStore.java"
        "src/main/java/com/google/currysrc/api/process/ast/BodyDeclarationLocators.java"
        "src/main/java/com/google/currysrc/api/process/ast/ChangeLog.java"
        "src/main/java/com/google/currysrc/api/process/ast/EnumConstantLocator.java"
        "src/main/java/com/google/currysrc/api/process/ast/FieldLocator.java"
        "src/main/java/com/google/currysrc/api/process/ast/MethodLocator.java"
        "src/main/java/com/google/currysrc/api/process/ast/PackageMatcher.java"
        "src/main/java/com/google/currysrc/api/process/ast/ParameterMatcher.java"
        "src/main/java/com/google/currysrc/api/process/ast/StartPositionComparator.java"
        "src/main/java/com/google/currysrc/api/process/ast/TypeLocator.java"
        "src/main/java/com/google/currysrc/processors/AddAnnotation.java"
        "src/main/java/com/google/currysrc/processors/AddDefaultConstructor.java"
        "src/main/java/com/google/currysrc/processors/AnnotationInfo.java"
        "src/main/java/com/google/currysrc/processors/BaseJavadocNodeScanner.java"
        "src/main/java/com/google/currysrc/processors/BaseJavadocTagClasses.java"
        "src/main/java/com/google/currysrc/processors/BaseJavadocTagJavadoc.java"
        "src/main/java/com/google/currysrc/processors/BaseModifyCommentScanner.java"
        "src/main/java/com/google/currysrc/processors/BaseTagElementNodeScanner.java"
        "src/main/java/com/google/currysrc/processors/HidePublicClasses.java"
        "src/main/java/com/google/currysrc/processors/InsertHeader.java"
        "src/main/java/com/google/currysrc/processors/ModifyQualifiedNames.java"
        "src/main/java/com/google/currysrc/processors/ModifyStringLiterals.java"
        "src/main/java/com/google/currysrc/processors/RemoveJavaDocTags.java"
        "src/main/java/com/google/currysrc/processors/RenamePackage.java"
        "src/main/java/com/google/currysrc/processors/ReplaceTextCommentScanner.java"
    ];
};

in { inherit "currysrc_org.eclipse" _missingName currysrc; }
