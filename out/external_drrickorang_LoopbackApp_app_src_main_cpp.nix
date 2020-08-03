{ cc_library_shared }:
let

libloopback = cc_library_shared {
    name = "libloopback";
    srcs = [
        "sles.cpp"
        "byte_buffer.c"
        "jni_native.c"
        "loopback.c"
        "audio_utils/atomic.c"
        "audio_utils/fifo.c"
        "audio_utils/roundup.c"
        "lb2/loopback_test.cpp"
        "lb2/sound_system_echo.cpp"
        "lb2/test_context.cpp"
        "lb2/loopback2.cpp"
        "lb2/sound_system_aaudio.cpp"
        "lb2/oboe/src/aaudio/AAudioLoader.cpp"
    ];
    include_dirs = [
        "frameworks/wilhelm/include"
        "frameworks/av/media/libaaudio/include"
    ];
    shared_libs = [
        "libOpenSLES"
        "libdl"
        "liblog"
        "libandroid"
    ];
    # LOCAL_LDFLAGS += -Wl,--hash-style=sysv
    # LOCAL_CFLAGS := -DSTDC_HEADERS
    cppflags = [
        "-fexceptions"
    ];
    cpp_std = "c++11";
    c_std = "c11";
};

in { inherit libloopback; }
