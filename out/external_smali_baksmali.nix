{ genrule, java_binary_host }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

# create a new baksmali.properties file using the correct version
baksmali_version = genrule {
    name = "baksmali_version";
    srcs = [":smali_build.gradle"];
    out = ["baksmali.properties"];
    cmd = "echo \"application.version=$$(grep -o -e \"^version = '\\(.*\\)'\" $(in) | grep -o -e \"[0-9.]\\+\")-aosp\" > $(out)";
};

#  build baksmali jar
#  ============================================================

baksmali = java_binary_host {
    name = "baksmali";

    srcs = [
        "src/main/java/org/jf/baksmali/AnalysisArguments.java"
        "src/main/java/org/jf/baksmali/Baksmali.java"
        "src/main/java/org/jf/baksmali/BaksmaliOptions.java"
        "src/main/java/org/jf/baksmali/DeodexCommand.java"
        "src/main/java/org/jf/baksmali/DexInputCommand.java"
        "src/main/java/org/jf/baksmali/DisassembleCommand.java"
        "src/main/java/org/jf/baksmali/DumpCommand.java"
        "src/main/java/org/jf/baksmali/HelpCommand.java"
        "src/main/java/org/jf/baksmali/ListClassesCommand.java"
        "src/main/java/org/jf/baksmali/ListCommand.java"
        "src/main/java/org/jf/baksmali/ListDependenciesCommand.java"
        "src/main/java/org/jf/baksmali/ListDexCommand.java"
        "src/main/java/org/jf/baksmali/ListFieldOffsetsCommand.java"
        "src/main/java/org/jf/baksmali/ListFieldsCommand.java"
        "src/main/java/org/jf/baksmali/ListHelpCommand.java"
        "src/main/java/org/jf/baksmali/ListMethodsCommand.java"
        "src/main/java/org/jf/baksmali/ListReferencesCommand.java"
        "src/main/java/org/jf/baksmali/ListStringsCommand.java"
        "src/main/java/org/jf/baksmali/ListTypesCommand.java"
        "src/main/java/org/jf/baksmali/ListVtablesCommand.java"
        "src/main/java/org/jf/baksmali/Main.java"
        "src/main/java/org/jf/baksmali/Adaptors/AnnotationFormatter.java"
        "src/main/java/org/jf/baksmali/Adaptors/BlankMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/CatchMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/ClassDefinition.java"
        "src/main/java/org/jf/baksmali/Adaptors/CommentMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/CommentedOutMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/CommentingIndentingWriter.java"
        "src/main/java/org/jf/baksmali/Adaptors/EndTryLabelMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/FieldDefinition.java"
        "src/main/java/org/jf/baksmali/Adaptors/LabelMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/MethodDefinition.java"
        "src/main/java/org/jf/baksmali/Adaptors/MethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/PostInstructionRegisterInfoMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/PreInstructionRegisterInfoMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/ReferenceFormatter.java"
        "src/main/java/org/jf/baksmali/Adaptors/RegisterFormatter.java"
        "src/main/java/org/jf/baksmali/Adaptors/SyntheticAccessCommentMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Debug/BeginEpilogueMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Debug/DebugMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Debug/EndLocalMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Debug/EndPrologueMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Debug/LineNumberMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Debug/LocalFormatter.java"
        "src/main/java/org/jf/baksmali/Adaptors/Debug/RestartLocalMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Debug/SetSourceFileMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Debug/StartLocalMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/EncodedValue/AnnotationEncodedValueAdaptor.java"
        "src/main/java/org/jf/baksmali/Adaptors/EncodedValue/ArrayEncodedValueAdaptor.java"
        "src/main/java/org/jf/baksmali/Adaptors/EncodedValue/EncodedValueAdaptor.java"
        "src/main/java/org/jf/baksmali/Adaptors/Format/ArrayDataMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Format/InstructionMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Format/InstructionMethodItemFactory.java"
        "src/main/java/org/jf/baksmali/Adaptors/Format/OffsetInstructionFormatMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Format/PackedSwitchMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Format/SparseSwitchMethodItem.java"
        "src/main/java/org/jf/baksmali/Adaptors/Format/UnresolvedOdexInstructionMethodItem.java"
        "src/main/java/org/jf/baksmali/Renderers/BooleanRenderer.java"
        "src/main/java/org/jf/baksmali/Renderers/ByteRenderer.java"
        "src/main/java/org/jf/baksmali/Renderers/CharRenderer.java"
        "src/main/java/org/jf/baksmali/Renderers/DoubleRenderer.java"
        "src/main/java/org/jf/baksmali/Renderers/FloatRenderer.java"
        "src/main/java/org/jf/baksmali/Renderers/IntegerRenderer.java"
        "src/main/java/org/jf/baksmali/Renderers/LongRenderer.java"
        "src/main/java/org/jf/baksmali/Renderers/ShortRenderer.java"
    ];

    manifest = "manifest.txt";

    static_libs = [
        "dexlib2"
        "smali-util"
        "jcommander"
    ];

    java_resources = [":baksmali_version"];

    wrapper = ":baksmali_script";
};

in { inherit baksmali baksmali_version; }
