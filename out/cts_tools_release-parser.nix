{ java_library_host }:
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

#  cts release-parser java library
#  ============================================================
release-parser = java_library_host {
    name = "release-parser";

    srcs = [
        "src/com/android/cts/releaseparser/AndroidManifestParser.java"
        "src/com/android/cts/releaseparser/ApkParser.java"
        "src/com/android/cts/releaseparser/ArgumentParser.java"
        "src/com/android/cts/releaseparser/ArtParser.java"
        "src/com/android/cts/releaseparser/BuildPropParser.java"
        "src/com/android/cts/releaseparser/ClassUtils.java"
        "src/com/android/cts/releaseparser/DepCsvPrinter.java"
        "src/com/android/cts/releaseparser/DepPrinter.java"
        "src/com/android/cts/releaseparser/DexParser.java"
        "src/com/android/cts/releaseparser/ExeParser.java"
        "src/com/android/cts/releaseparser/FileParser.java"
        "src/com/android/cts/releaseparser/ImgParser.java"
        "src/com/android/cts/releaseparser/JarParser.java"
        "src/com/android/cts/releaseparser/JarTestFinder.java"
        "src/com/android/cts/releaseparser/JsonPrinter.java"
        "src/com/android/cts/releaseparser/Main.java"
        "src/com/android/cts/releaseparser/OatParser.java"
        "src/com/android/cts/releaseparser/OdexParser.java"
        "src/com/android/cts/releaseparser/RcParser.java"
        "src/com/android/cts/releaseparser/ReleaseParser.java"
        "src/com/android/cts/releaseparser/SoParser.java"
        "src/com/android/cts/releaseparser/SymbolicLinkParser.java"
        "src/com/android/cts/releaseparser/TestModuleConfigHandler.java"
        "src/com/android/cts/releaseparser/TestModuleConfigParser.java"
        "src/com/android/cts/releaseparser/TestSuiteParser.java"
        "src/com/android/cts/releaseparser/TestSuiteTradefedParser.java"
        "src/com/android/cts/releaseparser/VdexParser.java"
        "src/com/android/cts/releaseparser/XmlHandler.java"
        "src/com/android/cts/releaseparser/XmlParser.java"
        "src/com/android/cts/releaseparser/ZipParser.java"
        "tests/src/com/android/cts/releaseparser/ApkParserTest.java"
        "tests/src/com/android/cts/releaseparser/FileParserTest.java"
        "tests/src/com/android/cts/releaseparser/SoParserTest.java"
        "tests/src/com/android/cts/releaseparser/UnitTests.java"
        "proto/release.proto"
    ];

    proto = {
        type = "full";
    };
    #  ANDROIDMK TRANSLATION ERROR: unsupported assignment to LOCAL_PROTOC_FLAGS
    #  LOCAL_PROTOC_FLAGS := --proto_path=$(LOCAL_PATH)/proto/

    manifest = "MANIFEST.mf";

    #  This tool is not checking any dependencies or metadata, so all of the
    #  dependencies of all of the tests must be on its classpath. This is
    #  super fragile.
    static_libs = [
        "compatibility-host-util"
        "hosttestlib"
        "dexlib2"
        "jsonlib"
        "tradefed"
    ];

};

in { inherit release-parser; }
