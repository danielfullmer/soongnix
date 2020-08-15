{ java_import_host, java_library_host, java_plugin }:
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
    jars = ["lib/auto-common-1.0-20151022.071545-39.jar"];
};

dagger2-auto-factory-jar = java_import_host {
    name = "dagger2-auto-factory-jar";
    jars = ["lib/auto-factory-1.0-20150915.183854-35.jar"];
};

dagger2-auto-factory = java_plugin {
    name = "dagger2-auto-factory";
    processor_class = "com.google.auto.factory.processor.AutoFactoryProcessor";
    static_libs = [
        "dagger2-auto-factory-jar"
        "dagger2-auto-common"
        "guava"
    ];
};

dagger2-auto-service-jar = java_import_host {
    name = "dagger2-auto-service-jar";
    jars = ["lib/auto-service-1.0-rc2.jar"];
};

dagger2-auto-service = java_plugin {
    name = "dagger2-auto-service";
    processor_class = "com.google.auto.service.processor.AutoServiceProcessor";
    static_libs = [
        "dagger2-auto-common"
        "dagger2-auto-service-jar"
        "guava"
    ];
};

dagger2-auto-value-jar = java_import_host {
    name = "dagger2-auto-value-jar";
    jars = ["lib/auto-value-1.4.1.jar"];
};

dagger2-auto-value = java_plugin {
    name = "dagger2-auto-value";
    processor_class = "com.google.auto.value.processor.AutoValueProcessor";
    static_libs = ["dagger2-auto-value-jar"];
};

dagger2-auto-annotation = java_plugin {
    name = "dagger2-auto-annotation";
    processor_class = "com.google.auto.value.processor.AutoAnnotationProcessor";
    static_libs = ["dagger2-auto-value-jar"];
};

dagger2-google-java-format = java_import_host {
    name = "dagger2-google-java-format";
    jars = ["lib/google-java-format-0.1-20151017.042846-2.jar"];
};

dagger2-inject = java_import_host {
    name = "dagger2-inject";
    jars = ["lib/javax-inject.jar"];
};

dagger2 = java_library_host {
    name = "dagger2";

    srcs = [
        "core/src/main/java/dagger/Component.java"
        "core/src/main/java/dagger/Lazy.java"
        "core/src/main/java/dagger/MapKey.java"
        "core/src/main/java/dagger/MembersInjector.java"
        "core/src/main/java/dagger/Module.java"
        "core/src/main/java/dagger/Provides.java"
        "core/src/main/java/dagger/Subcomponent.java"
        "core/src/main/java/dagger/package-info.java"
        "core/src/main/java/dagger/internal/Beta.java"
        "core/src/main/java/dagger/internal/Collections.java"
        "core/src/main/java/dagger/internal/DelegateFactory.java"
        "core/src/main/java/dagger/internal/DoubleCheckLazy.java"
        "core/src/main/java/dagger/internal/Factory.java"
        "core/src/main/java/dagger/internal/InstanceFactory.java"
        "core/src/main/java/dagger/internal/MapFactory.java"
        "core/src/main/java/dagger/internal/MapProviderFactory.java"
        "core/src/main/java/dagger/internal/MembersInjectors.java"
        "core/src/main/java/dagger/internal/ScopedProvider.java"
        "core/src/main/java/dagger/internal/SetFactory.java"
        "core/src/main/java/dagger/mapkeys/ClassKey.java"
        "core/src/main/java/dagger/mapkeys/IntKey.java"
        "core/src/main/java/dagger/mapkeys/LongKey.java"
        "core/src/main/java/dagger/mapkeys/StringKey.java"
    ];

    static_libs = ["dagger2-inject"];

    libs = ["guava"];

    java_version = "1.7";
};

#  build dagger2 producers plugin
#  ============================================================

dagger2-producers = java_plugin {
    name = "dagger2-producers";

    srcs = [
        "producers/src/main/java/dagger/producers/Produced.java"
        "producers/src/main/java/dagger/producers/Producer.java"
        "producers/src/main/java/dagger/producers/ProducerModule.java"
        "producers/src/main/java/dagger/producers/Produces.java"
        "producers/src/main/java/dagger/producers/ProductionComponent.java"
        "producers/src/main/java/dagger/producers/internal/AbstractProducer.java"
        "producers/src/main/java/dagger/producers/internal/Producers.java"
        "producers/src/main/java/dagger/producers/internal/SetOfProducedProducer.java"
        "producers/src/main/java/dagger/producers/internal/SetProducer.java"
        "producers/src/main/java/dagger/producers/monitoring/ProducerMonitor.java"
        "producers/src/main/java/dagger/producers/monitoring/ProducerToken.java"
        "producers/src/main/java/dagger/producers/monitoring/ProductionComponentMonitor.java"
        "producers/src/main/java/dagger/producers/monitoring/package-info.java"
        "producers/src/main/java/dagger/producers/monitoring/internal/MonitorCache.java"
        "producers/src/main/java/dagger/producers/monitoring/internal/Monitors.java"
    ];

    static_libs = ["dagger2-inject"];

    libs = [
        "dagger2"
        "guava"
    ];

    java_version = "1.7";
};

#  build dagger2 compiler plugin
#  ============================================================

