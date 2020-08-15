{ genrule, java_library }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

#
#  Build support for snakeyaml within the Android Open Source Project
#  See https://source.android.com/source/building.html for more information
#

#  List of all files that need to be patched (see src/patches/android)
snakeyaml_need_patch_src_files = [
    "src/main/java/org/yaml/snakeyaml/extensions/compactnotation/CompactConstructor.java"
    "src/main/java/org/yaml/snakeyaml/constructor/Constructor.java"
    "src/main/java/org/yaml/snakeyaml/introspector/PropertyUtils.java"
    "src/main/java/org/yaml/snakeyaml/representer/Representer.java"
];

snakeyaml_patched_src_files = genrule {
    name = "snakeyaml_patched_src_files";
    srcs = snakeyaml_need_patch_src_files;
    tool_files = [
        "patch-android-src"
        "src/patches/android/CompactConstructor.patch"
        "src/patches/android/Constructor.patch"
        "src/patches/android/PropertyUtils.patch"
        "src/patches/android/Representer.patch"
    ];
    tools = [
        "soong_zip"
    ];
    cmd = "for src in $(in); do " +
        "   $(location patch-android-src) external/snakeyaml/ $\${src} $(genDir)/$\${src}; " +
        " done && " +
        " $(location soong_zip) -o $(out) -C $(genDir) -D $(genDir)";
    out = ["snakeyaml_patched_src_files.srcjar"];
};

