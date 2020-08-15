{ java_library_host }:
let

desugar = java_library_host {
    name = "desugar";
    srcs = [
        "java/com/google/devtools/build/android/Converters.java"
        "java/com/google/devtools/build/android/desugar/BytecodeTypeInference.java"
        "java/com/google/devtools/build/android/desugar/ClassReaderFactory.java"
        "java/com/google/devtools/build/android/desugar/ClassVsInterface.java"
        "java/com/google/devtools/build/android/desugar/CloseResourceMethodScanner.java"
        "java/com/google/devtools/build/android/desugar/CoreLibraryInvocationRewriter.java"
        "java/com/google/devtools/build/android/desugar/CoreLibrarySupport.java"
        "java/com/google/devtools/build/android/desugar/CorePackageRenamer.java"
        "java/com/google/devtools/build/android/desugar/DefaultMethodClassFixer.java"
        "java/com/google/devtools/build/android/desugar/DependencyCollector.java"
        "java/com/google/devtools/build/android/desugar/Desugar.java"
        "java/com/google/devtools/build/android/desugar/EmulatedInterfaceRewriter.java"
        "java/com/google/devtools/build/android/desugar/GeneratedClassStore.java"
        "java/com/google/devtools/build/android/desugar/InterfaceDesugaring.java"
        "java/com/google/devtools/build/android/desugar/InvokeDynamicLambdaMethodCollector.java"
        "java/com/google/devtools/build/android/desugar/Java7Compatibility.java"
        "java/com/google/devtools/build/android/desugar/LambdaClassFixer.java"
        "java/com/google/devtools/build/android/desugar/LambdaClassMaker.java"
        "java/com/google/devtools/build/android/desugar/LambdaDesugaring.java"
        "java/com/google/devtools/build/android/desugar/LambdaInfo.java"
        "java/com/google/devtools/build/android/desugar/LongCompareMethodRewriter.java"
        "java/com/google/devtools/build/android/desugar/MethodInfo.java"
        "java/com/google/devtools/build/android/desugar/ObjectsRequireNonNullMethodRewriter.java"
        "java/com/google/devtools/build/android/desugar/TryWithResourcesRewriter.java"
        "java/com/google/devtools/build/android/desugar/io/BitFlags.java"
        "java/com/google/devtools/build/android/desugar/io/CoreLibraryRewriter.java"
        "java/com/google/devtools/build/android/desugar/io/DirectoryInputFileProvider.java"
        "java/com/google/devtools/build/android/desugar/io/DirectoryOutputFileProvider.java"
        "java/com/google/devtools/build/android/desugar/io/FieldInfo.java"
        "java/com/google/devtools/build/android/desugar/io/HeaderClassLoader.java"
        "java/com/google/devtools/build/android/desugar/io/IndexedInputs.java"
        "java/com/google/devtools/build/android/desugar/io/InputFileProvider.java"
        "java/com/google/devtools/build/android/desugar/io/OutputFileProvider.java"
        "java/com/google/devtools/build/android/desugar/io/ThrowingClassLoader.java"
        "java/com/google/devtools/build/android/desugar/io/ZipInputFileProvider.java"
        "java/com/google/devtools/build/android/desugar/io/ZipOutputFileProvider.java"
        "java/com/google/devtools/build/android/desugar/runtime/ThrowableExtension.java"
        "java/com/google/devtools/build/android/desugar/scan/KeepReference.java"
        "java/com/google/devtools/build/android/desugar/scan/KeepScanner.java"
        "java/com/google/devtools/build/android/desugar/scan/PrefixReferenceScanner.java"
        "java/com/google/devtools/common/options/ArgsPreProcessor.java"
        "java/com/google/devtools/common/options/BoolOrEnumConverter.java"
        "java/com/google/devtools/common/options/CommandNameCache.java"
        "java/com/google/devtools/common/options/Converter.java"
        "java/com/google/devtools/common/options/Converters.java"
        "java/com/google/devtools/common/options/DuplicateOptionDeclarationException.java"
        "java/com/google/devtools/common/options/EnumConverter.java"
        "java/com/google/devtools/common/options/ExpansionFunction.java"
        "java/com/google/devtools/common/options/GenericTypeHelper.java"
        "java/com/google/devtools/common/options/InvocationPolicyEnforcer.java"
        "java/com/google/devtools/common/options/InvocationPolicyParser.java"
        "java/com/google/devtools/common/options/IsolatedOptionsData.java"
        "java/com/google/devtools/common/options/OpaqueOptionsData.java"
        "java/com/google/devtools/common/options/Option.java"
        "java/com/google/devtools/common/options/OptionDefinition.java"
        "java/com/google/devtools/common/options/OptionDocumentationCategory.java"
        "java/com/google/devtools/common/options/OptionEffectTag.java"
        "java/com/google/devtools/common/options/OptionFilterDescriptions.java"
        "java/com/google/devtools/common/options/OptionInstanceOrigin.java"
        "java/com/google/devtools/common/options/OptionMetadataTag.java"
        "java/com/google/devtools/common/options/OptionPriority.java"
        "java/com/google/devtools/common/options/OptionValueDescription.java"
        "java/com/google/devtools/common/options/Options.java"
        "java/com/google/devtools/common/options/OptionsBase.java"
        "java/com/google/devtools/common/options/OptionsClassProvider.java"
        "java/com/google/devtools/common/options/OptionsData.java"
        "java/com/google/devtools/common/options/OptionsParser.java"
        "java/com/google/devtools/common/options/OptionsParserImpl.java"
        "java/com/google/devtools/common/options/OptionsParsingException.java"
        "java/com/google/devtools/common/options/OptionsProvider.java"
        "java/com/google/devtools/common/options/OptionsUsage.java"
        "java/com/google/devtools/common/options/ParamsFilePreProcessor.java"
        "java/com/google/devtools/common/options/ParsedOptionDescription.java"
        "java/com/google/devtools/common/options/ShellQuotedParamsFilePreProcessor.java"
        "java/com/google/devtools/common/options/TriState.java"
        "java/com/google/devtools/common/options/UnquotedParamsFilePreProcessor.java"
        "java/com/google/devtools/common/options/UsesOnlyCoreTypes.java"
        "java/com/google/devtools/common/options/processor/OptionProcessor.java"
        "java/com/google/devtools/common/options/processor/OptionProcessorException.java"
        "java/com/google/devtools/common/options/processor/ProcessorUtils.java"
        "java/com/google/devtools/common/options/testing/ConverterTester.java"
        "java/com/google/devtools/common/options/testing/ConverterTesterMap.java"
        "java/com/google/devtools/common/options/testing/OptionsTester.java"
    ];
    #  Remove com.google.devtools.common.options.testing classes, they are
    #  extensions to the Truth library that we are missing dependencies for
    #  and don't need.
    #  Also remove com.google.devtools.common.options.InvocationPolicy*,
    #  which depend on protobuf and are not used in desugar.
    exclude_srcs = [
        "java/com/google/devtools/common/options/testing/ConverterTester.java"
        "java/com/google/devtools/common/options/testing/ConverterTesterMap.java"
        "java/com/google/devtools/common/options/testing/OptionsTester.java"
        "java/com/google/devtools/common/options/InvocationPolicyEnforcer.java"
        "java/com/google/devtools/common/options/InvocationPolicyParser.java"
    ];

    manifest = "manifest.txt";
    static_libs = [
        "asm-6.0"
        "asm-commons-6.0"
        "asm-tree-6.0"
        "error_prone_annotations-2.0.18"
        "guava-21.0"
        "jsr305-3.0.1"
    ];

    openjdk9 = {
        #  Required for use of javax.annotation.Generated per http://b/62050818
        javacflags = ["-J--add-modules=java.xml.ws.annotation"];
    };

    #  Use Dagger2 annotation processor
    plugins = ["dagger2-auto-value"];
    libs = ["dagger2-auto-value"];
};

in { inherit desugar; }