dagger2-compiler = java_plugin {
    name = "dagger2-compiler";
    processor_class = "dagger.internal.codegen.ComponentProcessor";
    generates_api = true;

    #  Required for use of javax.annotation.Generated per http://b/62050818
    javacflags = ["-J--add-modules=java.xml.ws.annotation"];
    srcs = [
        "compiler/src/main/java/dagger/internal/codegen/AbstractComponentProcessingStep.java"
        "compiler/src/main/java/dagger/internal/codegen/AbstractComponentWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/Binding.java"
        "compiler/src/main/java/dagger/internal/codegen/BindingGraph.java"
        "compiler/src/main/java/dagger/internal/codegen/BindingGraphValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/BindingKey.java"
        "compiler/src/main/java/dagger/internal/codegen/BuilderValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/ComponentDescriptor.java"
        "compiler/src/main/java/dagger/internal/codegen/ComponentGenerator.java"
        "compiler/src/main/java/dagger/internal/codegen/ComponentHierarchyValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/ComponentProcessingStep.java"
        "compiler/src/main/java/dagger/internal/codegen/ComponentProcessor.java"
        "compiler/src/main/java/dagger/internal/codegen/ComponentValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/ComponentWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/ConfigurationAnnotations.java"
        "compiler/src/main/java/dagger/internal/codegen/ContributionBinding.java"
        "compiler/src/main/java/dagger/internal/codegen/ContributionBindingFormatter.java"
        "compiler/src/main/java/dagger/internal/codegen/DependencyRequest.java"
        "compiler/src/main/java/dagger/internal/codegen/DependencyRequestFormatter.java"
        "compiler/src/main/java/dagger/internal/codegen/DependencyRequestMapper.java"
        "compiler/src/main/java/dagger/internal/codegen/DependencyVariableNamer.java"
        "compiler/src/main/java/dagger/internal/codegen/ErrorMessages.java"
        "compiler/src/main/java/dagger/internal/codegen/FactoryGenerator.java"
        "compiler/src/main/java/dagger/internal/codegen/Formatter.java"
        "compiler/src/main/java/dagger/internal/codegen/FrameworkField.java"
        "compiler/src/main/java/dagger/internal/codegen/InjectBindingRegistry.java"
        "compiler/src/main/java/dagger/internal/codegen/InjectConstructorValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/InjectFieldValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/InjectMethodValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/InjectProcessingStep.java"
        "compiler/src/main/java/dagger/internal/codegen/InjectionAnnotations.java"
        "compiler/src/main/java/dagger/internal/codegen/Key.java"
        "compiler/src/main/java/dagger/internal/codegen/KeyFormatter.java"
        "compiler/src/main/java/dagger/internal/codegen/KeyVariableNamer.java"
        "compiler/src/main/java/dagger/internal/codegen/MapKeyGenerator.java"
        "compiler/src/main/java/dagger/internal/codegen/MapKeyProcessingStep.java"
        "compiler/src/main/java/dagger/internal/codegen/MapKeyValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/MapKeys.java"
        "compiler/src/main/java/dagger/internal/codegen/MembersInjectionBinding.java"
        "compiler/src/main/java/dagger/internal/codegen/MembersInjectorGenerator.java"
        "compiler/src/main/java/dagger/internal/codegen/MethodSignature.java"
        "compiler/src/main/java/dagger/internal/codegen/MethodSignatureFormatter.java"
        "compiler/src/main/java/dagger/internal/codegen/MissingBindingSuggestions.java"
        "compiler/src/main/java/dagger/internal/codegen/ModuleDescriptor.java"
        "compiler/src/main/java/dagger/internal/codegen/ModuleProcessingStep.java"
        "compiler/src/main/java/dagger/internal/codegen/ModuleValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/MonitoringModuleGenerator.java"
        "compiler/src/main/java/dagger/internal/codegen/MonitoringModuleProcessingStep.java"
        "compiler/src/main/java/dagger/internal/codegen/ProducerFactoryGenerator.java"
        "compiler/src/main/java/dagger/internal/codegen/ProducerModuleProcessingStep.java"
        "compiler/src/main/java/dagger/internal/codegen/ProducesMethodValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/ProductionBinding.java"
        "compiler/src/main/java/dagger/internal/codegen/ProductionComponentProcessingStep.java"
        "compiler/src/main/java/dagger/internal/codegen/ProductionComponentValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/ProvidesMethodValidator.java"
        "compiler/src/main/java/dagger/internal/codegen/ProvisionBinding.java"
        "compiler/src/main/java/dagger/internal/codegen/ResolvedBindings.java"
        "compiler/src/main/java/dagger/internal/codegen/Scope.java"
        "compiler/src/main/java/dagger/internal/codegen/SourceFileGenerationException.java"
        "compiler/src/main/java/dagger/internal/codegen/SourceFileGenerator.java"
        "compiler/src/main/java/dagger/internal/codegen/SourceFiles.java"
        "compiler/src/main/java/dagger/internal/codegen/SubcomponentWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/Util.java"
        "compiler/src/main/java/dagger/internal/codegen/ValidationReport.java"
        "compiler/src/main/java/dagger/internal/codegen/ValidationType.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/AnnotationWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/ArrayTypeName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/BlockWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/ClassName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/ClassWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/ConstructorWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/EnumWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/FieldWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/HasClassReferences.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/HasTypeName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/IndentingAppendable.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/InterfaceWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/JavaWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/MethodWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/Modifiable.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/NullName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/ParameterizedTypeName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/PrimitiveName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/Snippet.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/StringLiteral.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/TypeName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/TypeNames.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/TypeVariableName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/TypeWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/VariableWriter.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/VoidName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/WildcardName.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/Writable.java"
        "compiler/src/main/java/dagger/internal/codegen/writer/Writables.java"
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
    ];

    plugins = [
        "dagger2-auto-factory"
        "dagger2-auto-service"
        "dagger2-auto-value"
        "dagger2-auto-annotation"
    ];

    java_version = "1.7";
};

in { inherit dagger2 dagger2-auto-annotation dagger2-auto-common dagger2-auto-factory dagger2-auto-factory-jar dagger2-auto-service dagger2-auto-service-jar dagger2-auto-value dagger2-auto-value-jar dagger2-compiler dagger2-google-java-format dagger2-inject dagger2-producers; }
