{ filegroup, genrule, java_binary_host, java_library_static }:
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
#  Build support for guice within the Android Open Source Project
#  See https://source.android.com/source/building.html for more information
#

# ##################################
#            Guice                 #
# ##################################

#
#  Builds the 'no_aop' flavor for Android.
#  -- see core/pom.xml NO_AOP rule.
#

guice_srcs = filegroup {
    name = "guice_srcs";
    srcs = [
        "core/src/com/google/inject/AbstractModule.java"
        "core/src/com/google/inject/Binder.java"
        "core/src/com/google/inject/Binding.java"
        "core/src/com/google/inject/BindingAnnotation.java"
        "core/src/com/google/inject/ConfigurationException.java"
        "core/src/com/google/inject/CreationException.java"
        "core/src/com/google/inject/Exposed.java"
        "core/src/com/google/inject/Guice.java"
        "core/src/com/google/inject/ImplementedBy.java"
        "core/src/com/google/inject/Inject.java"
        "core/src/com/google/inject/Injector.java"
        "core/src/com/google/inject/Key.java"
        "core/src/com/google/inject/MembersInjector.java"
        "core/src/com/google/inject/Module.java"
        "core/src/com/google/inject/OutOfScopeException.java"
        "core/src/com/google/inject/PrivateBinder.java"
        "core/src/com/google/inject/PrivateModule.java"
        "core/src/com/google/inject/ProvidedBy.java"
        "core/src/com/google/inject/Provider.java"
        "core/src/com/google/inject/Provides.java"
        "core/src/com/google/inject/ProvisionException.java"
        "core/src/com/google/inject/Scope.java"
        "core/src/com/google/inject/ScopeAnnotation.java"
        "core/src/com/google/inject/Scopes.java"
        "core/src/com/google/inject/Singleton.java"
        "core/src/com/google/inject/Stage.java"
        "core/src/com/google/inject/TypeLiteral.java"
        "core/src/com/google/inject/package-info.java"
        "core/src/com/google/inject/binder/AnnotatedBindingBuilder.java"
        "core/src/com/google/inject/binder/AnnotatedConstantBindingBuilder.java"
        "core/src/com/google/inject/binder/AnnotatedElementBuilder.java"
        "core/src/com/google/inject/binder/ConstantBindingBuilder.java"
        "core/src/com/google/inject/binder/LinkedBindingBuilder.java"
        "core/src/com/google/inject/binder/ScopedBindingBuilder.java"
        "core/src/com/google/inject/binder/package-info.java"
        "core/src/com/google/inject/internal/AbstractBindingBuilder.java"
        "core/src/com/google/inject/internal/AbstractBindingProcessor.java"
        "core/src/com/google/inject/internal/AbstractProcessor.java"
        "core/src/com/google/inject/internal/Annotations.java"
        "core/src/com/google/inject/internal/BindingBuilder.java"
        "core/src/com/google/inject/internal/BindingImpl.java"
        "core/src/com/google/inject/internal/BindingProcessor.java"
        "core/src/com/google/inject/internal/BoundProviderFactory.java"
        "core/src/com/google/inject/internal/BytecodeGen.java"
        "core/src/com/google/inject/internal/CircularDependencyProxy.java"
        "core/src/com/google/inject/internal/ConstantBindingBuilderImpl.java"
        "core/src/com/google/inject/internal/ConstantFactory.java"
        "core/src/com/google/inject/internal/ConstructionContext.java"
        "core/src/com/google/inject/internal/ConstructionProxy.java"
        "core/src/com/google/inject/internal/ConstructionProxyFactory.java"
        "core/src/com/google/inject/internal/ConstructorBindingImpl.java"
        "core/src/com/google/inject/internal/ConstructorInjector.java"
        "core/src/com/google/inject/internal/ConstructorInjectorStore.java"
        "core/src/com/google/inject/internal/CreationListener.java"
        "core/src/com/google/inject/internal/CycleDetectingLock.java"
        "core/src/com/google/inject/internal/DefaultConstructionProxyFactory.java"
        "core/src/com/google/inject/internal/DeferredLookups.java"
        "core/src/com/google/inject/internal/DelayedInitialize.java"
        "core/src/com/google/inject/internal/DelegatingInvocationHandler.java"
        "core/src/com/google/inject/internal/Element.java"
        "core/src/com/google/inject/internal/EncounterImpl.java"
        "core/src/com/google/inject/internal/ErrorHandler.java"
        "core/src/com/google/inject/internal/Errors.java"
        "core/src/com/google/inject/internal/ErrorsException.java"
        "core/src/com/google/inject/internal/ExposedBindingImpl.java"
        "core/src/com/google/inject/internal/ExposedKeyFactory.java"
        "core/src/com/google/inject/internal/ExposureBuilder.java"
        "core/src/com/google/inject/internal/FactoryProxy.java"
        "core/src/com/google/inject/internal/FailableCache.java"
        "core/src/com/google/inject/internal/Indexer.java"
        "core/src/com/google/inject/internal/InheritingState.java"
        "core/src/com/google/inject/internal/Initializable.java"
        "core/src/com/google/inject/internal/Initializables.java"
        "core/src/com/google/inject/internal/Initializer.java"
        "core/src/com/google/inject/internal/InjectionRequestProcessor.java"
        "core/src/com/google/inject/internal/InjectorImpl.java"
        "core/src/com/google/inject/internal/InjectorOptionsProcessor.java"
        "core/src/com/google/inject/internal/InjectorShell.java"
        "core/src/com/google/inject/internal/InstanceBindingImpl.java"
        "core/src/com/google/inject/internal/InterceptorBindingProcessor.java"
        "core/src/com/google/inject/internal/InterceptorStackCallback.java"
        "core/src/com/google/inject/internal/InternalContext.java"
        "core/src/com/google/inject/internal/InternalFactory.java"
        "core/src/com/google/inject/internal/InternalFactoryToInitializableAdapter.java"
        "core/src/com/google/inject/internal/InternalFactoryToProviderAdapter.java"
        "core/src/com/google/inject/internal/InternalFlags.java"
        "core/src/com/google/inject/internal/InternalInjectorCreator.java"
        "core/src/com/google/inject/internal/InternalProviderInstanceBindingImpl.java"
        "core/src/com/google/inject/internal/InternalProvisionException.java"
        "core/src/com/google/inject/internal/LinkedBindingImpl.java"
        "core/src/com/google/inject/internal/LinkedProviderBindingImpl.java"
        "core/src/com/google/inject/internal/ListenerBindingProcessor.java"
        "core/src/com/google/inject/internal/LookupProcessor.java"
        "core/src/com/google/inject/internal/Lookups.java"
        "core/src/com/google/inject/internal/MembersInjectorImpl.java"
        "core/src/com/google/inject/internal/MembersInjectorStore.java"
        "core/src/com/google/inject/internal/MessageProcessor.java"
        "core/src/com/google/inject/internal/Messages.java"
        "core/src/com/google/inject/internal/MethodAspect.java"
        "core/src/com/google/inject/internal/ModuleAnnotatedMethodScannerProcessor.java"
        "core/src/com/google/inject/internal/MoreTypes.java"
        "core/src/com/google/inject/internal/Nullability.java"
        "core/src/com/google/inject/internal/PrivateElementProcessor.java"
        "core/src/com/google/inject/internal/PrivateElementsImpl.java"
        "core/src/com/google/inject/internal/ProcessedBindingData.java"
        "core/src/com/google/inject/internal/ProvidedByInternalFactory.java"
        "core/src/com/google/inject/internal/ProviderInstanceBindingImpl.java"
        "core/src/com/google/inject/internal/ProviderInternalFactory.java"
        "core/src/com/google/inject/internal/ProviderMethod.java"
        "core/src/com/google/inject/internal/ProviderMethodsModule.java"
        "core/src/com/google/inject/internal/ProviderToInternalFactoryAdapter.java"
        "core/src/com/google/inject/internal/ProvidesMethodScanner.java"
        "core/src/com/google/inject/internal/ProvisionListenerCallbackStore.java"
        "core/src/com/google/inject/internal/ProvisionListenerStackCallback.java"
        "core/src/com/google/inject/internal/ProxyFactory.java"
        "core/src/com/google/inject/internal/RealElement.java"
        "core/src/com/google/inject/internal/RealMapBinder.java"
        "core/src/com/google/inject/internal/RealMultibinder.java"
        "core/src/com/google/inject/internal/RealOptionalBinder.java"
        "core/src/com/google/inject/internal/ScopeBindingProcessor.java"
        "core/src/com/google/inject/internal/Scoping.java"
        "core/src/com/google/inject/internal/SingleFieldInjector.java"
        "core/src/com/google/inject/internal/SingleMemberInjector.java"
        "core/src/com/google/inject/internal/SingleMethodInjector.java"
        "core/src/com/google/inject/internal/SingleParameterInjector.java"
        "core/src/com/google/inject/internal/SingletonScope.java"
        "core/src/com/google/inject/internal/State.java"
        "core/src/com/google/inject/internal/TypeConverterBindingProcessor.java"
        "core/src/com/google/inject/internal/UniqueAnnotations.java"
        "core/src/com/google/inject/internal/UntargettedBindingImpl.java"
        "core/src/com/google/inject/internal/UntargettedBindingProcessor.java"
        "core/src/com/google/inject/internal/WeakKeySet.java"
        "core/src/com/google/inject/internal/package-info.java"
        "core/src/com/google/inject/internal/util/Classes.java"
        "core/src/com/google/inject/internal/util/LineNumbers.java"
        "core/src/com/google/inject/internal/util/SourceProvider.java"
        "core/src/com/google/inject/internal/util/StackTraceElements.java"
        "core/src/com/google/inject/internal/util/Stopwatch.java"
        "core/src/com/google/inject/matcher/AbstractMatcher.java"
        "core/src/com/google/inject/matcher/Matcher.java"
        "core/src/com/google/inject/matcher/Matchers.java"
        "core/src/com/google/inject/matcher/package-info.java"
        "core/src/com/google/inject/multibindings/ClassMapKey.java"
        "core/src/com/google/inject/multibindings/MapBinder.java"
        "core/src/com/google/inject/multibindings/MapBinderBinding.java"
        "core/src/com/google/inject/multibindings/MapKey.java"
        "core/src/com/google/inject/multibindings/Multibinder.java"
        "core/src/com/google/inject/multibindings/MultibinderBinding.java"
        "core/src/com/google/inject/multibindings/MultibindingsScanner.java"
        "core/src/com/google/inject/multibindings/MultibindingsTargetVisitor.java"
        "core/src/com/google/inject/multibindings/OptionalBinder.java"
        "core/src/com/google/inject/multibindings/OptionalBinderBinding.java"
        "core/src/com/google/inject/multibindings/ProvidesIntoMap.java"
        "core/src/com/google/inject/multibindings/ProvidesIntoOptional.java"
        "core/src/com/google/inject/multibindings/ProvidesIntoSet.java"
        "core/src/com/google/inject/multibindings/StringMapKey.java"
        "core/src/com/google/inject/multibindings/package-info.java"
        "core/src/com/google/inject/name/Named.java"
        "core/src/com/google/inject/name/NamedImpl.java"
        "core/src/com/google/inject/name/Names.java"
        "core/src/com/google/inject/name/package-info.java"
        "core/src/com/google/inject/spi/BindingScopingVisitor.java"
        "core/src/com/google/inject/spi/BindingTargetVisitor.java"
        "core/src/com/google/inject/spi/ConstructorBinding.java"
        "core/src/com/google/inject/spi/ConvertedConstantBinding.java"
        "core/src/com/google/inject/spi/DefaultBindingScopingVisitor.java"
        "core/src/com/google/inject/spi/DefaultBindingTargetVisitor.java"
        "core/src/com/google/inject/spi/DefaultElementVisitor.java"
        "core/src/com/google/inject/spi/Dependency.java"
        "core/src/com/google/inject/spi/DependencyAndSource.java"
        "core/src/com/google/inject/spi/DisableCircularProxiesOption.java"
        "core/src/com/google/inject/spi/Element.java"
        "core/src/com/google/inject/spi/ElementSource.java"
        "core/src/com/google/inject/spi/ElementVisitor.java"
        "core/src/com/google/inject/spi/Elements.java"
        "core/src/com/google/inject/spi/ExposedBinding.java"
        "core/src/com/google/inject/spi/HasDependencies.java"
        "core/src/com/google/inject/spi/InjectionListener.java"
        "core/src/com/google/inject/spi/InjectionPoint.java"
        "core/src/com/google/inject/spi/InjectionRequest.java"
        "core/src/com/google/inject/spi/InstanceBinding.java"
        "core/src/com/google/inject/spi/InterceptorBinding.java"
        "core/src/com/google/inject/spi/LinkedKeyBinding.java"
        "core/src/com/google/inject/spi/MembersInjectorLookup.java"
        "core/src/com/google/inject/spi/Message.java"
        "core/src/com/google/inject/spi/ModuleAnnotatedMethodScanner.java"
        "core/src/com/google/inject/spi/ModuleAnnotatedMethodScannerBinding.java"
        "core/src/com/google/inject/spi/ModuleSource.java"
        "core/src/com/google/inject/spi/PrivateElements.java"
        "core/src/com/google/inject/spi/ProviderBinding.java"
        "core/src/com/google/inject/spi/ProviderInstanceBinding.java"
        "core/src/com/google/inject/spi/ProviderKeyBinding.java"
        "core/src/com/google/inject/spi/ProviderLookup.java"
        "core/src/com/google/inject/spi/ProviderWithDependencies.java"
        "core/src/com/google/inject/spi/ProviderWithExtensionVisitor.java"
        "core/src/com/google/inject/spi/ProvidesMethodBinding.java"
        "core/src/com/google/inject/spi/ProvidesMethodTargetVisitor.java"
        "core/src/com/google/inject/spi/ProvisionListener.java"
        "core/src/com/google/inject/spi/ProvisionListenerBinding.java"
        "core/src/com/google/inject/spi/RequireAtInjectOnConstructorsOption.java"
        "core/src/com/google/inject/spi/RequireExactBindingAnnotationsOption.java"
        "core/src/com/google/inject/spi/RequireExplicitBindingsOption.java"
        "core/src/com/google/inject/spi/ScopeBinding.java"
        "core/src/com/google/inject/spi/StaticInjectionRequest.java"
        "core/src/com/google/inject/spi/Toolable.java"
        "core/src/com/google/inject/spi/TypeConverter.java"
        "core/src/com/google/inject/spi/TypeConverterBinding.java"
        "core/src/com/google/inject/spi/TypeEncounter.java"
        "core/src/com/google/inject/spi/TypeListener.java"
        "core/src/com/google/inject/spi/TypeListenerBinding.java"
        "core/src/com/google/inject/spi/UntargettedBinding.java"
        "core/src/com/google/inject/spi/package-info.java"
        "core/src/com/google/inject/util/Modules.java"
        "core/src/com/google/inject/util/Providers.java"
        "core/src/com/google/inject/util/Types.java"
        "core/src/com/google/inject/util/package-info.java"
    ];
    exclude_srcs = [
        "core/src/com/google/inject/spi/InterceptorBinding.java"
        "core/src/com/google/inject/internal/InterceptorBindingProcessor.java"
        "core/src/com/google/inject/internal/InterceptorStackCallback.java"
        "core/src/com/google/inject/internal/InterceptorStackCallback.java"
        "core/src/com/google/inject/internal/util/LineNumbers.java"
        "core/src/com/google/inject/internal/MethodAspect.java"
        "core/src/com/google/inject/internal/ProxyFactory.java"
    ];
};

