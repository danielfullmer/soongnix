{ java_import_host, java_library, java_library_host, java_plugin }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

dagger2-auto-common = java_import_host {
    name = "dagger2-auto-common";
    jars = ["lib/auto-common-0.10.jar"];
};

dagger2-auto-factory-jar = java_import_host {
    name = "dagger2-auto-factory-jar";
    jars = ["lib/auto-factory-1.0-beta6.jar"];
};

dagger2-auto-factory = java_plugin {
    name = "dagger2-auto-factory";
    processor_class = "com.google.auto.factory.processor.AutoFactoryProcessor";
    static_libs = [
        "dagger2-auto-factory-jar"
        "dagger2-auto-common"
        "guava"
        "javapoet"
        "dagger2-google-java-format"
    ];
};

dagger2-auto-service-jar = java_import_host {
    name = "dagger2-auto-service-jar";
    jars = ["lib/auto-service-1.0-rc5.jar"];
};

dagger2-auto-service-annotations = java_import_host {
    name = "dagger2-auto-service-annotations";
    jars = ["lib/auto-service-annotations-1.0-rc5.jar"];
};

dagger2-auto-service = java_plugin {
    name = "dagger2-auto-service";
    processor_class = "com.google.auto.service.processor.AutoServiceProcessor";
    static_libs = [
        "dagger2-auto-common"
        "dagger2-auto-service-jar"
        "dagger2-auto-service-annotations"
        "guava"
    ];
};

dagger2-auto-value-jar = java_import_host {
    name = "dagger2-auto-value-jar";
    jars = ["lib/auto-value-1.6.5.jar"];
};

dagger2-auto-value-annotations = java_import_host {
    name = "dagger2-auto-value-annotations";
    jars = ["lib/auto-value-annotations-1.6.5.jar"];
};

dagger2-auto-value = java_plugin {
    name = "dagger2-auto-value";
    processor_class = "com.google.auto.value.processor.AutoValueProcessor";
    static_libs = [
        "dagger2-auto-value-jar"
        "dagger2-auto-value-annotations"
    ];
};

dagger2-auto-annotation = java_plugin {
    name = "dagger2-auto-annotation";
    processor_class = "com.google.auto.value.processor.AutoAnnotationProcessor";
    static_libs = ["dagger2-auto-value-jar"];
};

dagger2-google-java-format = java_import_host {
    name = "dagger2-google-java-format";
    jars = ["lib/google-java-format-1.7-all-deps.jar"];
};

dagger2-inject = java_import_host {
    name = "dagger2-inject";
    jars = ["lib/javax.inject-1.jar"];
};

dagger2-bootstrap-compiler-jar = java_import_host {
    name = "dagger2-bootstrap-compiler-jar";
    jars = ["java/dagger/internal/codegen/bootstrap_compiler_deploy.jar"];
};

dagger2-bootstrap-compiler = java_plugin {
    name = "dagger2-bootstrap-compiler";
    processor_class = "dagger.internal.codegen.ComponentProcessor";
    generates_api = true;
    static_libs = ["dagger2-bootstrap-compiler-jar"];
};

