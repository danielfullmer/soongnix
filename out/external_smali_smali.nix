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

smali_version = genrule {
    name = "smali_version";
    srcs = [":smali_build.gradle"];
    out = ["smali.properties"];
    cmd = "echo \"application.version=$$(grep -o -e \"^version = '\\(.*\\)'\" $(in) | grep -o -e \"[0-9.]\\+\")-aosp\" > $(out)";
};

#  build smali jar
#  ============================================================

smali = java_binary_host {
    name = "smali";

    srcs = [
        "src/main/java/org/jf/smali/AssembleCommand.java"
        "src/main/java/org/jf/smali/HelpCommand.java"
        "src/main/java/org/jf/smali/InvalidToken.java"
        "src/main/java/org/jf/smali/LexerErrorInterface.java"
        "src/main/java/org/jf/smali/LiteralTools.java"
        "src/main/java/org/jf/smali/Main.java"
        "src/main/java/org/jf/smali/OdexedInstructionException.java"
        "src/main/java/org/jf/smali/SemanticException.java"
        "src/main/java/org/jf/smali/Smali.java"
        "src/main/java/org/jf/smali/SmaliMethodParameter.java"
        "src/main/java/org/jf/smali/SmaliOptions.java"
        "src/main/java/org/jf/smali/SmaliTestUtils.java"
        "src/main/java/org/jf/smali/WithRegister.java"
        "src/main/java/org/jf/smali/smaliFlexLexer.java"
        "src/main/java/org/jf/smali/smaliParser.java"
        "src/main/java/org/jf/smali/smaliTreeWalker.java"
        "src/main/java/org/jf/smali/util/BlankReader.java"
    ];

    manifest = "manifest.txt";

    static_libs = [
        "antlr-runtime"
        "dexlib2"
        "jcommander"
        "smali-util"
    ];

    java_resources = [":smali_version"];

    wrapper = ":smali_script";
};

in { inherit smali smali_version; }
