{ cc_library_shared }:
let

libperfettocts_jni = cc_library_shared {
    name = "libperfettocts_jni";
    srcs = [
        "fake_producer_jni.cc"
    ];
    static_libs = [
        "libgtest"
        "libprotobuf-cpp-lite"
        "perfetto_cts_jni_deps"
        "perfetto_src_tracing_ipc"
    ];
    shared_libs = [
        "libandroid"
        "liblog"
        "libnativehelper_compat_libc++"
    ];
    compile_multilib = "both";
    stl = "libc++_static";
    cflags = [
        "-DPERFETTO_BUILD_WITH_ANDROID"
    ];
};

in { inherit libperfettocts_jni; }