dagger2 = java_library_host {
    name = "dagger2";

    srcs = [
        "java/dagger/Binds.java"
        "java/dagger/BindsInstance.java"
        "java/dagger/BindsOptionalOf.java"
        "java/dagger/Component.java"
        "java/dagger/Lazy.java"
        "java/dagger/MapKey.java"
        "java/dagger/MembersInjector.java"
        "java/dagger/Module.java"
        "java/dagger/Provides.java"
        "java/dagger/Reusable.java"
        "java/dagger/Subcomponent.java"
        "java/dagger/package-info.java"
        "java/dagger/internal/AbstractMapFactory.java"
        "java/dagger/internal/Beta.java"
        "java/dagger/internal/ComponentDefinitionType.java"
        "java/dagger/internal/ConfigureInitializationParameters.java"
        "java/dagger/internal/DaggerCollections.java"
        "java/dagger/internal/DelegateFactory.java"
        "java/dagger/internal/DoubleCheck.java"
        "java/dagger/internal/Factory.java"
        "java/dagger/internal/GenerationOptions.java"
        "java/dagger/internal/GwtIncompatible.java"
        "java/dagger/internal/InstanceFactory.java"
        "java/dagger/internal/MapBuilder.java"
        "java/dagger/internal/MapFactory.java"
        "java/dagger/internal/MapProviderFactory.java"
        "java/dagger/internal/MembersInjectors.java"
        "java/dagger/internal/MemoizedSentinel.java"
        "java/dagger/internal/MissingBindingFactory.java"
        "java/dagger/internal/ModifiableBinding.java"
        "java/dagger/internal/ModifiableModule.java"
        "java/dagger/internal/Preconditions.java"
        "java/dagger/internal/ProviderOfLazy.java"
        "java/dagger/internal/SetBuilder.java"
        "java/dagger/internal/SetFactory.java"
        "java/dagger/internal/SingleCheck.java"
        "java/dagger/multibindings/ClassKey.java"
        "java/dagger/multibindings/ElementsIntoSet.java"
        "java/dagger/multibindings/IntKey.java"
        "java/dagger/multibindings/IntoMap.java"
        "java/dagger/multibindings/IntoSet.java"
        "java/dagger/multibindings/LongKey.java"
        "java/dagger/multibindings/Multibinds.java"
        "java/dagger/multibindings/StringKey.java"
        "java/dagger/multibindings/package-info.java"

    ];
    exclude_srcs = [
        "java/dagger/android/AndroidInjection.java"
        "java/dagger/android/AndroidInjectionKey.java"
        "java/dagger/android/AndroidInjectionModule.java"
        "java/dagger/android/AndroidInjector.java"
        "java/dagger/android/ContributesAndroidInjector.java"
        "java/dagger/android/DaggerActivity.java"
        "java/dagger/android/DaggerApplication.java"
        "java/dagger/android/DaggerBroadcastReceiver.java"
        "java/dagger/android/DaggerContentProvider.java"
        "java/dagger/android/DaggerDialogFragment.java"
        "java/dagger/android/DaggerFragment.java"
        "java/dagger/android/DaggerIntentService.java"
        "java/dagger/android/DaggerService.java"
        "java/dagger/android/DispatchingAndroidInjector.java"
        "java/dagger/android/HasActivityInjector.java"
        "java/dagger/android/HasAndroidInjector.java"
        "java/dagger/android/HasBroadcastReceiverInjector.java"
        "java/dagger/android/HasContentProviderInjector.java"
        "java/dagger/android/HasFragmentInjector.java"
        "java/dagger/android/HasServiceInjector.java"
        "java/dagger/android/package-info.java"
        "java/dagger/android/internal/AndroidInjectionKeys.java"
        "java/dagger/android/processor/AndroidInjectorDescriptor.java"
        "java/dagger/android/processor/AndroidMapKeyValidator.java"
        "java/dagger/android/processor/AndroidMapKeys.java"
        "java/dagger/android/processor/AndroidProcessor.java"
        "java/dagger/android/processor/ContributesAndroidInjectorGenerator.java"
        "java/dagger/android/processor/DuplicateAndroidInjectorsChecker.java"
        "java/dagger/android/support/AndroidSupportInjection.java"
        "java/dagger/android/support/AndroidSupportInjectionModule.java"
        "java/dagger/android/support/DaggerAppCompatActivity.java"
        "java/dagger/android/support/DaggerAppCompatDialogFragment.java"
        "java/dagger/android/support/DaggerApplication.java"
        "java/dagger/android/support/DaggerDialogFragment.java"
        "java/dagger/android/support/DaggerFragment.java"
        "java/dagger/android/support/HasSupportFragmentInjector.java"
        "java/dagger/android/support/package-info.java"
    ];

    static_libs = ["dagger2-inject"];

    libs = ["guava"];

    java_version = "1.8";
};

#  build dagger2 producers library
#  ============================================================

