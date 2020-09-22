{ droidstubs, java_library, java_library_host }:
let

#
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

#  Build jacoco-agent from sources for the platform
#
#  Note: this is only intended to be used for the platform development. This is *not* intended
#  to be used in the SDK where apps can use the official jacoco release.
jacocoagent = java_library {
    name = "jacocoagent";
    installable = true;

    apex_available = [
        "//apex_available:anyapex"
        "//apex_available:platform"
    ];

    srcs = [
        "org.jacoco.core/src/org/jacoco/core/JaCoCo.java"
        "org.jacoco.core/src/org/jacoco/core/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/Analyzer.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/CounterComparator.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/CoverageBuilder.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/CoverageNodeImpl.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/IBundleCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/IClassCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ICounter.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ICoverageNode.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ICoverageVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ILine.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/IMethodCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/IPackageCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ISourceFileCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ISourceNode.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/NodeComparator.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/data/ExecutionData.java"
        "org.jacoco.core/src/org/jacoco/core/data/ExecutionDataReader.java"
        "org.jacoco.core/src/org/jacoco/core/data/ExecutionDataStore.java"
        "org.jacoco.core/src/org/jacoco/core/data/ExecutionDataWriter.java"
        "org.jacoco.core/src/org/jacoco/core/data/IExecutionDataVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/data/ISessionInfoVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/data/IncompatibleExecDataVersionException.java"
        "org.jacoco.core/src/org/jacoco/core/data/SessionInfo.java"
        "org.jacoco.core/src/org/jacoco/core/data/SessionInfoStore.java"
        "org.jacoco.core/src/org/jacoco/core/data/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/instr/Instrumenter.java"
        "org.jacoco.core/src/org/jacoco/core/instr/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/internal/ContentTypeDetector.java"
        "org.jacoco.core/src/org/jacoco/core/internal/InputStreams.java"
        "org.jacoco.core/src/org/jacoco/core/internal/Pack200Streams.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/BundleCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/ClassAnalyzer.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/ClassCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/CounterImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/Instruction.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/InstructionsBuilder.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/LineImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/MethodAnalyzer.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/MethodCoverageCalculator.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/MethodCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/PackageCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/SourceFileCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/SourceNodeImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/StringPool.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/AbstractMatcher.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/AnnotationGeneratedFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/EnumEmptyConstructorFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/EnumFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/Filters.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/FinallyFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/IFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/IFilterContext.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/IFilterOutput.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinCoroutineFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinDefaultArgumentsFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinGeneratedFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinInlineFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinLateinitFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinNotNullOperatorFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinUnsafeCastOperatorFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinWhenFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinWhenStringFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/PrivateEmptyNoArgConstructorFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/StringSwitchEcjFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/StringSwitchJavacFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/SynchronizedFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/SyntheticFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/TryWithResourcesEcjFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/TryWithResourcesJavac11Filter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/TryWithResourcesJavacFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/data/CRC64.java"
        "org.jacoco.core/src/org/jacoco/core/internal/data/CompactDataInput.java"
        "org.jacoco.core/src/org/jacoco/core/internal/data/CompactDataOutput.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/ClassProbesAdapter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/ClassProbesVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/FrameSnapshot.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/IFrame.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/IProbeIdGenerator.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/LabelFlowAnalyzer.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/LabelInfo.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/MethodProbesAdapter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/MethodProbesVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/MethodSanitizer.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ClassFieldProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ClassInstrumenter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/CondyProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/DuplicateFrameEliminator.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/IProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/IProbeInserter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/InstrSupport.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/InterfaceFieldProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/LocalProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/MethodInstrumenter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/NoneProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ProbeArrayStrategyFactory.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ProbeCounter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ProbeInserter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/SignatureRemover.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/AbstractRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/AgentOptions.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/CommandLineSupport.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/IExecutionDataAccessorGenerator.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/IRemoteCommandVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/IRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/InjectedClassRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/LoggerRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/ModifiedSystemClassRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/OfflineInstrumentationAccessGenerator.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/RemoteControlReader.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/RemoteControlWriter.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/RuntimeData.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/SystemPropertiesRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/URLStreamHandlerRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/WildcardMatcher.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/tools/ExecDumpClient.java"
        "org.jacoco.core/src/org/jacoco/core/tools/ExecFileLoader.java"
        "org.jacoco.core/src/org/jacoco/core/tools/package-info.java"
        "org.jacoco.agent/src/org/jacoco/agent/AgentJar.java"
        "org.jacoco.agent/src/org/jacoco/agent/package-info.java"
        "org.jacoco.agent.rt/src/com/vladium/emma/rt/RT.java"
        "org.jacoco.agent.rt/src/com/vladium/emma/rt/package-info.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/IAgent.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/RT.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/package-info.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/Agent.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/ClassFileDumper.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/ConfigLoader.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/CoverageTransformer.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/IExceptionLogger.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/JmxRegistration.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/Offline.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/PreMain.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/output/FileOutput.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/output/IAgentOutput.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/output/NoneOutput.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/output/TcpClientOutput.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/output/TcpConnection.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/output/TcpServerOutput.java"
    ];

    #  Some Jacoco source files depend on classes that do not exist in Android.
    #  While these classes are not executed at runtime (because we use offline
    #  instrumentation), they will cause issues when compiling them with ART
    #  during dex pre-opting. Therefore, it would prevent from applying code
    #  coverage on classes in the bootclasspath (frameworks, services, ...) or
    #  system apps.
    #  Note: we still may need to update the source code to cut dependencies in
    #  mandatory jacoco classes.
    exclude_srcs = [
        "org.jacoco.core/src/org/jacoco/core/runtime/ModifiedSystemClassRuntime.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/PreMain.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/CoverageTransformer.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/JmxRegistration.java"
    ];

    #  In order to include Jacoco in core libraries, we cannot depend on
    #  anything in the bootclasspath (or we would create dependency cycle).
    #  Therefore we compile against the SDK android.jar which gives the same
    #  APIs Jacoco depends on.
    sdk_version = "9";

    #  TODO(b/69671801): there's no bytecode on the device, so these shouldn't
    #  be necessary.
    static_libs = [
        "asm-7.0"
        "asm-commons-7.0"
        "asm-tree-7.0"
    ];
};

