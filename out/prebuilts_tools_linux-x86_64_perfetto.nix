{ cc_prebuilt_binary, filegroup }:
let

perfetto_trace_processor_shell_prebuilt = cc_prebuilt_binary {
    name = "perfetto_trace_processor_shell_prebuilt";
    srcs = ["trace_processor_shell"];
    host_supported = true;
    device_supported = false;
};

perfetto_artifacts = filegroup {
    name = "perfetto_artifacts";
    srcs = [
        "trace_processor_shell"
        "configs/trace_config_detailed.textproto"
        "configs/long_trace_config.textproto"
    ];
};

in { inherit perfetto_artifacts perfetto_trace_processor_shell_prebuilt; }
