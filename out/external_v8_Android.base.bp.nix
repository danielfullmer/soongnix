{ cc_library_static }:
let

#  GENERATED, do not edit
#  for changes, see genmakefiles.py
libv8base = cc_library_static {
    name = "libv8base";
    defaults = ["v8_defaults"];
    host_supported = true;
    srcs = [
        "src/base/bits.cc"
        "src/base/cpu.cc"
        "src/base/debug/stack_trace.cc"
        "src/base/division-by-constant.cc"
        "src/base/file-utils.cc"
        "src/base/functional.cc"
        "src/base/ieee754.cc"
        "src/base/logging.cc"
        "src/base/once.cc"
        "src/base/page-allocator.cc"
        "src/base/platform/condition-variable.cc"
        "src/base/platform/mutex.cc"
        "src/base/platform/platform-posix-time.cc"
        "src/base/platform/platform-posix.cc"
        "src/base/platform/semaphore.cc"
        "src/base/platform/time.cc"
        "src/base/sys-info.cc"
        "src/base/utils/random-number-generator.cc"
    ];
    local_include_dirs = ["src"];
    target = {
        android = {
            srcs = ["src/base/debug/stack_trace_android.cc"];
        };
        linux = {
            srcs = ["src/base/platform/platform-linux.cc"];
        };
        host = {
            srcs = ["src/base/debug/stack_trace_posix.cc"];
            cflags = ["-UANDROID"];
        };
        darwin = {
            srcs = ["src/base/platform/platform-macos.cc"];
        };
    };

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

in { inherit libv8base; }
