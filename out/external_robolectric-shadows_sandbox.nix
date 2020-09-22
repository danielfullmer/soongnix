{ java_library_host, java_test_host }:
let

# #############################################
#  Compile Robolectric sandbox
# #############################################

Robolectric_sandbox = java_library_host {
    name = "Robolectric_sandbox";
    srcs = [
        "src/main/java/org/robolectric/JarInstrumentor.java"
        "src/main/java/org/robolectric/internal/bytecode/ClassHandler.java"
        "src/main/java/org/robolectric/internal/bytecode/ClassInstrumentor.java"
        "src/main/java/org/robolectric/internal/bytecode/ClassNodeProvider.java"
        "src/main/java/org/robolectric/internal/bytecode/ClassValueMap.java"
        "src/main/java/org/robolectric/internal/bytecode/DirectObjectMarker.java"
        "src/main/java/org/robolectric/internal/bytecode/InstrumentationConfiguration.java"
        "src/main/java/org/robolectric/internal/bytecode/InstrumentingClassWriter.java"
        "src/main/java/org/robolectric/internal/bytecode/Interceptor.java"
        "src/main/java/org/robolectric/internal/bytecode/Interceptors.java"
        "src/main/java/org/robolectric/internal/bytecode/InvocationProfile.java"
        "src/main/java/org/robolectric/internal/bytecode/InvokeDynamic.java"
        "src/main/java/org/robolectric/internal/bytecode/InvokeDynamicClassInstrumentor.java"
        "src/main/java/org/robolectric/internal/bytecode/InvokeDynamicSupport.java"
        "src/main/java/org/robolectric/internal/bytecode/MethodCallSite.java"
        "src/main/java/org/robolectric/internal/bytecode/MethodRef.java"
        "src/main/java/org/robolectric/internal/bytecode/MethodSignature.java"
        "src/main/java/org/robolectric/internal/bytecode/MutableClass.java"
        "src/main/java/org/robolectric/internal/bytecode/OldClassInstrumentor.java"
        "src/main/java/org/robolectric/internal/bytecode/ProxyMaker.java"
        "src/main/java/org/robolectric/internal/bytecode/RoboCallSite.java"
        "src/main/java/org/robolectric/internal/bytecode/RoboType.java"
        "src/main/java/org/robolectric/internal/bytecode/RobolectricGeneratorAdapter.java"
        "src/main/java/org/robolectric/internal/bytecode/RobolectricInternals.java"
        "src/main/java/org/robolectric/internal/bytecode/Sandbox.java"
        "src/main/java/org/robolectric/internal/bytecode/SandboxClassLoader.java"
        "src/main/java/org/robolectric/internal/bytecode/SandboxConfig.java"
        "src/main/java/org/robolectric/internal/bytecode/ShadowConstants.java"
        "src/main/java/org/robolectric/internal/bytecode/ShadowDecorator.java"
        "src/main/java/org/robolectric/internal/bytecode/ShadowImpl.java"
        "src/main/java/org/robolectric/internal/bytecode/ShadowInfo.java"
        "src/main/java/org/robolectric/internal/bytecode/ShadowInvalidator.java"
        "src/main/java/org/robolectric/internal/bytecode/ShadowMap.java"
        "src/main/java/org/robolectric/internal/bytecode/ShadowWrangler.java"
        "src/main/java/org/robolectric/internal/bytecode/ShadowedObject.java"
        "src/main/java/org/robolectric/internal/bytecode/TypeMapper.java"
        "src/main/java/org/robolectric/util/Function.java"
        "src/main/java/org/robolectric/util/JavaVersion.java"
    ];
    libs = [
        "Robolectric_annotations"
        "Robolectric_shadowapi"
        "Robolectric_utils"
        "asm-commons-6.0"
        "guava"
        "asm-tree-6.0"
        "asm-6.0"
        "jsr305"
    ];
};

# #############################################
#  Compile Robolectric sandbox tests
# #############################################

