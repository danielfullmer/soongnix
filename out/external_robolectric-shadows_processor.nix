{ filegroup, java_plugin, java_test_host }:
let

# #############################################
#  Compile Robolectric processor
# #############################################

Robolectric_processor = java_plugin {
    name = "Robolectric_processor";
    processor_class = "org.robolectric.annotation.processing.RobolectricProcessor";
    srcs = [
        "src/main/java/org/robolectric/annotation/processing/DocumentedElement.java"
        "src/main/java/org/robolectric/annotation/processing/DocumentedMethod.java"
        "src/main/java/org/robolectric/annotation/processing/DocumentedPackage.java"
        "src/main/java/org/robolectric/annotation/processing/DocumentedType.java"
        "src/main/java/org/robolectric/annotation/processing/Helpers.java"
        "src/main/java/org/robolectric/annotation/processing/RobolectricModel.java"
        "src/main/java/org/robolectric/annotation/processing/RobolectricProcessor.java"
        "src/main/java/org/robolectric/annotation/processing/package-info.java"
        "src/main/java/org/robolectric/annotation/processing/generator/Generator.java"
        "src/main/java/org/robolectric/annotation/processing/generator/JavadocJsonGenerator.java"
        "src/main/java/org/robolectric/annotation/processing/generator/ServiceLoaderGenerator.java"
        "src/main/java/org/robolectric/annotation/processing/generator/ShadowProviderGenerator.java"
        "src/main/java/org/robolectric/annotation/processing/generator/package-info.java"
        "src/main/java/org/robolectric/annotation/processing/validator/FoundOnImplementsValidator.java"
        "src/main/java/org/robolectric/annotation/processing/validator/ImplementationValidator.java"
        "src/main/java/org/robolectric/annotation/processing/validator/ImplementsValidator.java"
        "src/main/java/org/robolectric/annotation/processing/validator/RealObjectValidator.java"
        "src/main/java/org/robolectric/annotation/processing/validator/ResetterValidator.java"
        "src/main/java/org/robolectric/annotation/processing/validator/SdkStore.java"
        "src/main/java/org/robolectric/annotation/processing/validator/Validator.java"
        "src/main/java/org/robolectric/annotation/processing/validator/package-info.java"
    ];
    java_resource_dirs = ["src/main/resources"];
    java_resources = ["sdks.txt"];
    use_tools_jar = true;
    static_libs = [
        "Robolectric_annotations"
        "Robolectric_shadowapi"
        "asm-commons-6.0"
        "guava"
        "asm-tree-6.0"
        "gson-prebuilt-jar"
        "asm-6.0"
        "jsr305"
    ];

    openjdk9 = {
        javacflags = [
            "--add-exports=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED"
            "--add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED"
        ];
    };
};

# #############################################
#  Compile Robolectric processor tests
# #############################################
Robolectric_processor_tests = java_test_host {
    name = "Robolectric_processor_tests";
    srcs = [
        "src/test/java/com/example/objects/AnyObject.java"
        "src/test/java/com/example/objects/Dummy.java"
        "src/test/java/com/example/objects/OuterDummy.java"
        "src/test/java/com/example/objects/OuterDummy2.java"
        "src/test/java/com/example/objects/ParameterizedDummy.java"
        "src/test/java/com/example/objects/Private.java"
        "src/test/java/com/example/objects/UniqueDummy.java"
        "src/test/java/com/example/objects2/Dummy.java"
        "src/test/java/com/example/objects2/OuterDummy.java"
        "src/test/java/org/robolectric/annotation/UnrecognizedAnnotation.java"
        "src/test/java/org/robolectric/annotation/processing/JavadocJsonGeneratorTest.java"
        "src/test/java/org/robolectric/annotation/processing/RobolectricProcessorTest.java"
        "src/test/java/org/robolectric/annotation/processing/Utils.java"
        "src/test/java/org/robolectric/annotation/processing/generator/ShadowProviderGeneratorTest.java"
        "src/test/java/org/robolectric/annotation/processing/validator/ImplementationValidatorTest.java"
        "src/test/java/org/robolectric/annotation/processing/validator/ImplementsValidatorTest.java"
        "src/test/java/org/robolectric/annotation/processing/validator/RealObjectValidatorTest.java"
        "src/test/java/org/robolectric/annotation/processing/validator/ResetterValidatorTest.java"
        "src/test/java/org/robolectric/annotation/processing/validator/SingleClassSubject.java"
    ];
    java_resource_dirs = ["src/test/resources"];
    java_resources = [":Robolectric_processor_tests_resources"];

    static_libs = [
        "Robolectric_annotations"
        "Robolectric_processor"
        "Robolectric_shadowapi"
        "robolectric-javax.annotation-api-1.2"
        "robolectric-compile-testing-0.15"
        "mockito"
        "hamcrest"
        "guava"
        "objenesis"
        "junit"
        "truth-prebuilt"
        "gson-prebuilt-jar"
        "jsr305"
    ];

    test_suites = ["general-tests"];

    #  Disable annotation processing while compiling tests to avoid executing RobolectricProcessor.
    javacflags = ["-proc:none"];
};

#  Workaround: java_resource_dirs ignores *.java files
Robolectric_processor_tests_resources = filegroup {
    name = "Robolectric_processor_tests_resources";
    path = "src/test/resources";
    srcs = [
        "src/test/resources/mock-source/org/robolectric/internal/ShadowProvider.java"
        "src/test/resources/mock-source/org/robolectric/shadow/api/Shadow.java"
        "src/test/resources/org/robolectric/DocumentedObjectOuter.java"
        "src/test/resources/org/robolectric/Robolectric_ClassNameOnly.java"
        "src/test/resources/org/robolectric/Robolectric_EmptyProvidedPackageNames.java"
        "src/test/resources/org/robolectric/Robolectric_HiddenClasses.java"
        "src/test/resources/org/robolectric/Robolectric_InnerClassCollision.java"
        "src/test/resources/org/robolectric/Robolectric_NoExcludedTypes.java"
        "src/test/resources/org/robolectric/Robolectric_Parameterized.java"
        "src/test/resources/org/robolectric/annotation/TestWithUnrecognizedAnnotation.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/DocumentedObjectShadow.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowClassNameOnly.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowDummy.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowExcludedFromAndroidSdk.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowImplementationWithIncorrectVisibility.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowImplementationWithoutImplements.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowImplementsDummyWithOuterDummyClassName.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowImplementsWithExtraParameters.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowImplementsWithMissingParameters.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowImplementsWithParameterMismatch.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowImplementsWithoutClass.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowOuterDummy.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowOuterDummy2.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowOuterDummyWithErrs.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowParameterizedDummy.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowPrivate.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectParameterizedMismatch.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectParameterizedMissingParameters.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectWithCorrectClassName.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectWithCorrectType.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectWithEmptyClassName.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectWithEmptyImplements.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectWithIncorrectClassName.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectWithNestedClassName.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectWithWrongType.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowRealObjectWithoutImplements.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowResetterNonPublic.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowResetterNonStatic.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowResetterWithParameters.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowResetterWithoutImplements.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowUniqueDummy.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowWithImplementationlessShadowMethods.java"
        "src/test/resources/org/robolectric/annotation/processing/shadows/ShadowWithUnresolvableClassNameAndOldMaxSdk.java"
    ];
};

in { inherit Robolectric_processor Robolectric_processor_tests Robolectric_processor_tests_resources; }
