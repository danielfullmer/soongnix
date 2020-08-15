{ java_binary_host, java_defaults, java_library_host, java_test_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

trebuchet-defaults = java_defaults {
    name = "trebuchet-defaults";
    javacflags = [
        "-Xcoroutines=enable"
    ];
};

trebuchet-core = java_library_host {
    name = "trebuchet-core";
    defaults = ["trebuchet-defaults"];
    srcs = [
        "core/common/src/main/kotlin/trebuchet/collections/SparseArray.kt"
        "core/common/src/main/kotlin/trebuchet/extractors/Extractor.kt"
        "core/common/src/main/kotlin/trebuchet/extractors/ExtractorFactory.kt"
        "core/common/src/main/kotlin/trebuchet/extractors/ExtractorRegistry.kt"
        "core/common/src/main/kotlin/trebuchet/extractors/SystraceExtractor.kt"
        "core/common/src/main/kotlin/trebuchet/extractors/ZlibExtractor.kt"
        "core/common/src/main/kotlin/trebuchet/extras/ImportUtils.kt"
        "core/common/src/main/kotlin/trebuchet/extras/StreamAdapter.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ImportFeedback.kt"
        "core/common/src/main/kotlin/trebuchet/importers/Importer.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ImporterFactory.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ImporterRegistry.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/FtraceImporter.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/FtraceImporterState.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/FtraceLine.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/ImportData.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/events/EventParserState.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/events/FtraceEvent.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/events/FtraceEventRegistry.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/events/SchedEvent.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/events/TraceMarkerEvent.kt"
        "core/common/src/main/kotlin/trebuchet/importers/ftrace/events/WorkqueueEvent.kt"
        "core/common/src/main/kotlin/trebuchet/io/BufferProducer.kt"
        "core/common/src/main/kotlin/trebuchet/io/DataSlice.kt"
        "core/common/src/main/kotlin/trebuchet/io/GenericByteBuffer.kt"
        "core/common/src/main/kotlin/trebuchet/io/Pipe.kt"
        "core/common/src/main/kotlin/trebuchet/io/StreamingLineReader.kt"
        "core/common/src/main/kotlin/trebuchet/io/StreamingReader.kt"
        "core/common/src/main/kotlin/trebuchet/queries/SliceQueries.kt"
        "core/common/src/main/kotlin/trebuchet/queries/ThreadQueries.kt"
        "core/common/src/main/kotlin/trebuchet/task/ImportTask.kt"
        "core/common/src/main/kotlin/trebuchet/util/BatchProcessor.kt"
        "core/common/src/main/kotlin/trebuchet/util/BufferReader.kt"
        "core/common/src/main/kotlin/trebuchet/util/Builders.kt"
        "core/common/src/main/kotlin/trebuchet/util/ByteArrayList.kt"
        "core/common/src/main/kotlin/trebuchet/util/PrintlnImportFeedback.kt"
        "core/common/src/main/kotlin/trebuchet/util/Slices.kt"
        "core/common/src/main/kotlin/trebuchet/util/StringCache.kt"
        "core/common/src/main/kotlin/trebuchet/util/StringSearch.kt"
        "core/common/src/main/kotlin/trebuchet/util/Time.kt"
        "core/model/src/main/kotlin/trebuchet/model/Constants.kt"
        "core/model/src/main/kotlin/trebuchet/model/Counter.kt"
        "core/model/src/main/kotlin/trebuchet/model/CpuModel.kt"
        "core/model/src/main/kotlin/trebuchet/model/CpuProcessSlice.kt"
        "core/model/src/main/kotlin/trebuchet/model/Model.kt"
        "core/model/src/main/kotlin/trebuchet/model/ProcessModel.kt"
        "core/model/src/main/kotlin/trebuchet/model/SchedSlice.kt"
        "core/model/src/main/kotlin/trebuchet/model/SchedulingState.kt"
        "core/model/src/main/kotlin/trebuchet/model/ThreadModel.kt"
        "core/model/src/main/kotlin/trebuchet/model/base/Slice.kt"
        "core/model/src/main/kotlin/trebuchet/model/base/SliceGroup.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/AsyncSlicesBuilder.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/AutoCloseable.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/CounterFragment.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/CpuModelFragment.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/ModelFragment.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/ProcessModelFragment.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/SchedulingProcessFragment.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/SchedulingSliceFragment.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/SliceGroupBuilder.kt"
        "core/model/src/main/kotlin/trebuchet/model/fragments/ThreadModelFragment.kt"
    ];
    libs = [
        "kotlin-reflect"
    ];
    no_framework_libs = true;
};

trebuchet-startup-common = java_library_host {
    name = "trebuchet-startup-common";
    defaults = ["trebuchet-defaults"];
    srcs = [
        "trebuchet/startup-common/src/StartupCommon.kt"
    ];
    libs = [
        "trebuchet-core"
    ];
    no_framework_libs = true;
};

trebuchet-core-tests = java_test_host {
    name = "trebuchet-core-tests";
    defaults = ["trebuchet-defaults"];
    srcs = [
        "core/common/src/test/kotlin/trebuchet/extractors/SystraceExtractorTest.kt"
        "core/common/src/test/kotlin/trebuchet/extractors/ZlibExtractorTest.kt"
        "core/common/src/test/kotlin/trebuchet/importers/DummyImportFeedback.kt"
        "core/common/src/test/kotlin/trebuchet/importers/ftrace/EventTestHelpers.kt"
        "core/common/src/test/kotlin/trebuchet/importers/ftrace/FtraceEventTest.kt"
        "core/common/src/test/kotlin/trebuchet/importers/ftrace/FtraceImporterTest.kt"
        "core/common/src/test/kotlin/trebuchet/importers/ftrace/FtraceLineTest.kt"
        "core/common/src/test/kotlin/trebuchet/importers/ftrace/TracingMarkerEventTest.kt"
        "core/common/src/test/kotlin/trebuchet/io/StringStreamTest.kt"
        "core/common/src/test/kotlin/trebuchet/model/SliceGroupBuilderTest.kt"
        "core/common/src/test/kotlin/trebuchet/task/ImportTaskTest.kt"
        "core/common/src/test/kotlin/trebuchet/testutils/Annotations.kt"
        "core/common/src/test/kotlin/trebuchet/testutils/StringToStreamAdapter.kt"
    ];
    static_libs = [
        "trebuchet-core"
        "kotlin-test"
    ];
    libs = [
        "junit"
        "kotlin-reflect"
    ];
    test_suites = ["general-tests"];
};

trebuchet-startup-common-tests = java_test_host {
    name = "trebuchet-startup-common-tests";
    defaults = ["trebuchet-defaults"];
    srcs = [
        "trebuchet/startup-common/test/StartupCommonTests.kt"
    ];
    static_libs = [
        "trebuchet-core"
        "trebuchet-startup-common"
    ];
    libs = [
        "junit"
    ];
    test_suites = ["general-tests"];
};

AnalyzerKt = java_binary_host {
    name = "AnalyzerKt";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/analyzer/MANIFEST.mf";
    srcs = [
        "trebuchet/analyzer/src/Analyzer.kt"
    ];
    static_libs = [
        "trebuchet-core"
    ];
};

StartupAnalyzerKt = java_binary_host {
    name = "StartupAnalyzerKt";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/startup-analyzer/MANIFEST.mf";
    srcs = [
        "trebuchet/startup-analyzer/src/StartupAnalyzer.kt"
    ];
    static_libs = [
        "trebuchet-core"
        "trebuchet-startup-common"
    ];
};

StartupSummarizerKt = java_binary_host {
    name = "StartupSummarizerKt";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/startup-summarizer/MANIFEST.mf";
    srcs = [
        "trebuchet/startup-summarizer/src/StartupSummarizer.kt"
    ];
    static_libs = [
        "trebuchet-core"
        "trebuchet-startup-common"
    ];
};

traceutils = java_binary_host {
    name = "traceutils";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/traceutils/MANIFEST.mf";
    srcs = [
        "trebuchet/traceutils/src/TraceUtils.kt"
    ];
    static_libs = [
        "trebuchet-core"
    ];
};

traceviewer = java_binary_host {
    name = "traceviewer";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/viewer/MANIFEST.mf";
    srcs = [
        "trebuchet/viewer/src/main/kotlin/viewer.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/Animator.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/LayoutConstants.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/Os.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/ProcessLabel.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/ProcessPanel.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/RenderState.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/RowLabel.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/ThemeColors.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/TimelineView.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/TraceViewerWindow.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/builders/Menu.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/components/ChooseTrace.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/tracks/MultiLineTrack.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/tracks/SchedTrack.kt"
        "trebuchet/viewer/src/main/kotlin/traceviewer/ui/tracks/SliceTrack.kt"
    ];
    static_libs = [
        "trebuchet-core"
    ];
};

in { inherit AnalyzerKt StartupAnalyzerKt StartupSummarizerKt traceutils traceviewer trebuchet-core trebuchet-core-tests trebuchet-defaults trebuchet-startup-common trebuchet-startup-common-tests; }