dagger2-producers = java_library_host {
    name = "dagger2-producers";

    srcs = [
        "java/dagger/producers/CancellationPolicy.java"
        "java/dagger/producers/Produced.java"
        "java/dagger/producers/Producer.java"
        "java/dagger/producers/ProducerModule.java"
        "java/dagger/producers/Producers.java"
        "java/dagger/producers/Produces.java"
        "java/dagger/producers/Production.java"
        "java/dagger/producers/ProductionComponent.java"
        "java/dagger/producers/ProductionScope.java"
        "java/dagger/producers/ProductionSubcomponent.java"
        "java/dagger/producers/package-info.java"
        "java/dagger/producers/internal/AbstractMapProducer.java"
        "java/dagger/producers/internal/AbstractProducer.java"
        "java/dagger/producers/internal/AbstractProducesMethodProducer.java"
        "java/dagger/producers/internal/CancellableProducer.java"
        "java/dagger/producers/internal/CancellationListener.java"
        "java/dagger/producers/internal/DelegateProducer.java"
        "java/dagger/producers/internal/DependencyMethodProducer.java"
        "java/dagger/producers/internal/MapOfProducedProducer.java"
        "java/dagger/producers/internal/MapOfProducerProducer.java"
        "java/dagger/producers/internal/MapProducer.java"
        "java/dagger/producers/internal/MissingBindingProducer.java"
        "java/dagger/producers/internal/Producers.java"
        "java/dagger/producers/internal/ProductionExecutorModule.java"
        "java/dagger/producers/internal/ProductionImplementation.java"
        "java/dagger/producers/internal/SetOfProducedProducer.java"
        "java/dagger/producers/internal/SetProducer.java"
        "java/dagger/producers/monitoring/ProducerMonitor.java"
        "java/dagger/producers/monitoring/ProducerTimingRecorder.java"
        "java/dagger/producers/monitoring/ProducerToken.java"
        "java/dagger/producers/monitoring/ProductionComponentMonitor.java"
        "java/dagger/producers/monitoring/ProductionComponentTimingRecorder.java"
        "java/dagger/producers/monitoring/TimingProducerMonitor.java"
        "java/dagger/producers/monitoring/TimingProductionComponentMonitor.java"
        "java/dagger/producers/monitoring/TimingRecorders.java"
        "java/dagger/producers/monitoring/package-info.java"
        "java/dagger/producers/monitoring/internal/Monitors.java"
    ];

    static_libs = [
        "dagger2-inject"
        "error_prone_annotations"
    ];

    libs = [
        "dagger2"
        "dagger2-android-annotation-stubs"
        "guava"
    ];

    java_version = "1.8";
};

#  build dagger2 compiler plugin
#  ============================================================

