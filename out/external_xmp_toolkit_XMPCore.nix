{ java_library }:
let

xmp_toolkit = java_library {
    name = "xmp_toolkit";
    #  Include all the java files.
    srcs = [
        "src/com/adobe/xmp/XMPConst.java"
        "src/com/adobe/xmp/XMPDateTime.java"
        "src/com/adobe/xmp/XMPDateTimeFactory.java"
        "src/com/adobe/xmp/XMPError.java"
        "src/com/adobe/xmp/XMPException.java"
        "src/com/adobe/xmp/XMPIterator.java"
        "src/com/adobe/xmp/XMPMeta.java"
        "src/com/adobe/xmp/XMPMetaFactory.java"
        "src/com/adobe/xmp/XMPPathFactory.java"
        "src/com/adobe/xmp/XMPSchemaRegistry.java"
        "src/com/adobe/xmp/XMPUtils.java"
        "src/com/adobe/xmp/XMPVersionInfo.java"
        "src/com/adobe/xmp/impl/Base64.java"
        "src/com/adobe/xmp/impl/ByteBuffer.java"
        "src/com/adobe/xmp/impl/CountOutputStream.java"
        "src/com/adobe/xmp/impl/FixASCIIControlsReader.java"
        "src/com/adobe/xmp/impl/ISO8601Converter.java"
        "src/com/adobe/xmp/impl/Latin1Converter.java"
        "src/com/adobe/xmp/impl/ParameterAsserts.java"
        "src/com/adobe/xmp/impl/ParseRDF.java"
        "src/com/adobe/xmp/impl/QName.java"
        "src/com/adobe/xmp/impl/Utils.java"
        "src/com/adobe/xmp/impl/XMPDateTimeImpl.java"
        "src/com/adobe/xmp/impl/XMPIteratorImpl.java"
        "src/com/adobe/xmp/impl/XMPMetaImpl.java"
        "src/com/adobe/xmp/impl/XMPMetaParser.java"
        "src/com/adobe/xmp/impl/XMPNode.java"
        "src/com/adobe/xmp/impl/XMPNodeUtils.java"
        "src/com/adobe/xmp/impl/XMPNormalizer.java"
        "src/com/adobe/xmp/impl/XMPSchemaRegistryImpl.java"
        "src/com/adobe/xmp/impl/XMPSerializerHelper.java"
        "src/com/adobe/xmp/impl/XMPSerializerRDF.java"
        "src/com/adobe/xmp/impl/XMPUtilsImpl.java"
        "src/com/adobe/xmp/impl/xpath/XMPPath.java"
        "src/com/adobe/xmp/impl/xpath/XMPPathParser.java"
        "src/com/adobe/xmp/impl/xpath/XMPPathSegment.java"
        "src/com/adobe/xmp/options/AliasOptions.java"
        "src/com/adobe/xmp/options/IteratorOptions.java"
        "src/com/adobe/xmp/options/Options.java"
        "src/com/adobe/xmp/options/ParseOptions.java"
        "src/com/adobe/xmp/options/PropertyOptions.java"
        "src/com/adobe/xmp/options/SerializeOptions.java"
        "src/com/adobe/xmp/properties/XMPAliasInfo.java"
        "src/com/adobe/xmp/properties/XMPProperty.java"
        "src/com/adobe/xmp/properties/XMPPropertyInfo.java"
    ];
    sdk_version = "8";
};

in { inherit xmp_toolkit; }