#  Generates stubs containing the classes that will be referenced by instrumented bytecode.
jacoco-stubs-gen = droidstubs {
    name = "jacoco-stubs-gen";
    srcs = ["org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/Offline.java"];
};

#  A stubs target containing the parts of JaCoCo that we need to add to the hidden API whitelist.
jacoco-stubs = java_library {
    name = "jacoco-stubs";
    compile_dex = true;
    srcs = [":jacoco-stubs-gen"];
};

#  Build jacoco-cli from sources for the platform

#  TODO(jeffrygaston) it'd be nice to keep the build process and/or list of source files in sync with
#  what is defined in the pom.xml files, although it's probably much more trouble than it's worth
jacoco-cli = java_library_host {
    name = "jacoco-cli";

    manifest = "org.jacoco.cli/src/MANIFEST.MF";

    srcs = [
        "org.jacoco.core/src/org/jacoco/core/JaCoCo.java"
        "org.jacoco.core/src/org/jacoco/core/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/Analyzer.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/CounterComparator.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/CoverageBuilder.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/CoverageNodeImpl.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/IBundleCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/IClassCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ICounter.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ICoverageNode.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ICoverageVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ILine.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/IMethodCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/IPackageCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ISourceFileCoverage.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/ISourceNode.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/NodeComparator.java"
        "org.jacoco.core/src/org/jacoco/core/analysis/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/data/ExecutionData.java"
        "org.jacoco.core/src/org/jacoco/core/data/ExecutionDataReader.java"
        "org.jacoco.core/src/org/jacoco/core/data/ExecutionDataStore.java"
        "org.jacoco.core/src/org/jacoco/core/data/ExecutionDataWriter.java"
        "org.jacoco.core/src/org/jacoco/core/data/IExecutionDataVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/data/ISessionInfoVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/data/IncompatibleExecDataVersionException.java"
        "org.jacoco.core/src/org/jacoco/core/data/SessionInfo.java"
        "org.jacoco.core/src/org/jacoco/core/data/SessionInfoStore.java"
        "org.jacoco.core/src/org/jacoco/core/data/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/instr/Instrumenter.java"
        "org.jacoco.core/src/org/jacoco/core/instr/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/internal/ContentTypeDetector.java"
        "org.jacoco.core/src/org/jacoco/core/internal/InputStreams.java"
        "org.jacoco.core/src/org/jacoco/core/internal/Pack200Streams.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/BundleCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/ClassAnalyzer.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/ClassCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/CounterImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/Instruction.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/InstructionsBuilder.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/LineImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/MethodAnalyzer.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/MethodCoverageCalculator.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/MethodCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/PackageCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/SourceFileCoverageImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/SourceNodeImpl.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/StringPool.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/AbstractMatcher.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/AnnotationGeneratedFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/EnumEmptyConstructorFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/EnumFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/Filters.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/FinallyFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/IFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/IFilterContext.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/IFilterOutput.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinCoroutineFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinDefaultArgumentsFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinGeneratedFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinInlineFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinLateinitFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinNotNullOperatorFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinUnsafeCastOperatorFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinWhenFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/KotlinWhenStringFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/PrivateEmptyNoArgConstructorFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/StringSwitchEcjFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/StringSwitchJavacFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/SynchronizedFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/SyntheticFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/TryWithResourcesEcjFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/TryWithResourcesJavac11Filter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/analysis/filter/TryWithResourcesJavacFilter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/data/CRC64.java"
        "org.jacoco.core/src/org/jacoco/core/internal/data/CompactDataInput.java"
        "org.jacoco.core/src/org/jacoco/core/internal/data/CompactDataOutput.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/ClassProbesAdapter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/ClassProbesVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/FrameSnapshot.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/IFrame.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/IProbeIdGenerator.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/LabelFlowAnalyzer.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/LabelInfo.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/MethodProbesAdapter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/MethodProbesVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/internal/flow/MethodSanitizer.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ClassFieldProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ClassInstrumenter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/CondyProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/DuplicateFrameEliminator.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/IProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/IProbeInserter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/InstrSupport.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/InterfaceFieldProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/LocalProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/MethodInstrumenter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/NoneProbeArrayStrategy.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ProbeArrayStrategyFactory.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ProbeCounter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/ProbeInserter.java"
        "org.jacoco.core/src/org/jacoco/core/internal/instr/SignatureRemover.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/AbstractRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/AgentOptions.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/CommandLineSupport.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/IExecutionDataAccessorGenerator.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/IRemoteCommandVisitor.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/IRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/InjectedClassRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/LoggerRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/ModifiedSystemClassRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/OfflineInstrumentationAccessGenerator.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/RemoteControlReader.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/RemoteControlWriter.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/RuntimeData.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/SystemPropertiesRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/URLStreamHandlerRuntime.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/WildcardMatcher.java"
        "org.jacoco.core/src/org/jacoco/core/runtime/package-info.java"
        "org.jacoco.core/src/org/jacoco/core/tools/ExecDumpClient.java"
        "org.jacoco.core/src/org/jacoco/core/tools/ExecFileLoader.java"
        "org.jacoco.core/src/org/jacoco/core/tools/package-info.java"
        "org.jacoco.report/src/org/jacoco/report/DirectorySourceFileLocator.java"
        "org.jacoco.report/src/org/jacoco/report/FileMultiReportOutput.java"
        "org.jacoco.report/src/org/jacoco/report/ILanguageNames.java"
        "org.jacoco.report/src/org/jacoco/report/IMultiReportOutput.java"
        "org.jacoco.report/src/org/jacoco/report/IReportGroupVisitor.java"
        "org.jacoco.report/src/org/jacoco/report/IReportVisitor.java"
        "org.jacoco.report/src/org/jacoco/report/ISourceFileLocator.java"
        "org.jacoco.report/src/org/jacoco/report/InputStreamSourceFileLocator.java"
        "org.jacoco.report/src/org/jacoco/report/JavaNames.java"
        "org.jacoco.report/src/org/jacoco/report/MultiReportVisitor.java"
        "org.jacoco.report/src/org/jacoco/report/MultiSourceFileLocator.java"
        "org.jacoco.report/src/org/jacoco/report/ZipMultiReportOutput.java"
        "org.jacoco.report/src/org/jacoco/report/package-info.java"
        "org.jacoco.report/src/org/jacoco/report/check/BundleChecker.java"
        "org.jacoco.report/src/org/jacoco/report/check/IViolationsOutput.java"
        "org.jacoco.report/src/org/jacoco/report/check/Limit.java"
        "org.jacoco.report/src/org/jacoco/report/check/Rule.java"
        "org.jacoco.report/src/org/jacoco/report/check/RulesChecker.java"
        "org.jacoco.report/src/org/jacoco/report/check/package-info.java"
        "org.jacoco.report/src/org/jacoco/report/csv/CSVFormatter.java"
        "org.jacoco.report/src/org/jacoco/report/csv/CSVGroupHandler.java"
        "org.jacoco.report/src/org/jacoco/report/csv/ClassRowWriter.java"
        "org.jacoco.report/src/org/jacoco/report/csv/DelimitedWriter.java"
        "org.jacoco.report/src/org/jacoco/report/csv/package-info.java"
        "org.jacoco.report/src/org/jacoco/report/html/HTMLFormatter.java"
        "org.jacoco.report/src/org/jacoco/report/html/package-info.java"
        "org.jacoco.report/src/org/jacoco/report/internal/AbstractGroupVisitor.java"
        "org.jacoco.report/src/org/jacoco/report/internal/NormalizedFileNames.java"
        "org.jacoco.report/src/org/jacoco/report/internal/ReportOutputFolder.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/HTMLElement.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/HTMLGroupVisitor.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/IHTMLReportContext.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/ILinkable.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/index/ElementIndex.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/index/IIndexUpdate.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/index/package-info.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/BundlePage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/ClassPage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/GroupPage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/MethodItem.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/NodePage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/PackagePage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/PackageSourcePage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/ReportPage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/SessionsPage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/SourceFileItem.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/SourceFilePage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/SourceHighlighter.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/page/TablePage.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/resources/Resources.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/resources/Styles.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/resources/package-info.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/BarColumn.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/CounterColumn.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/IColumnRenderer.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/ITableItem.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/LabelColumn.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/PercentageColumn.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/SortIndex.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/Table.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/TableItemComparator.java"
        "org.jacoco.report/src/org/jacoco/report/internal/html/table/package-info.java"
        "org.jacoco.report/src/org/jacoco/report/internal/xml/ReportElement.java"
        "org.jacoco.report/src/org/jacoco/report/internal/xml/XMLCoverageWriter.java"
        "org.jacoco.report/src/org/jacoco/report/internal/xml/XMLElement.java"
        "org.jacoco.report/src/org/jacoco/report/internal/xml/XMLGroupVisitor.java"
        "org.jacoco.report/src/org/jacoco/report/xml/XMLFormatter.java"
        "org.jacoco.report/src/org/jacoco/report/xml/package-info.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/Command.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/CommandHandler.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/CommandParser.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/Main.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/XmlDocumentation.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/commands/AllCommands.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/commands/ClassInfo.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/commands/Dump.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/commands/ExecInfo.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/commands/Instrument.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/commands/Merge.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/commands/Report.java"
        "org.jacoco.cli/src/org/jacoco/cli/internal/commands/Version.java"
    ];

    java_resource_dirs = [
        "org.jacoco.core/src"
        "org.jacoco.report/src"
    ];

    static_libs = [
        "asm-7.0"
        "asm-commons-7.0"
        "asm-tree-7.0"
        "args4j-2.0.28"
    ];

    dist = {
        targets = [
            "dist_files"
            "apps_only"
        ];
    };
};

in { inherit jacoco-cli jacoco-stubs jacoco-stubs-gen jacocoagent; }
