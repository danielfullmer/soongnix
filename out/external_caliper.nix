{ java_import_host, java_library, java_library_host, java_test_host }:
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

#  build caliper host jar
#  ============================================================

caliper = java_library_host {
    name = "caliper";

    srcs = [
        "caliper/src/main/java/com/google/caliper/AfterExperiment.java"
        "caliper/src/main/java/com/google/caliper/All.java"
        "caliper/src/main/java/com/google/caliper/BeforeExperiment.java"
        "caliper/src/main/java/com/google/caliper/Benchmark.java"
        "caliper/src/main/java/com/google/caliper/Param.java"
        "caliper/src/main/java/com/google/caliper/api/AfterRep.java"
        "caliper/src/main/java/com/google/caliper/api/BeforeRep.java"
        "caliper/src/main/java/com/google/caliper/api/Footprint.java"
        "caliper/src/main/java/com/google/caliper/api/Macrobenchmark.java"
        "caliper/src/main/java/com/google/caliper/api/ResultProcessor.java"
        "caliper/src/main/java/com/google/caliper/api/SkipThisScenarioException.java"
        "caliper/src/main/java/com/google/caliper/api/VmOptions.java"
        "caliper/src/main/java/com/google/caliper/bridge/AbstractLogMessageVisitor.java"
        "caliper/src/main/java/com/google/caliper/bridge/BridgeModule.java"
        "caliper/src/main/java/com/google/caliper/bridge/CommandLineSerializer.java"
        "caliper/src/main/java/com/google/caliper/bridge/FailureLogMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/GcLogMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/HotspotLogMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/LogMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/LogMessageParser.java"
        "caliper/src/main/java/com/google/caliper/bridge/LogMessageVisitor.java"
        "caliper/src/main/java/com/google/caliper/bridge/OpenedSocket.java"
        "caliper/src/main/java/com/google/caliper/bridge/Renderer.java"
        "caliper/src/main/java/com/google/caliper/bridge/ShouldContinueMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/StartMeasurementLogMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/StartupAnnounceMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/StopMeasurementLogMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/VmOptionLogMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/VmPropertiesLogMessage.java"
        "caliper/src/main/java/com/google/caliper/bridge/WorkerSpec.java"
        "caliper/src/main/java/com/google/caliper/bridge/package-info.java"
        "caliper/src/main/java/com/google/caliper/config/CaliperConfig.java"
        "caliper/src/main/java/com/google/caliper/config/CaliperConfigLoader.java"
        "caliper/src/main/java/com/google/caliper/config/ConfigModule.java"
        "caliper/src/main/java/com/google/caliper/config/InstrumentConfig.java"
        "caliper/src/main/java/com/google/caliper/config/InvalidConfigurationException.java"
        "caliper/src/main/java/com/google/caliper/config/LoggingConfigLoader.java"
        "caliper/src/main/java/com/google/caliper/config/ResultProcessorConfig.java"
        "caliper/src/main/java/com/google/caliper/config/VmConfig.java"
        "caliper/src/main/java/com/google/caliper/json/AnnotationExclusionStrategy.java"
        "caliper/src/main/java/com/google/caliper/json/GsonModule.java"
        "caliper/src/main/java/com/google/caliper/json/ImmutableListTypeAdatperFactory.java"
        "caliper/src/main/java/com/google/caliper/json/ImmutableMapTypeAdapterFactory.java"
        "caliper/src/main/java/com/google/caliper/json/ImmutableMultimapTypeAdapterFactory.java"
        "caliper/src/main/java/com/google/caliper/json/InstantTypeAdapter.java"
        "caliper/src/main/java/com/google/caliper/json/NaturallySortedMapTypeAdapterFactory.java"
        "caliper/src/main/java/com/google/caliper/memory/Chain.java"
        "caliper/src/main/java/com/google/caliper/memory/ObjectExplorer.java"
        "caliper/src/main/java/com/google/caliper/memory/ObjectGraphMeasurer.java"
        "caliper/src/main/java/com/google/caliper/memory/ObjectVisitor.java"
        "caliper/src/main/java/com/google/caliper/model/AllocationMeasurement.java"
        "caliper/src/main/java/com/google/caliper/model/ArbitraryMeasurement.java"
        "caliper/src/main/java/com/google/caliper/model/BenchmarkSpec.java"
        "caliper/src/main/java/com/google/caliper/model/Defaults.java"
        "caliper/src/main/java/com/google/caliper/model/ExcludeFromJson.java"
        "caliper/src/main/java/com/google/caliper/model/Host.java"
        "caliper/src/main/java/com/google/caliper/model/InstrumentSpec.java"
        "caliper/src/main/java/com/google/caliper/model/Measurement.java"
        "caliper/src/main/java/com/google/caliper/model/PersistentHashing.java"
        "caliper/src/main/java/com/google/caliper/model/Run.java"
        "caliper/src/main/java/com/google/caliper/model/Scenario.java"
        "caliper/src/main/java/com/google/caliper/model/StringMapFunnel.java"
        "caliper/src/main/java/com/google/caliper/model/Trial.java"
        "caliper/src/main/java/com/google/caliper/model/Value.java"
        "caliper/src/main/java/com/google/caliper/model/VmSpec.java"
        "caliper/src/main/java/com/google/caliper/model/package-info.java"
        "caliper/src/main/java/com/google/caliper/options/CaliperDirectory.java"
        "caliper/src/main/java/com/google/caliper/options/CaliperOptions.java"
        "caliper/src/main/java/com/google/caliper/options/CommandLineParser.java"
        "caliper/src/main/java/com/google/caliper/options/OptionsModule.java"
        "caliper/src/main/java/com/google/caliper/options/ParsedOptions.java"
        "caliper/src/main/java/com/google/caliper/options/package-info.java"
        "caliper/src/main/java/com/google/caliper/platform/Platform.java"
        "caliper/src/main/java/com/google/caliper/platform/SupportedPlatform.java"
        "caliper/src/main/java/com/google/caliper/platform/VirtualMachineException.java"
        "caliper/src/main/java/com/google/caliper/platform/dalvik/DalvikModule.java"
        "caliper/src/main/java/com/google/caliper/platform/dalvik/DalvikPlatform.java"
        "caliper/src/main/java/com/google/caliper/platform/jvm/EffectiveClassPath.java"
        "caliper/src/main/java/com/google/caliper/platform/jvm/JvmModule.java"
        "caliper/src/main/java/com/google/caliper/platform/jvm/JvmPlatform.java"
        "caliper/src/main/java/com/google/caliper/runner/AllocationInstrument.java"
        "caliper/src/main/java/com/google/caliper/runner/ArbitraryMeasurementInstrument.java"
        "caliper/src/main/java/com/google/caliper/runner/BenchmarkClass.java"
        "caliper/src/main/java/com/google/caliper/runner/BenchmarkClassChecker.java"
        "caliper/src/main/java/com/google/caliper/runner/BenchmarkClassModule.java"
        "caliper/src/main/java/com/google/caliper/runner/BenchmarkCreator.java"
        "caliper/src/main/java/com/google/caliper/runner/BenchmarkMethods.java"
        "caliper/src/main/java/com/google/caliper/runner/BenchmarkParameters.java"
        "caliper/src/main/java/com/google/caliper/runner/CaliperMain.java"
        "caliper/src/main/java/com/google/caliper/runner/CaliperRun.java"
        "caliper/src/main/java/com/google/caliper/runner/CommonInstrumentOptions.java"
        "caliper/src/main/java/com/google/caliper/runner/ConsoleOutput.java"
        "caliper/src/main/java/com/google/caliper/runner/EnvironmentGetter.java"
        "caliper/src/main/java/com/google/caliper/runner/Experiment.java"
        "caliper/src/main/java/com/google/caliper/runner/ExperimentComponent.java"
        "caliper/src/main/java/com/google/caliper/runner/ExperimentModule.java"
        "caliper/src/main/java/com/google/caliper/runner/ExperimentSelector.java"
        "caliper/src/main/java/com/google/caliper/runner/ExperimentingCaliperRun.java"
        "caliper/src/main/java/com/google/caliper/runner/ExperimentingRunnerModule.java"
        "caliper/src/main/java/com/google/caliper/runner/FullCartesianExperimentSelector.java"
        "caliper/src/main/java/com/google/caliper/runner/HttpUploader.java"
        "caliper/src/main/java/com/google/caliper/runner/Instrument.java"
        "caliper/src/main/java/com/google/caliper/runner/InstrumentComponent.java"
        "caliper/src/main/java/com/google/caliper/runner/InstrumentInjectorModule.java"
        "caliper/src/main/java/com/google/caliper/runner/InstrumentName.java"
        "caliper/src/main/java/com/google/caliper/runner/InstrumentOptions.java"
        "caliper/src/main/java/com/google/caliper/runner/InvalidBenchmarkException.java"
        "caliper/src/main/java/com/google/caliper/runner/InvalidInstrumentException.java"
        "caliper/src/main/java/com/google/caliper/runner/JarFinder.java"
        "caliper/src/main/java/com/google/caliper/runner/LocalPort.java"
        "caliper/src/main/java/com/google/caliper/runner/MainComponent.java"
        "caliper/src/main/java/com/google/caliper/runner/MainModule.java"
        "caliper/src/main/java/com/google/caliper/runner/NanoTimeGranularity.java"
        "caliper/src/main/java/com/google/caliper/runner/NanoTimeGranularityTester.java"
        "caliper/src/main/java/com/google/caliper/runner/OutputFileDumper.java"
        "caliper/src/main/java/com/google/caliper/runner/Parameter.java"
        "caliper/src/main/java/com/google/caliper/runner/ParameterSet.java"
        "caliper/src/main/java/com/google/caliper/runner/PlatformModule.java"
        "caliper/src/main/java/com/google/caliper/runner/ProxyWorkerException.java"
        "caliper/src/main/java/com/google/caliper/runner/ResultProcessorCreator.java"
        "caliper/src/main/java/com/google/caliper/runner/ResultsUploader.java"
        "caliper/src/main/java/com/google/caliper/runner/RunnerModule.java"
        "caliper/src/main/java/com/google/caliper/runner/Running.java"
        "caliper/src/main/java/com/google/caliper/runner/RuntimeInstrument.java"
        "caliper/src/main/java/com/google/caliper/runner/RuntimeShutdownHookRegistrar.java"
        "caliper/src/main/java/com/google/caliper/runner/ScheduledTrial.java"
        "caliper/src/main/java/com/google/caliper/runner/ServerSocketService.java"
        "caliper/src/main/java/com/google/caliper/runner/ServiceModule.java"
        "caliper/src/main/java/com/google/caliper/runner/ShutdownHookRegistrar.java"
        "caliper/src/main/java/com/google/caliper/runner/StreamService.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialFailureException.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialId.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialModule.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialNumber.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialOutputFactory.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialOutputFactoryService.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialOutputLogger.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialResult.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialResultFactory.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialRunLoop.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialSchedulingPolicy.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialScopeComponent.java"
        "caliper/src/main/java/com/google/caliper/runner/TrialScoped.java"
        "caliper/src/main/java/com/google/caliper/runner/UserCodeException.java"
        "caliper/src/main/java/com/google/caliper/runner/VirtualMachine.java"
        "caliper/src/main/java/com/google/caliper/runner/VmDataCollectingVisitor.java"
        "caliper/src/main/java/com/google/caliper/runner/WorkerProcess.java"
        "caliper/src/main/java/com/google/caliper/util/DisplayUsageException.java"
        "caliper/src/main/java/com/google/caliper/util/InvalidCommandException.java"
        "caliper/src/main/java/com/google/caliper/util/LinearTranslation.java"
        "caliper/src/main/java/com/google/caliper/util/OutputModule.java"
        "caliper/src/main/java/com/google/caliper/util/Parser.java"
        "caliper/src/main/java/com/google/caliper/util/Parsers.java"
        "caliper/src/main/java/com/google/caliper/util/Reflection.java"
        "caliper/src/main/java/com/google/caliper/util/ShortDuration.java"
        "caliper/src/main/java/com/google/caliper/util/Stderr.java"
        "caliper/src/main/java/com/google/caliper/util/Stdout.java"
        "caliper/src/main/java/com/google/caliper/util/Util.java"
        "caliper/src/main/java/com/google/caliper/worker/AggregateAllocationsRecorder.java"
        "caliper/src/main/java/com/google/caliper/worker/AllAllocationsRecorder.java"
        "caliper/src/main/java/com/google/caliper/worker/Allocation.java"
        "caliper/src/main/java/com/google/caliper/worker/AllocationRecorder.java"
        "caliper/src/main/java/com/google/caliper/worker/AllocationStats.java"
        "caliper/src/main/java/com/google/caliper/worker/ArbitraryMeasurementWorker.java"
        "caliper/src/main/java/com/google/caliper/worker/MacrobenchmarkAllocationWorker.java"
        "caliper/src/main/java/com/google/caliper/worker/MacrobenchmarkWorker.java"
        "caliper/src/main/java/com/google/caliper/worker/MicrobenchmarkAllocationWorker.java"
        "caliper/src/main/java/com/google/caliper/worker/RuntimeWorker.java"
        "caliper/src/main/java/com/google/caliper/worker/Worker.java"
        "caliper/src/main/java/com/google/caliper/worker/WorkerComponent.java"
        "caliper/src/main/java/com/google/caliper/worker/WorkerEventLog.java"
        "caliper/src/main/java/com/google/caliper/worker/WorkerMain.java"
        "caliper/src/main/java/com/google/caliper/worker/WorkerModule.java"
        "caliper/src/main/java/com/google/caliper/worker/WorkerOptions.java"
    ];
    java_resource_dirs = ["caliper/src/main/resources"];

    static_libs = [
        "apache-commons-math"
        "caliper-prebuilts"
        "dagger2"
        "dagger2-inject"
        "guava"
    ];

    #  Use Dagger2 annotation processor
    plugins = ["dagger2-compiler"];

    java_version = "1.8";
};