Robolectric_sandbox_tests = java_test_host {
    name = "Robolectric_sandbox_tests";
    srcs = [
        "src/test/java/org/robolectric/ClassicSuperHandlingTest.java"
        "src/test/java/org/robolectric/JavaVersionTest.java"
        "src/test/java/org/robolectric/RealApisTest.java"
        "src/test/java/org/robolectric/RobolectricInternalsTest.java"
        "src/test/java/org/robolectric/SandboxClassLoaderTest.java"
        "src/test/java/org/robolectric/ShadowWranglerIntegrationTest.java"
        "src/test/java/org/robolectric/ShadowingTest.java"
        "src/test/java/org/robolectric/StaticInitializerTest.java"
        "src/test/java/org/robolectric/ThreadSafetyTest.java"
        "src/test/java/org/robolectric/internal/bytecode/ProxyMakerTest.java"
        "src/test/java/org/robolectric/testing/AChild.java"
        "src/test/java/org/robolectric/testing/AClassThatCallsAMethodReturningAForgettableClass.java"
        "src/test/java/org/robolectric/testing/AClassThatExtendsAClassWithFinalEqualsHashCode.java"
        "src/test/java/org/robolectric/testing/AClassThatRefersToAForgettableClass.java"
        "src/test/java/org/robolectric/testing/AClassThatRefersToAForgettableClassInItsConstructor.java"
        "src/test/java/org/robolectric/testing/AClassThatRefersToAForgettableClassInMethodCalls.java"
        "src/test/java/org/robolectric/testing/AClassThatRefersToAForgettableClassInMethodCallsReturningPrimitive.java"
        "src/test/java/org/robolectric/testing/AClassToForget.java"
        "src/test/java/org/robolectric/testing/AClassToRemember.java"
        "src/test/java/org/robolectric/testing/AClassWithEqualsHashCodeToString.java"
        "src/test/java/org/robolectric/testing/AClassWithFinalEqualsHashCode.java"
        "src/test/java/org/robolectric/testing/AClassWithFunnyConstructors.java"
        "src/test/java/org/robolectric/testing/AClassWithMethodReturningArray.java"
        "src/test/java/org/robolectric/testing/AClassWithMethodReturningBoolean.java"
        "src/test/java/org/robolectric/testing/AClassWithMethodReturningDouble.java"
        "src/test/java/org/robolectric/testing/AClassWithMethodReturningInteger.java"
        "src/test/java/org/robolectric/testing/AClassWithNativeMethod.java"
        "src/test/java/org/robolectric/testing/AClassWithNativeMethodReturningPrimitive.java"
        "src/test/java/org/robolectric/testing/AClassWithNoDefaultConstructor.java"
        "src/test/java/org/robolectric/testing/AClassWithStaticMethod.java"
        "src/test/java/org/robolectric/testing/AClassWithoutEqualsHashCodeToString.java"
        "src/test/java/org/robolectric/testing/AFinalClass.java"
        "src/test/java/org/robolectric/testing/AGrandparent.java"
        "src/test/java/org/robolectric/testing/AParent.java"
        "src/test/java/org/robolectric/testing/AnEnum.java"
        "src/test/java/org/robolectric/testing/AnExampleClass.java"
        "src/test/java/org/robolectric/testing/AnInstrumentedChild.java"
        "src/test/java/org/robolectric/testing/AnInstrumentedClassWithoutToStringWithSuperToString.java"
        "src/test/java/org/robolectric/testing/AnUninstrumentedClass.java"
        "src/test/java/org/robolectric/testing/AnUninstrumentedClassWithToString.java"
        "src/test/java/org/robolectric/testing/AnUninstrumentedParent.java"
        "src/test/java/org/robolectric/testing/Foo.java"
        "src/test/java/org/robolectric/testing/Pony.java"
        "src/test/java/org/robolectric/testing/ShadowFoo.java"
    ];
    static_libs = [
        "Robolectric_annotations"
        "Robolectric_shadowapi"
        "Robolectric_sandbox"
        "Robolectric_junit"
        "Robolectric_utils"
        "mockito"
        "hamcrest"
        "asm-commons-6.0"
        "guava"
        "objenesis"
        "asm-tree-6.0"
        "junit"
        "truth-prebuilt"
        "asm-6.0"
        "jsr305"
    ];
    test_suites = ["general-tests"];
};

in { inherit Robolectric_sandbox Robolectric_sandbox_tests; }
