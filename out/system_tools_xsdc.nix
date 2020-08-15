{ java_binary_host }:
let

xsdc = java_binary_host {
    name = "xsdc";
    srcs = [
        "src/com/android/xsdc/CodeWriter.java"
        "src/com/android/xsdc/FileSystem.java"
        "src/com/android/xsdc/Main.java"
        "src/com/android/xsdc/XmlSchema.java"
        "src/com/android/xsdc/XsdConstants.java"
        "src/com/android/xsdc/XsdHandler.java"
        "src/com/android/xsdc/XsdParserException.java"
        "src/com/android/xsdc/cpp/CppCodeGenerator.java"
        "src/com/android/xsdc/cpp/CppCodeGeneratorException.java"
        "src/com/android/xsdc/cpp/CppComplexType.java"
        "src/com/android/xsdc/cpp/CppSimpleType.java"
        "src/com/android/xsdc/cpp/CppType.java"
        "src/com/android/xsdc/cpp/Utils.java"
        "src/com/android/xsdc/java/JavaCodeGenerator.java"
        "src/com/android/xsdc/java/JavaCodeGeneratorException.java"
        "src/com/android/xsdc/java/JavaComplexType.java"
        "src/com/android/xsdc/java/JavaSimpleType.java"
        "src/com/android/xsdc/java/JavaType.java"
        "src/com/android/xsdc/java/Utils.java"
        "src/com/android/xsdc/tag/XsdAll.java"
        "src/com/android/xsdc/tag/XsdAttribute.java"
        "src/com/android/xsdc/tag/XsdChoice.java"
        "src/com/android/xsdc/tag/XsdComplexContent.java"
        "src/com/android/xsdc/tag/XsdComplexType.java"
        "src/com/android/xsdc/tag/XsdElement.java"
        "src/com/android/xsdc/tag/XsdEnumRestriction.java"
        "src/com/android/xsdc/tag/XsdEnumeration.java"
        "src/com/android/xsdc/tag/XsdGeneralExtension.java"
        "src/com/android/xsdc/tag/XsdGeneralRestriction.java"
        "src/com/android/xsdc/tag/XsdList.java"
        "src/com/android/xsdc/tag/XsdRestriction.java"
        "src/com/android/xsdc/tag/XsdSimpleContent.java"
        "src/com/android/xsdc/tag/XsdSimpleType.java"
        "src/com/android/xsdc/tag/XsdTag.java"
        "src/com/android/xsdc/tag/XsdType.java"
        "src/com/android/xsdc/tag/XsdUnion.java"
    ];
    static_libs = [
        "commons-cli-1.2"
    ];
    manifest = "MANIFEST.MF";
};

in { inherit xsdc; }
