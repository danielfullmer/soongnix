{ cc_library_static }:
let

#  GENERATED, do not edit
#  for changes, see genmakefiles.py
libv8platform = cc_library_static {
    name = "libv8platform";
    defaults = ["v8_defaults"];
    srcs = [
        "src/libplatform/default-foreground-task-runner.cc"
        "src/libplatform/default-platform.cc"
        "src/libplatform/default-worker-threads-task-runner.cc"
        "src/libplatform/task-queue.cc"
        "src/libplatform/tracing/trace-buffer.cc"
        "src/libplatform/tracing/trace-config.cc"
        "src/libplatform/tracing/trace-object.cc"
        "src/libplatform/tracing/trace-writer.cc"
        "src/libplatform/tracing/tracing-controller.cc"
        "src/libplatform/worker-thread.cc"
    ];
    local_include_dirs = [
        "src"
        "include"
    ];
};

in { inherit libv8platform; }