#  build caliper target api jar
#  ============================================================
#  This contains just those classes needed for benchmarks to compile.

caliper-api-target = java_library {
    name = "caliper-api-target";
    installable = true;

    srcs = [
        "caliper/src/main/java/com/google/caliper/AfterExperiment.java"
        "caliper/src/main/java/com/google/caliper/BeforeExperiment.java"
        "caliper/src/main/java/com/google/caliper/Param.java"
        "caliper/src/main/java/com/google/caliper/All.java"
        "caliper/src/main/java/com/google/caliper/Benchmark.java"
    ];
    sdk_version = "core_current";

    java_version = "1.8";
};

#  build caliper tests
#  ============================================================
#  vogar --expectations $ANDROID_BUILD_TOP/external/caliper/expectations/knownfailures.txt \
#         --test-only \
#         --classpath $ANDROID_BUILD_TOP/out/host/common/obj/JAVA_LIBRARIES/caliper-tests_intermediates/javalib.jar \
#         com.google.caliper

caliper-tests = java_test_host {
    name = "caliper-tests";

    srcs = [
        "caliper/src/test/java/com/google/caliper/bridge/GcLogMessageGenerator.java"
        "caliper/src/test/java/com/google/caliper/bridge/LogMessageParserTest.java"
        "caliper/src/test/java/com/google/caliper/config/CaliperConfigLoaderTest.java"
        "caliper/src/test/java/com/google/caliper/config/CaliperConfigTest.java"
        "caliper/src/test/java/com/google/caliper/config/LoggingConfigLoaderTest.java"
        "caliper/src/test/java/com/google/caliper/config/VmConfigTest.java"
        "caliper/src/test/java/com/google/caliper/memory/ObjectGraphMeasurerTest.java"
        "caliper/src/test/java/com/google/caliper/options/ParsedOptionsTest.java"
        "caliper/src/test/java/com/google/caliper/runner/AllocationInstrumentTest.java"
        "caliper/src/test/java/com/google/caliper/runner/ArbitraryMeasurmentInstrumentTest.java"
        "caliper/src/test/java/com/google/caliper/runner/BadUserCodeTest.java"
        "caliper/src/test/java/com/google/caliper/runner/BenchmarkClassCheckerTest.java"
        "caliper/src/test/java/com/google/caliper/runner/BenchmarkClassTest.java"
        "caliper/src/test/java/com/google/caliper/runner/BenchmarkCreatorTest.java"
        "caliper/src/test/java/com/google/caliper/runner/CaliperTestWatcher.java"
        "caliper/src/test/java/com/google/caliper/runner/ExperimentingRunnerModuleTest.java"
        "caliper/src/test/java/com/google/caliper/runner/FakeWorkers.java"
        "caliper/src/test/java/com/google/caliper/runner/InMemoryResultsUploader.java"
        "caliper/src/test/java/com/google/caliper/runner/MalformedBenchmarksTest.java"
        "caliper/src/test/java/com/google/caliper/runner/ResultProcessorCreatorTest.java"
        "caliper/src/test/java/com/google/caliper/runner/RuntimeInstrumentTest.java"
        "caliper/src/test/java/com/google/caliper/runner/ServerSocketServiceTest.java"
        "caliper/src/test/java/com/google/caliper/runner/StreamServiceTest.java"
        "caliper/src/test/java/com/google/caliper/runner/WorkerProcessTest.java"
        "caliper/src/test/java/com/google/caliper/util/LinearTranslationTest.java"
        "caliper/src/test/java/com/google/caliper/util/ShortDurationTest.java"
        "caliper/src/test/java/com/google/caliper/worker/RuntimeWorkerTest.java"
    ];
    java_resource_dirs = ["caliper/src/test/resources"];

    static_libs = [
        "caliper"
        "junit"
        "mockito"
    ];

    #  Use Dagger2 annotation processor
    plugins = ["dagger2-compiler"];

    java_version = "1.8";
};

