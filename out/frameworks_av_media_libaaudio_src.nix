{ cc_library }:
let

libaaudio = cc_library {
    name = "libaaudio";

    local_include_dirs = [
        "binding"
        "client"
        "core"
        "fifo"
        "flowgraph"
        "legacy"
        "utility"
    ];
    header_libs = [
        "libaaudio_headers"
    ];
    export_header_lib_headers = ["libaaudio_headers"];
    version_script = "libaaudio.map.txt";

    srcs = [
        "core/AAudioAudio.cpp"
    ];

    cflags = [
        "-Wno-unused-parameter"
        "-Wall"
        "-Werror"

        #  By default, all symbols are hidden.
        #  "-fvisibility=hidden",
        #  AAUDIO_API is used to explicitly export a function or a variable as a visible symbol.
        "-DAAUDIO_API=__attribute__((visibility(\"default\")))"
    ];

    shared_libs = [
        "libaaudio_internal"
        "libaudioclient"
        "libaudioutils"
        "libmedia_helper"
        "libmediametrics"
        "libmediautils"
        "liblog"
        "libcutils"
        "libutils"
        "libbinder"
    ];

    sanitize = {
        integer_overflow = true;
        misc_undefined = ["bounds"];
    };

    stubs = {
        symbol_file = "libaaudio.map.txt";
        versions = ["28"];
    };
};

libaaudio_internal = cc_library {
    name = "libaaudio_internal";

    local_include_dirs = [
        "binding"
        "client"
        "core"
        "fifo"
        "legacy"
        "utility"
    ];

    export_include_dirs = ["."];
    header_libs = [
        "libaaudio_headers"
        "libmedia_headers"
        "libmediametrics_headers"
    ];
    export_header_lib_headers = ["libaaudio_headers"];

    shared_libs = [
        "libaudioclient"
        "libaudioutils"
        "libmedia_helper"
        "libmediametrics"
        "libmediautils"
        "liblog"
        "libcutils"
        "libutils"
        "libbinder"
    ];

    cflags = [
        "-Wno-unused-parameter"
        "-Wall"
        "-Werror"
    ];

    srcs = [
        "core/AudioGlobal.cpp"
        "core/AudioStream.cpp"
        "core/AudioStreamBuilder.cpp"
        "core/AAudioStreamParameters.cpp"
        "legacy/AudioStreamLegacy.cpp"
        "legacy/AudioStreamRecord.cpp"
        "legacy/AudioStreamTrack.cpp"
        "utility/AAudioUtilities.cpp"
        "utility/FixedBlockAdapter.cpp"
        "utility/FixedBlockReader.cpp"
        "utility/FixedBlockWriter.cpp"
        "fifo/FifoBuffer.cpp"
        "fifo/FifoControllerBase.cpp"
        "client/AAudioFlowGraph.cpp"
        "client/AudioEndpoint.cpp"
        "client/AudioStreamInternal.cpp"
        "client/AudioStreamInternalCapture.cpp"
        "client/AudioStreamInternalPlay.cpp"
        "client/IsochronousClockModel.cpp"
        "binding/AudioEndpointParcelable.cpp"
        "binding/AAudioBinderClient.cpp"
        "binding/AAudioStreamRequest.cpp"
        "binding/AAudioStreamConfiguration.cpp"
        "binding/IAAudioClient.cpp"
        "binding/IAAudioService.cpp"
        "binding/RingBufferParcelable.cpp"
        "binding/SharedMemoryParcelable.cpp"
        "binding/SharedRegionParcelable.cpp"
        "flowgraph/AudioProcessorBase.cpp"
        "flowgraph/ClipToRange.cpp"
        "flowgraph/MonoToMultiConverter.cpp"
        "flowgraph/RampLinear.cpp"
        "flowgraph/SinkFloat.cpp"
        "flowgraph/SinkI16.cpp"
        "flowgraph/SinkI24.cpp"
        "flowgraph/SourceFloat.cpp"
        "flowgraph/SourceI16.cpp"
        "flowgraph/SourceI24.cpp"
    ];
    sanitize = {
        integer_overflow = true;
        misc_undefined = ["bounds"];
    };
};

in { inherit libaaudio libaaudio_internal; }