snakeyaml = java_library {
    name = "snakeyaml";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";

    srcs = [
        "src/main/java/org/yaml/snakeyaml/DumperOptions.java"
        "src/main/java/org/yaml/snakeyaml/TypeDescription.java"
        "src/main/java/org/yaml/snakeyaml/Yaml.java"
        "src/main/java/org/yaml/snakeyaml/composer/Composer.java"
        "src/main/java/org/yaml/snakeyaml/composer/ComposerException.java"
        "src/main/java/org/yaml/snakeyaml/constructor/AbstractConstruct.java"
        "src/main/java/org/yaml/snakeyaml/constructor/BaseConstructor.java"
        "src/main/java/org/yaml/snakeyaml/constructor/Construct.java"
        "src/main/java/org/yaml/snakeyaml/constructor/Constructor.java"
        "src/main/java/org/yaml/snakeyaml/constructor/ConstructorException.java"
        "src/main/java/org/yaml/snakeyaml/constructor/CustomClassLoaderConstructor.java"
        "src/main/java/org/yaml/snakeyaml/constructor/SafeConstructor.java"
        "src/main/java/org/yaml/snakeyaml/emitter/Emitable.java"
        "src/main/java/org/yaml/snakeyaml/emitter/Emitter.java"
        "src/main/java/org/yaml/snakeyaml/emitter/EmitterException.java"
        "src/main/java/org/yaml/snakeyaml/emitter/EmitterState.java"
        "src/main/java/org/yaml/snakeyaml/emitter/ScalarAnalysis.java"
        "src/main/java/org/yaml/snakeyaml/error/Mark.java"
        "src/main/java/org/yaml/snakeyaml/error/MarkedYAMLException.java"
        "src/main/java/org/yaml/snakeyaml/error/YAMLException.java"
        "src/main/java/org/yaml/snakeyaml/events/AliasEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/CollectionEndEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/CollectionStartEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/DocumentEndEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/DocumentStartEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/Event.java"
        "src/main/java/org/yaml/snakeyaml/events/ImplicitTuple.java"
        "src/main/java/org/yaml/snakeyaml/events/MappingEndEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/MappingStartEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/NodeEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/ScalarEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/SequenceEndEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/SequenceStartEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/StreamEndEvent.java"
        "src/main/java/org/yaml/snakeyaml/events/StreamStartEvent.java"
        "src/main/java/org/yaml/snakeyaml/extensions/compactnotation/CompactConstructor.java"
        "src/main/java/org/yaml/snakeyaml/extensions/compactnotation/CompactData.java"
        "src/main/java/org/yaml/snakeyaml/extensions/compactnotation/PackageCompactConstructor.java"
        "src/main/java/org/yaml/snakeyaml/external/biz/base64Coder/Base64Coder.java"
        "src/main/java/org/yaml/snakeyaml/external/com/google/gdata/util/common/base/Escaper.java"
        "src/main/java/org/yaml/snakeyaml/external/com/google/gdata/util/common/base/PercentEscaper.java"
        "src/main/java/org/yaml/snakeyaml/external/com/google/gdata/util/common/base/UnicodeEscaper.java"
        "src/main/java/org/yaml/snakeyaml/introspector/BeanAccess.java"
        "src/main/java/org/yaml/snakeyaml/introspector/FieldProperty.java"
        "src/main/java/org/yaml/snakeyaml/introspector/GenericProperty.java"
        "src/main/java/org/yaml/snakeyaml/introspector/MethodProperty.java"
        "src/main/java/org/yaml/snakeyaml/introspector/MissingProperty.java"
        "src/main/java/org/yaml/snakeyaml/introspector/Property.java"
        "src/main/java/org/yaml/snakeyaml/introspector/PropertyUtils.java"
        "src/main/java/org/yaml/snakeyaml/nodes/AnchorNode.java"
        "src/main/java/org/yaml/snakeyaml/nodes/CollectionNode.java"
        "src/main/java/org/yaml/snakeyaml/nodes/MappingNode.java"
        "src/main/java/org/yaml/snakeyaml/nodes/Node.java"
        "src/main/java/org/yaml/snakeyaml/nodes/NodeId.java"
        "src/main/java/org/yaml/snakeyaml/nodes/NodeTuple.java"
        "src/main/java/org/yaml/snakeyaml/nodes/ScalarNode.java"
        "src/main/java/org/yaml/snakeyaml/nodes/SequenceNode.java"
        "src/main/java/org/yaml/snakeyaml/nodes/Tag.java"
        "src/main/java/org/yaml/snakeyaml/parser/Parser.java"
        "src/main/java/org/yaml/snakeyaml/parser/ParserException.java"
        "src/main/java/org/yaml/snakeyaml/parser/ParserImpl.java"
        "src/main/java/org/yaml/snakeyaml/parser/Production.java"
        "src/main/java/org/yaml/snakeyaml/parser/VersionTagsTuple.java"
        "src/main/java/org/yaml/snakeyaml/reader/ReaderException.java"
        "src/main/java/org/yaml/snakeyaml/reader/StreamReader.java"
        "src/main/java/org/yaml/snakeyaml/reader/UnicodeReader.java"
        "src/main/java/org/yaml/snakeyaml/representer/BaseRepresenter.java"
        "src/main/java/org/yaml/snakeyaml/representer/Represent.java"
        "src/main/java/org/yaml/snakeyaml/representer/Representer.java"
        "src/main/java/org/yaml/snakeyaml/representer/SafeRepresenter.java"
        "src/main/java/org/yaml/snakeyaml/resolver/Resolver.java"
        "src/main/java/org/yaml/snakeyaml/resolver/ResolverTuple.java"
        "src/main/java/org/yaml/snakeyaml/scanner/Constant.java"
        "src/main/java/org/yaml/snakeyaml/scanner/Scanner.java"
        "src/main/java/org/yaml/snakeyaml/scanner/ScannerException.java"
        "src/main/java/org/yaml/snakeyaml/scanner/ScannerImpl.java"
        "src/main/java/org/yaml/snakeyaml/scanner/SimpleKey.java"
        "src/main/java/org/yaml/snakeyaml/serializer/AnchorGenerator.java"
        "src/main/java/org/yaml/snakeyaml/serializer/NumberAnchorGenerator.java"
        "src/main/java/org/yaml/snakeyaml/serializer/Serializer.java"
        "src/main/java/org/yaml/snakeyaml/serializer/SerializerException.java"
        "src/main/java/org/yaml/snakeyaml/tokens/AliasToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/AnchorToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/BlockEndToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/BlockEntryToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/BlockMappingStartToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/BlockSequenceStartToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/CommentToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/DirectiveToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/DocumentEndToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/DocumentStartToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/FlowEntryToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/FlowMappingEndToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/FlowMappingStartToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/FlowSequenceEndToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/FlowSequenceStartToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/KeyToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/ScalarToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/StreamEndToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/StreamStartToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/TagToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/TagTuple.java"
        "src/main/java/org/yaml/snakeyaml/tokens/Token.java"
        "src/main/java/org/yaml/snakeyaml/tokens/ValueToken.java"
        "src/main/java/org/yaml/snakeyaml/tokens/WhitespaceToken.java"
        "src/main/java/org/yaml/snakeyaml/util/ArrayStack.java"
        "src/main/java/org/yaml/snakeyaml/util/UriEncoder.java"
    ];
    target = {
        android = {
            exclude_srcs = snakeyaml_need_patch_src_files ++ [
                #  List of all files that are unsupported on android (see pom.xml)
                "src/main/java/org/yaml/snakeyaml/introspector/MethodProperty.java"
            ];
            srcs = [":snakeyaml_patched_src_files"];
        };
    };
};

#  TODO: Consider adding tests.

in { inherit snakeyaml snakeyaml_patched_src_files; }