#  build caliper examples
#  ============================================================

caliper-examples = java_library_host {
    name = "caliper-examples";

    srcs = [
        "examples/src/main/java/examples/ArraySortBenchmark.java"
        "examples/src/main/java/examples/BitSetBenchmark.java"
        "examples/src/main/java/examples/CharacterBenchmark.java"
        "examples/src/main/java/examples/CompressionSizeBenchmark.java"
        "examples/src/main/java/examples/ContainsBenchmark.java"
        "examples/src/main/java/examples/CopyArrayBenchmark.java"
        "examples/src/main/java/examples/DemoBenchmark.java"
        "examples/src/main/java/examples/DoubleToStringBenchmark.java"
        "examples/src/main/java/examples/DoubleToStringBenchmark2.java"
        "examples/src/main/java/examples/EnumSetContainsBenchmark.java"
        "examples/src/main/java/examples/ExpensiveObjectsBenchmark.java"
        "examples/src/main/java/examples/FormatterBenchmark.java"
        "examples/src/main/java/examples/IntModBenchmark.java"
        "examples/src/main/java/examples/ListIterationBenchmark.java"
        "examples/src/main/java/examples/ListModificationBenchmark.java"
        "examples/src/main/java/examples/LoopingBackwardsBenchmark.java"
        "examples/src/main/java/examples/MessageDigestCreationBenchmark.java"
        "examples/src/main/java/examples/NoOpBenchmark.java"
        "examples/src/main/java/examples/StringBuilderBenchmark.java"
        "examples/src/main/java/examples/Utf8Benchmark.java"
        "examples/src/main/java/examples/VarargsBenchmark.java"
    ];

    static_libs = [
        "caliper"
        "junit"
        "mockito"
    ];

    java_version = "1.8";
};

#  Build host dependencies.
#  ============================================================

caliper-gson = java_import_host {
    name = "caliper-gson";
    jars = ["lib/gson-2.2.2.jar"];
};

caliper-prebuilts = java_import_host {
    name = "caliper-prebuilts";
    jars = [
        "lib/gson-2.2.2.jar"
        "lib/java-allocation-instrumenter-2.0.jar"
        "lib/jersey-client-1.11.jar"
        "lib/jersey-core-1.11.jar"
        "lib/joda-time-2.1.jar"
        "lib/jsr311-api-1.1.1.jar"
    ];
};

in { inherit caliper caliper-api-target caliper-examples caliper-gson caliper-prebuilts caliper-tests; }
