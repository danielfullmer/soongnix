{ java_import_host, java_library_host }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

jarjar = java_library_host {
    name = "jarjar";
    manifest = "manifest.txt";

    srcs = [
        "src/android/com/android/jarjar/RemoveAndroidCompatAnnotationsJarTransformer.java"
        "src/main/com/tonicsystems/jarjar/AbstractDepHandler.java"
        "src/main/com/tonicsystems/jarjar/DepFind.java"
        "src/main/com/tonicsystems/jarjar/DepFindVisitor.java"
        "src/main/com/tonicsystems/jarjar/DepHandler.java"
        "src/main/com/tonicsystems/jarjar/EmptyClassVisitor.java"
        "src/main/com/tonicsystems/jarjar/ExcludeProcessor.java"
        "src/main/com/tonicsystems/jarjar/JarJarMojo.java"
        "src/main/com/tonicsystems/jarjar/JarJarTask.java"
        "src/main/com/tonicsystems/jarjar/Keep.java"
        "src/main/com/tonicsystems/jarjar/KeepProcessor.java"
        "src/main/com/tonicsystems/jarjar/Main.java"
        "src/main/com/tonicsystems/jarjar/MainProcessor.java"
        "src/main/com/tonicsystems/jarjar/MainUtil.java"
        "src/main/com/tonicsystems/jarjar/ManifestProcessor.java"
        "src/main/com/tonicsystems/jarjar/PackageRemapper.java"
        "src/main/com/tonicsystems/jarjar/PathClass.java"
        "src/main/com/tonicsystems/jarjar/PatternElement.java"
        "src/main/com/tonicsystems/jarjar/ResourceProcessor.java"
        "src/main/com/tonicsystems/jarjar/Rule.java"
        "src/main/com/tonicsystems/jarjar/RulesFileParser.java"
        "src/main/com/tonicsystems/jarjar/StringDumper.java"
        "src/main/com/tonicsystems/jarjar/StringReader.java"
        "src/main/com/tonicsystems/jarjar/TextDepHandler.java"
        "src/main/com/tonicsystems/jarjar/Wildcard.java"
        "src/main/com/tonicsystems/jarjar/Zap.java"
        "src/main/com/tonicsystems/jarjar/ZapProcessor.java"
        "src/main/com/tonicsystems/jarjar/util/AntJarProcessor.java"
        "src/main/com/tonicsystems/jarjar/util/ClassHeaderReader.java"
        "src/main/com/tonicsystems/jarjar/util/ClassPathEntry.java"
        "src/main/com/tonicsystems/jarjar/util/ClassPathIterator.java"
        "src/main/com/tonicsystems/jarjar/util/EntryStruct.java"
        "src/main/com/tonicsystems/jarjar/util/GetNameClassWriter.java"
        "src/main/com/tonicsystems/jarjar/util/IoUtil.java"
        "src/main/com/tonicsystems/jarjar/util/JarProcessor.java"
        "src/main/com/tonicsystems/jarjar/util/JarProcessorChain.java"
        "src/main/com/tonicsystems/jarjar/util/JarTransformer.java"
        "src/main/com/tonicsystems/jarjar/util/JarTransformerChain.java"
        "src/main/com/tonicsystems/jarjar/util/RemappingClassTransformer.java"
        "src/main/com/tonicsystems/jarjar/util/RuntimeIOException.java"
        "src/main/com/tonicsystems/jarjar/util/StandaloneJarProcessor.java"
    ];
    java_resource_dirs = ["res"];

    static_libs = [
        "asm-6.0"
        "asm-commons-6.0"
    ];

    libs = [
        "jarjar-maven-plugin-api"
        "jarjar-apache-ant"
    ];
};

# #################################################

jarjar-maven-plugin-api = java_import_host {
    name = "jarjar-maven-plugin-api";
    jars = ["lib/maven-plugin-api.jar"];
};

jarjar-apache-ant = java_import_host {
    name = "jarjar-apache-ant";
    jars = ["lib/apache-ant-1.9.4.jar"];
};

in { inherit jarjar jarjar-apache-ant jarjar-maven-plugin-api; }