guice_test_src_files = filegroup {
    name = "guice_test_src_files";
    srcs = [
        "core/test/com/google/inject/AllTests.java"
        "core/test/com/google/inject/Asserts.java"
        "core/test/com/google/inject/BinderTest.java"
        "core/test/com/google/inject/BinderTestSuite.java"
        "core/test/com/google/inject/BindingAnnotationTest.java"
        "core/test/com/google/inject/BindingOrderTest.java"
        "core/test/com/google/inject/BindingTest.java"
        "core/test/com/google/inject/BoundInstanceInjectionTest.java"
        "core/test/com/google/inject/BoundProviderTest.java"
        "core/test/com/google/inject/CircularDependencyTest.java"
        "core/test/com/google/inject/DuplicateBindingsTest.java"
        "core/test/com/google/inject/EagerSingletonTest.java"
        "core/test/com/google/inject/ErrorHandlingTest.java"
        "core/test/com/google/inject/GenericInjectionTest.java"
        "core/test/com/google/inject/ImplicitBindingTest.java"
        "core/test/com/google/inject/InjectorTest.java"
        "core/test/com/google/inject/IntegrationTest.java"
        "core/test/com/google/inject/JitBindingsTest.java"
        "core/test/com/google/inject/KeyTest.java"
        "core/test/com/google/inject/LoggerInjectionTest.java"
        "core/test/com/google/inject/MembersInjectorTest.java"
        "core/test/com/google/inject/MethodInterceptionTest.java"
        "core/test/com/google/inject/ModuleTest.java"
        "core/test/com/google/inject/ModulesTest.java"
        "core/test/com/google/inject/NullableInjectionPointTest.java"
        "core/test/com/google/inject/OptionalBindingTest.java"
        "core/test/com/google/inject/ParentInjectorTest.java"
        "core/test/com/google/inject/PerformanceComparison.java"
        "core/test/com/google/inject/PrivateModuleTest.java"
        "core/test/com/google/inject/ProviderInjectionTest.java"
        "core/test/com/google/inject/ProvisionExceptionTest.java"
        "core/test/com/google/inject/ProvisionExceptionsTest.java"
        "core/test/com/google/inject/ProvisionListenerTest.java"
        "core/test/com/google/inject/ReflectionTest.java"
        "core/test/com/google/inject/RequestInjectionTest.java"
        "core/test/com/google/inject/RequireAtInjectOnConstructorsTest.java"
        "core/test/com/google/inject/ScopesTest.java"
        "core/test/com/google/inject/SerializationTest.java"
        "core/test/com/google/inject/SuiteUtils.java"
        "core/test/com/google/inject/SuperclassTest.java"
        "core/test/com/google/inject/TypeConversionTest.java"
        "core/test/com/google/inject/TypeListenerTest.java"
        "core/test/com/google/inject/TypeLiteralInjectionTest.java"
        "core/test/com/google/inject/TypeLiteralTest.java"
        "core/test/com/google/inject/TypeLiteralTypeResolutionTest.java"
        "core/test/com/google/inject/example/ClientServiceWithDependencyInjection.java"
        "core/test/com/google/inject/example/ClientServiceWithFactories.java"
        "core/test/com/google/inject/example/ClientServiceWithGuice.java"
        "core/test/com/google/inject/example/ClientServiceWithGuiceDefaults.java"
        "core/test/com/google/inject/example/JndiProvider.java"
        "core/test/com/google/inject/example/JndiProviderClient.java"
        "core/test/com/google/inject/internal/Collector.java"
        "core/test/com/google/inject/internal/CycleDetectingLockTest.java"
        "core/test/com/google/inject/internal/InternalProvisionExceptionTest.java"
        "core/test/com/google/inject/internal/MapBinderTest.java"
        "core/test/com/google/inject/internal/MoreTypesTest.java"
        "core/test/com/google/inject/internal/MultibinderTest.java"
        "core/test/com/google/inject/internal/OptionalBinderTest.java"
        "core/test/com/google/inject/internal/ProxyFactoryTest.java"
        "core/test/com/google/inject/internal/RealElementTest.java"
        "core/test/com/google/inject/internal/SpiUtils.java"
        "core/test/com/google/inject/internal/UniqueAnnotationsTest.java"
        "core/test/com/google/inject/internal/WeakKeySetTest.java"
        "core/test/com/google/inject/internal/WeakKeySetUtils.java"
        "core/test/com/google/inject/internal/util/LineNumbersTest.java"
        "core/test/com/google/inject/matcher/MatcherTest.java"
        "core/test/com/google/inject/multibindings/ProvidesIntoTest.java"
        "core/test/com/google/inject/name/NamedEquivalanceTest.java"
        "core/test/com/google/inject/name/NamesTest.java"
        "core/test/com/google/inject/spi/BindingTargetVisitorTest.java"
        "core/test/com/google/inject/spi/ElementApplyToTest.java"
        "core/test/com/google/inject/spi/ElementSourceTest.java"
        "core/test/com/google/inject/spi/ElementsTest.java"
        "core/test/com/google/inject/spi/FailingBindingScopingVisitor.java"
        "core/test/com/google/inject/spi/FailingElementVisitor.java"
        "core/test/com/google/inject/spi/FailingTargetVisitor.java"
        "core/test/com/google/inject/spi/HasDependenciesTest.java"
        "core/test/com/google/inject/spi/InjectionPointTest.java"
        "core/test/com/google/inject/spi/InjectorSpiTest.java"
        "core/test/com/google/inject/spi/MessageTest.java"
        "core/test/com/google/inject/spi/ModuleAnnotatedMethodScannerTest.java"
        "core/test/com/google/inject/spi/ModuleRewriterTest.java"
        "core/test/com/google/inject/spi/ModuleSourceTest.java"
        "core/test/com/google/inject/spi/ProviderMethodsTest.java"
        "core/test/com/google/inject/spi/SpiBindingsTest.java"
        "core/test/com/google/inject/spi/ToolStageInjectorTest.java"
        "core/test/com/google/inject/util/NoopOverrideTest.java"
        "core/test/com/google/inject/util/OverrideModuleTest.java"
        "core/test/com/google/inject/util/ProvidersTest.java"
        "core/test/com/google/inject/util/TypesTest.java"
        "core/test/com/googlecode/guice/BytecodeGenTest.java"
        "core/test/com/googlecode/guice/GuiceTck.java"
        "core/test/com/googlecode/guice/Jsr330Test.java"
        "core/test/com/googlecode/guice/OSGiContainerTest.java"
        "core/test/com/googlecode/guice/PackageVisibilityTestModule.java"
        "core/test/com/googlecode/guice/bundle/OSGiTestActivator.java"
    ];
    exclude_srcs = [
        "core/test/com/googlecode/guice/BytecodeGenTest.java"
        "core/test/com/google/inject/IntegrationTest.java"
        "core/test/com/google/inject/MethodInterceptionTest.java"
        "core/test/com/google/inject/internal/ProxyFactoryTest.java"
    ];
};