dagger2-compiler = java_plugin {
    name = "dagger2-compiler";
    processor_class = "dagger.internal.codegen.ComponentProcessor";
    generates_api = true;
    use_tools_jar = true;

    srcs = [
        "java/dagger/internal/codegen/AnnotationCreatorGenerator.java"
        "java/dagger/internal/codegen/AnnotationExpression.java"
        "java/dagger/internal/codegen/AnnotationProtoConverter.java"
        "java/dagger/internal/codegen/AnonymousProviderCreationExpression.java"
        "java/dagger/internal/codegen/AnyBindingMethodValidator.java"
        "java/dagger/internal/codegen/Binding.java"
        "java/dagger/internal/codegen/BindingDeclaration.java"
        "java/dagger/internal/codegen/BindingDeclarationFormatter.java"
        "java/dagger/internal/codegen/BindingElementValidator.java"
        "java/dagger/internal/codegen/BindingExpression.java"
        "java/dagger/internal/codegen/BindingFactory.java"
        "java/dagger/internal/codegen/BindingGraph.java"
        "java/dagger/internal/codegen/BindingGraphConverter.java"
        "java/dagger/internal/codegen/BindingGraphFactory.java"
        "java/dagger/internal/codegen/BindingGraphPlugins.java"
        "java/dagger/internal/codegen/BindingGraphStatisticsCollector.java"
        "java/dagger/internal/codegen/BindingGraphValidationModule.java"
        "java/dagger/internal/codegen/BindingGraphValidator.java"
        "java/dagger/internal/codegen/BindingMethodProcessingStep.java"
        "java/dagger/internal/codegen/BindingMethodValidator.java"
        "java/dagger/internal/codegen/BindingMethodValidatorsModule.java"
        "java/dagger/internal/codegen/BindingNode.java"
        "java/dagger/internal/codegen/BindingRequest.java"
        "java/dagger/internal/codegen/BindingType.java"
        "java/dagger/internal/codegen/BindsInstanceElementValidator.java"
        "java/dagger/internal/codegen/BindsInstanceMethodValidator.java"
        "java/dagger/internal/codegen/BindsInstanceParameterValidator.java"
        "java/dagger/internal/codegen/BindsInstanceProcessingStep.java"
        "java/dagger/internal/codegen/BindsMethodValidator.java"
        "java/dagger/internal/codegen/BindsOptionalOfMethodValidator.java"
        "java/dagger/internal/codegen/BindsTypeChecker.java"
        "java/dagger/internal/codegen/ChildFactoryMethodEdgeImpl.java"
        "java/dagger/internal/codegen/ClearableCache.java"
        "java/dagger/internal/codegen/CompilerOptions.java"
        "java/dagger/internal/codegen/ComponentAnnotation.java"
        "java/dagger/internal/codegen/ComponentBindingExpressions.java"
        "java/dagger/internal/codegen/ComponentCreatorAnnotation.java"
        "java/dagger/internal/codegen/ComponentCreatorDescriptor.java"
        "java/dagger/internal/codegen/ComponentCreatorImplementation.java"
        "java/dagger/internal/codegen/ComponentCreatorImplementationFactory.java"
        "java/dagger/internal/codegen/ComponentCreatorKind.java"
        "java/dagger/internal/codegen/ComponentCreatorValidator.java"
        "java/dagger/internal/codegen/ComponentDescriptor.java"
        "java/dagger/internal/codegen/ComponentDescriptorFactory.java"
        "java/dagger/internal/codegen/ComponentDescriptorValidator.java"
        "java/dagger/internal/codegen/ComponentGenerator.java"
        "java/dagger/internal/codegen/ComponentHierarchyValidator.java"
        "java/dagger/internal/codegen/ComponentHjarProcessingStep.java"
        "java/dagger/internal/codegen/ComponentImplementation.java"
        "java/dagger/internal/codegen/ComponentImplementationBuilder.java"
        "java/dagger/internal/codegen/ComponentImplementationFactory.java"
        "java/dagger/internal/codegen/ComponentInstanceBindingExpression.java"
        "java/dagger/internal/codegen/ComponentKind.java"
        "java/dagger/internal/codegen/ComponentMethodBindingExpression.java"
        "java/dagger/internal/codegen/ComponentNodeImpl.java"
        "java/dagger/internal/codegen/ComponentProcessingStep.java"
        "java/dagger/internal/codegen/ComponentProcessor.java"
        "java/dagger/internal/codegen/ComponentProvisionBindingExpression.java"
        "java/dagger/internal/codegen/ComponentRequirement.java"
        "java/dagger/internal/codegen/ComponentRequirementBindingExpression.java"
        "java/dagger/internal/codegen/ComponentRequirementExpression.java"
        "java/dagger/internal/codegen/ComponentRequirementExpressions.java"
        "java/dagger/internal/codegen/ComponentTreeTraverser.java"
        "java/dagger/internal/codegen/ComponentValidator.java"
        "java/dagger/internal/codegen/ConfigurationAnnotations.java"
        "java/dagger/internal/codegen/ContributionBinding.java"
        "java/dagger/internal/codegen/ContributionType.java"
        "java/dagger/internal/codegen/CurrentImplementationSubcomponent.java"
        "java/dagger/internal/codegen/DaggerGraphs.java"
        "java/dagger/internal/codegen/DaggerKythePlugin.java"
        "java/dagger/internal/codegen/DaggerStatistics.java"
        "java/dagger/internal/codegen/DaggerStatisticsCollectingProcessingStep.java"
        "java/dagger/internal/codegen/DaggerStatisticsCollector.java"
        "java/dagger/internal/codegen/DaggerStatisticsRecorder.java"
        "java/dagger/internal/codegen/DaggerStreams.java"
        "java/dagger/internal/codegen/DeferredModifiableBindingExpression.java"
        "java/dagger/internal/codegen/DelegateBindingExpression.java"
        "java/dagger/internal/codegen/DelegateDeclaration.java"
        "java/dagger/internal/codegen/DelegatingFrameworkInstanceCreationExpression.java"
        "java/dagger/internal/codegen/DependencyCycleValidator.java"
        "java/dagger/internal/codegen/DependencyEdgeImpl.java"
        "java/dagger/internal/codegen/DependencyMethodProducerCreationExpression.java"
        "java/dagger/internal/codegen/DependencyMethodProviderCreationExpression.java"
        "java/dagger/internal/codegen/DependencyRequestFactory.java"
        "java/dagger/internal/codegen/DependencyRequestFormatter.java"
        "java/dagger/internal/codegen/DependencyRequestValidator.java"
        "java/dagger/internal/codegen/DependencyVariableNamer.java"
        "java/dagger/internal/codegen/DependsOnProductionExecutorValidator.java"
        "java/dagger/internal/codegen/DerivedFromFrameworkInstanceBindingExpression.java"
        "java/dagger/internal/codegen/DeserializedComponentImplementationBuilder.java"
        "java/dagger/internal/codegen/DiagnosticFormatting.java"
        "java/dagger/internal/codegen/DiagnosticReporterFactory.java"
        "java/dagger/internal/codegen/DuplicateBindingsValidator.java"
        "java/dagger/internal/codegen/ElementFormatter.java"
        "java/dagger/internal/codegen/ErrorMessages.java"
        "java/dagger/internal/codegen/FactoryGenerator.java"
        "java/dagger/internal/codegen/FeatureStatus.java"
        "java/dagger/internal/codegen/Formatter.java"
        "java/dagger/internal/codegen/ForwardingCompilerOptions.java"
        "java/dagger/internal/codegen/FrameworkDependency.java"
        "java/dagger/internal/codegen/FrameworkField.java"
        "java/dagger/internal/codegen/FrameworkFieldInitializer.java"
        "java/dagger/internal/codegen/FrameworkInstanceBindingExpression.java"
        "java/dagger/internal/codegen/FrameworkInstanceSupplier.java"
        "java/dagger/internal/codegen/FrameworkType.java"
        "java/dagger/internal/codegen/FrameworkTypeMapper.java"
        "java/dagger/internal/codegen/FrameworkTypes.java"
        "java/dagger/internal/codegen/GenerationCompilerOptions.java"
        "java/dagger/internal/codegen/GenerationOptionsModule.java"
        "java/dagger/internal/codegen/GwtCompatibility.java"
        "java/dagger/internal/codegen/HjarSourceFileGenerator.java"
        "java/dagger/internal/codegen/ImmediateFutureBindingExpression.java"
        "java/dagger/internal/codegen/InaccessibleMapKeyProxyGenerator.java"
        "java/dagger/internal/codegen/IncompatiblyScopedBindingsValidator.java"
        "java/dagger/internal/codegen/InjectBindingRegistry.java"
        "java/dagger/internal/codegen/InjectBindingRegistryImpl.java"
        "java/dagger/internal/codegen/InjectBindingRegistryModule.java"
        "java/dagger/internal/codegen/InjectBindingValidator.java"
        "java/dagger/internal/codegen/InjectProcessingStep.java"
        "java/dagger/internal/codegen/InjectValidator.java"
        "java/dagger/internal/codegen/InjectionAnnotations.java"
        "java/dagger/internal/codegen/InjectionMethod.java"
        "java/dagger/internal/codegen/InjectionMethods.java"
        "java/dagger/internal/codegen/InjectionOrProvisionProviderCreationExpression.java"
        "java/dagger/internal/codegen/InjectionSiteFactory.java"
        "java/dagger/internal/codegen/InnerSwitchingProviders.java"
        "java/dagger/internal/codegen/InstanceFactoryCreationExpression.java"
        "java/dagger/internal/codegen/JavacPluginModule.java"
        "java/dagger/internal/codegen/KeyFactory.java"
        "java/dagger/internal/codegen/KeyVariableNamer.java"
        "java/dagger/internal/codegen/Keys.java"
        "java/dagger/internal/codegen/MapBindingExpression.java"
        "java/dagger/internal/codegen/MapFactoryCreationExpression.java"
        "java/dagger/internal/codegen/MapKeyAccessibility.java"
        "java/dagger/internal/codegen/MapKeyProcessingStep.java"
        "java/dagger/internal/codegen/MapKeyValidator.java"
        "java/dagger/internal/codegen/MapKeys.java"
        "java/dagger/internal/codegen/MapMultibindingValidator.java"
        "java/dagger/internal/codegen/MapType.java"
        "java/dagger/internal/codegen/MemberSelect.java"
        "java/dagger/internal/codegen/MembersInjectionBinding.java"
        "java/dagger/internal/codegen/MembersInjectionBindingExpression.java"
        "java/dagger/internal/codegen/MembersInjectionMethods.java"
        "java/dagger/internal/codegen/MembersInjectionValidator.java"
        "java/dagger/internal/codegen/MembersInjectorGenerator.java"
        "java/dagger/internal/codegen/MembersInjectorProviderCreationExpression.java"
        "java/dagger/internal/codegen/MethodBindingExpression.java"
        "java/dagger/internal/codegen/MethodSignature.java"
        "java/dagger/internal/codegen/MethodSignatureFormatter.java"
        "java/dagger/internal/codegen/MissingBindingExpression.java"
        "java/dagger/internal/codegen/MissingBindingValidator.java"
        "java/dagger/internal/codegen/ModifiableAbstractMethodBindingExpression.java"
        "java/dagger/internal/codegen/ModifiableBindingExpressions.java"
        "java/dagger/internal/codegen/ModifiableBindingMethods.java"
        "java/dagger/internal/codegen/ModifiableBindingType.java"
        "java/dagger/internal/codegen/ModifiableConcreteMethodBindingExpression.java"
        "java/dagger/internal/codegen/ModuleAnnotation.java"
        "java/dagger/internal/codegen/ModuleConstructorProxyGenerator.java"
        "java/dagger/internal/codegen/ModuleDescriptor.java"
        "java/dagger/internal/codegen/ModuleGenerator.java"
        "java/dagger/internal/codegen/ModuleKind.java"
        "java/dagger/internal/codegen/ModuleProcessingStep.java"
        "java/dagger/internal/codegen/ModuleProxies.java"
        "java/dagger/internal/codegen/ModuleValidator.java"
        "java/dagger/internal/codegen/MonitoringModuleGenerator.java"
        "java/dagger/internal/codegen/MonitoringModuleProcessingStep.java"
        "java/dagger/internal/codegen/MoreAnnotationMirrors.java"
        "java/dagger/internal/codegen/MoreAnnotationValues.java"
        "java/dagger/internal/codegen/MultibindingAnnotations.java"
        "java/dagger/internal/codegen/MultibindingAnnotationsProcessingStep.java"
        "java/dagger/internal/codegen/MultibindingDeclaration.java"
        "java/dagger/internal/codegen/MultibindingExpression.java"
        "java/dagger/internal/codegen/MultibindingFactoryCreationExpression.java"
        "java/dagger/internal/codegen/MultibindsMethodValidator.java"
        "java/dagger/internal/codegen/NullableBindingValidator.java"
        "java/dagger/internal/codegen/OptionalBindingDeclaration.java"
        "java/dagger/internal/codegen/OptionalBindingExpression.java"
        "java/dagger/internal/codegen/OptionalFactories.java"
        "java/dagger/internal/codegen/OptionalFactoryInstanceCreationExpression.java"
        "java/dagger/internal/codegen/OptionalType.java"
        "java/dagger/internal/codegen/Optionals.java"
        "java/dagger/internal/codegen/ParentComponent.java"
        "java/dagger/internal/codegen/PerComponentImplementation.java"
        "java/dagger/internal/codegen/PerGeneratedFile.java"
        "java/dagger/internal/codegen/PrivateMethodBindingExpression.java"
        "java/dagger/internal/codegen/ProcessingEnvironmentCompilerOptions.java"
        "java/dagger/internal/codegen/ProcessingEnvironmentModule.java"
        "java/dagger/internal/codegen/ProcessingOptions.java"
        "java/dagger/internal/codegen/ProcessingRoundCacheModule.java"
        "java/dagger/internal/codegen/ProducerCreationExpression.java"
        "java/dagger/internal/codegen/ProducerEntryPointView.java"
        "java/dagger/internal/codegen/ProducerFactoryGenerator.java"
        "java/dagger/internal/codegen/ProducerFromProviderCreationExpression.java"
        "java/dagger/internal/codegen/ProducerNodeInstanceBindingExpression.java"
        "java/dagger/internal/codegen/ProducesMethodValidator.java"
        "java/dagger/internal/codegen/ProductionBinding.java"
        "java/dagger/internal/codegen/ProviderInstanceBindingExpression.java"
        "java/dagger/internal/codegen/ProvidesMethodValidator.java"
        "java/dagger/internal/codegen/ProvisionBinding.java"
        "java/dagger/internal/codegen/ProvisionDependencyOnProducerBindingValidator.java"
        "java/dagger/internal/codegen/PrunedConcreteMethodBindingExpression.java"
        "java/dagger/internal/codegen/RequestKinds.java"
        "java/dagger/internal/codegen/ResolvedBindings.java"
        "java/dagger/internal/codegen/Scopes.java"
        "java/dagger/internal/codegen/SetBindingExpression.java"
        "java/dagger/internal/codegen/SetFactoryCreationExpression.java"
        "java/dagger/internal/codegen/SetType.java"
        "java/dagger/internal/codegen/SimpleAnnotationMirror.java"
        "java/dagger/internal/codegen/SimpleInvocationBindingExpression.java"
        "java/dagger/internal/codegen/SimpleMethodBindingExpression.java"
        "java/dagger/internal/codegen/SimpleTypeAnnotationValue.java"
        "java/dagger/internal/codegen/SourceFileGenerationException.java"
        "java/dagger/internal/codegen/SourceFileGenerator.java"
        "java/dagger/internal/codegen/SourceFileGeneratorsModule.java"
        "java/dagger/internal/codegen/SourceFiles.java"
        "java/dagger/internal/codegen/SpiModule.java"
        "java/dagger/internal/codegen/SubcomponentCreatorBindingEdgeImpl.java"
        "java/dagger/internal/codegen/SubcomponentCreatorBindingExpression.java"
        "java/dagger/internal/codegen/SubcomponentDeclaration.java"
        "java/dagger/internal/codegen/SubcomponentFactoryMethodValidator.java"
        "java/dagger/internal/codegen/SubcomponentNames.java"
        "java/dagger/internal/codegen/SwitchingProviders.java"
        "java/dagger/internal/codegen/SystemComponentsModule.java"
        "java/dagger/internal/codegen/TopLevel.java"
        "java/dagger/internal/codegen/TopLevelImplementationComponent.java"
        "java/dagger/internal/codegen/TypeCheckingProcessingStep.java"
        "java/dagger/internal/codegen/TypeProtoConverter.java"
        "java/dagger/internal/codegen/UniqueNameSet.java"
        "java/dagger/internal/codegen/UnwrappedMapKeyGenerator.java"
        "java/dagger/internal/codegen/Util.java"
        "java/dagger/internal/codegen/Validation.java"
        "java/dagger/internal/codegen/ValidationReport.java"
        "java/dagger/internal/codegen/ValidationType.java"
        "java/dagger/internal/codegen/package-info.java"
        "java/dagger/internal/codegen/javapoet/AnnotationSpecs.java"
        "java/dagger/internal/codegen/javapoet/CodeBlocks.java"
        "java/dagger/internal/codegen/javapoet/Expression.java"
        "java/dagger/internal/codegen/javapoet/TypeNames.java"
        "java/dagger/internal/codegen/javapoet/TypeSpecs.java"
        "java/dagger/internal/codegen/langmodel/Accessibility.java"
        "java/dagger/internal/codegen/langmodel/DaggerElements.java"
        "java/dagger/internal/codegen/langmodel/DaggerTypes.java"
        "java/dagger/internal/codegen/serialization/ProtoSerialization.java"
        "java/dagger/internal/codegen/dagger_statistics.proto"
        "java/dagger/internal/codegen/serialization/serialization.proto"

        "java/dagger/model/Binding.java"
        "java/dagger/model/BindingGraph.java"
        "java/dagger/model/BindingGraphProxies.java"
        "java/dagger/model/BindingKind.java"
        "java/dagger/model/ComponentPath.java"
        "java/dagger/model/DependencyRequest.java"
        "java/dagger/model/Key.java"
        "java/dagger/model/RequestKind.java"
        "java/dagger/model/Scope.java"
        "java/dagger/model/package-info.java"
        "java/dagger/spi/BindingGraphPlugin.java"
        "java/dagger/spi/DiagnosticReporter.java"
        "java/dagger/spi/package-info.java"
    ];

    exclude_srcs = [
        "java/dagger/internal/codegen/BindingGraphStatisticsCollector.java"
        "java/dagger/internal/codegen/DaggerKythePlugin.java"
    ];

    #  Manually include META-INF/services/javax.annotation.processing.Processor
    #  as the AutoService processor doesn't work properly.
    java_resource_dirs = ["resources"];

    static_libs = [
        "dagger2"
        "dagger2-auto-common"
        "dagger2-auto-factory"
        "dagger2-auto-service"
        "dagger2-auto-value"
        "dagger2-google-java-format"
        "dagger2-inject"
        "dagger2-producers"
        "guava"
        "javapoet"
    ];

    #  shade guava to avoid conflicts with guava embedded in Error Prone.
    jarjar_rules = "jarjar-rules.txt";

    libs = [
        "dagger2-android-annotation-stubs"
    ];

    plugins = [
        "dagger2-auto-factory"
        "dagger2-auto-service"
        "dagger2-auto-value"
        "dagger2-auto-annotation"
        "dagger2-bootstrap-compiler"
    ];

    proto = {
        type = "full";
        include_dirs = ["external/protobuf/src/"];
    };

    java_version = "1.8";
};

#  Compile  dummy implementations of annotations used by dagger2 but not
#  present in the Android tree.
dagger2-android-annotation-stubs = java_library {
    name = "dagger2-android-annotation-stubs";
    host_supported = true;
    sdk_version = "core_current";
    srcs = [
        "android-annotation-stubs/src/net/ltgt/gradle/incap/IncrementalAnnotationProcessor.java"
        "android-annotation-stubs/src/net/ltgt/gradle/incap/IncrementalAnnotationProcessorType.java"
        "android-annotation-stubs/src/org/checkerframework/checker/nullness/compatqual/NullableDecl.java"
    ];
};

in { inherit dagger2 dagger2-android-annotation-stubs dagger2-auto-annotation dagger2-auto-common dagger2-auto-factory dagger2-auto-factory-jar dagger2-auto-service dagger2-auto-service-annotations dagger2-auto-service-jar dagger2-auto-value dagger2-auto-value-annotations dagger2-auto-value-jar dagger2-bootstrap-compiler dagger2-bootstrap-compiler-jar dagger2-compiler dagger2-google-java-format dagger2-inject dagger2-producers; }
