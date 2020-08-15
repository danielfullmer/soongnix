{ java_library_static }:
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

tagsoup = java_library_static {
    name = "tagsoup";
    host_supported = true;
    sdk_version = "core_current";
    srcs = [
        "src/org/ccil/cowan/tagsoup/AttributesImpl.java"
        "src/org/ccil/cowan/tagsoup/AutoDetector.java"
        "src/org/ccil/cowan/tagsoup/CommandLine.java"
        "src/org/ccil/cowan/tagsoup/Element.java"
        "src/org/ccil/cowan/tagsoup/ElementType.java"
        "src/org/ccil/cowan/tagsoup/HTMLModels.java"
        "src/org/ccil/cowan/tagsoup/HTMLScanner.java"
        "src/org/ccil/cowan/tagsoup/HTMLSchema.java"
        "src/org/ccil/cowan/tagsoup/PYXScanner.java"
        "src/org/ccil/cowan/tagsoup/PYXWriter.java"
        "src/org/ccil/cowan/tagsoup/Parser.java"
        "src/org/ccil/cowan/tagsoup/ScanHandler.java"
        "src/org/ccil/cowan/tagsoup/Scanner.java"
        "src/org/ccil/cowan/tagsoup/Schema.java"
        "src/org/ccil/cowan/tagsoup/XMLWriter.java"
        "src/org/ccil/cowan/tagsoup/jaxp/JAXPTest.java"
        "src/org/ccil/cowan/tagsoup/jaxp/SAX1ParserAdapter.java"
        "src/org/ccil/cowan/tagsoup/jaxp/SAXFactoryImpl.java"
        "src/org/ccil/cowan/tagsoup/jaxp/SAXParserImpl.java"
    ];
};

in { inherit tagsoup; }
