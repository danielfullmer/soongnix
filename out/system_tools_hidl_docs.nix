{ java_binary_host }:
let

#  Copyright (C) 2007 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#
#  hidl-doc
#
hidl-doc = java_binary_host {
    name = "hidl-doc";
    manifest = "etc/manifest.txt";
    srcs = [
        "src/main.kt"
        "src/writer/formatutils.kt"
        "src/writer/elements/TypedefElement.kt"
        "src/writer/elements/EnumElement.kt"
        "src/writer/elements/AbstractElement.kt"
        "src/writer/elements/CompoundElement.kt"
        "src/writer/elements/MethodElement.kt"
        "src/writer/files/AbstractFileWriter.kt"
        "src/writer/files/InterfaceFileWriter.kt"
        "src/writer/files/IndexFileWriter.kt"
        "src/writer/files/TypesFileWriter.kt"
        "src/writer/files/AbstractParserFileWriter.kt"
        "src/writer/files/resources.kt"
        "src/lexer/ILexer.kt"
        "src/lexer/Token.kt"
        "src/lexer/DocLexer.kt"
        "src/lexer/HidlLexer.kt"
        "src/parser/elements/EntryParser.kt"
        "src/parser/elements/DocParser.kt"
        "src/parser/elements/EntryCollectionParser.kt"
        "src/parser/elements/AbstractParser.kt"
        "src/parser/elements/DocAnnotationParser.kt"
        "src/parser/elements/declarations/EnumDeclarationParser.kt"
        "src/parser/elements/declarations/InterfaceDeclarationParser.kt"
        "src/parser/elements/declarations/TypedefDeclarationParser.kt"
        "src/parser/elements/declarations/MethodDeclarationParser.kt"
        "src/parser/elements/declarations/AbstractDeclarationParser.kt"
        "src/parser/elements/declarations/CompoundDeclarationParser.kt"
        "src/parser/elements/AnnotationParser.kt"
        "src/parser/utils.kt"
        "src/parser/config.kt"
        "src/parser/files/InterfaceFileParser.kt"
        "src/parser/files/TypesFileParser.kt"
        "src/parser/files/AbstractFileParser.kt"
        "src/parser/files/package.kt"
    ];
    java_resources = [
        "resources/template/index.html"
        "resources/template/types.html"
        "resources/template/interface.html"
        "resources/assets/style.css"
    ];
};

in { inherit hidl-doc; }