#  Copy munge.jar to a srcjar.
#  Remove MungeTask.java, which is missing ant dependencies in Android.
guice_munge_srcjar = genrule {
    name = "guice_munge_srcjar";
    out = ["guice_munge.srcjar"];
    srcs = ["lib/build/munge.jar"];
    cmd = "zip --temp-path $\${TMPDIR:-/tmp} $(in) -O $(out) -d MungeTask.java";
};

guice_munge_manifest = genrule {
    name = "guice_munge_manifest";
    out = ["guice_munge.manifest"];
    srcs = ["lib/build/munge.jar"];
    cmd = "unzip -p -q $(in) META-INF/MANIFEST.MF > $(out)";
};

guice_munge = java_binary_host {
    name = "guice_munge";
    srcs = [":guice_munge_srcjar"];
    manifest = ":guice_munge_manifest";
    libs = ["junit"];
};

guice_munged_srcs = genrule {
    name = "guice_munged_srcs";
    srcs = [":guice_srcs"];
    out = ["guice_munged_srcs.srcjar"];
    tools = [
        "guice_munge"
        "soong_zip"
    ];
    cmd = "for src in $(in); do " +
        "  mkdir -p $$(dirname $(genDir)/$\${src}) && " +
        "  $(location guice_munge) -DNO_AOP $\${src} > $(genDir)/$\${src} || exit 1; " +
        " done && " +
        " $(location soong_zip) -o $(out) -C $(genDir) -D $(genDir)";
};

#  Target-side Dalvik, host-side, and host-side Dalvik build

guice = java_library_static {
    name = "guice";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";
    srcs = [":guice_munged_srcs"];
    static_libs = [
        "guava"
        "jsr330"
    ];
};

#  Variation that doesn't link guava statically
guice-no-guava = java_library_static {
    name = "guice-no-guava";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";
    srcs = [":guice_munged_srcs"];
    libs = [
        "guava"
    ];
    static_libs = [
        "jsr330"
    ];
};

#  TODO: Consider adding tests.

in { inherit guice guice-no-guava guice_munge guice_munge_manifest guice_munge_srcjar guice_munged_srcs guice_srcs guice_test_src_files; }
