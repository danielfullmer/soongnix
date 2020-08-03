{ cc_defaults, cc_test }:
let

libaaudio_tests_defaults = cc_defaults {
    name = "libaaudio_tests_defaults";
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

test_aaudio_marshalling = cc_test {
    name = "test_aaudio_marshalling";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_marshalling.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_clock_model = cc_test {
    name = "test_clock_model";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_clock_model.cpp"];
    shared_libs = [
        "libaaudio"
        "libaudioutils"
        "libcutils"
        "libutils"
    ];
};

test_block_adapter = cc_test {
    name = "test_block_adapter";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_block_adapter.cpp"];
    shared_libs = ["libaaudio"];
};

test_timestamps = cc_test {
    name = "test_timestamps";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_timestamps.cpp"];
    header_libs = ["libaaudio_example_utils"];
    shared_libs = ["libaaudio"];
};

test_open_params = cc_test {
    name = "test_open_params";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_open_params.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_no_close = cc_test {
    name = "test_no_close";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_no_close.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_aaudio_recovery = cc_test {
    name = "test_aaudio_recovery";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_recovery.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_n_streams = cc_test {
    name = "test_n_streams";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_n_streams.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_bad_disconnect = cc_test {
    name = "test_bad_disconnect";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_bad_disconnect.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_various = cc_test {
    name = "test_various";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_various.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_session_id = cc_test {
    name = "test_session_id";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_session_id.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_aaudio_monkey = cc_test {
    name = "test_aaudio_monkey";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_aaudio_monkey.cpp"];
    header_libs = ["libaaudio_example_utils"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_attributes = cc_test {
    name = "test_attributes";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_attributes.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_interference = cc_test {
    name = "test_interference";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_interference.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_atomic_fifo = cc_test {
    name = "test_atomic_fifo";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_atomic_fifo.cpp"];
    shared_libs = ["libaaudio"];
};

test_flowgraph = cc_test {
    name = "test_flowgraph";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_flowgraph.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_return_stop = cc_test {
    name = "test_return_stop";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_return_stop.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_stop_hang = cc_test {
    name = "test_stop_hang";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_stop_hang.cpp"];
    shared_libs = [
        "libaaudio"
        "libbinder"
        "libcutils"
        "libutils"
    ];
};

test_full_queue = cc_test {
    name = "test_full_queue";
    defaults = ["libaaudio_tests_defaults"];
    srcs = ["test_full_queue.cpp"];
    shared_libs = ["libaaudio"];
};

in { inherit libaaudio_tests_defaults test_aaudio_marshalling test_aaudio_monkey test_aaudio_recovery test_atomic_fifo test_attributes test_bad_disconnect test_block_adapter test_clock_model test_flowgraph test_full_queue test_interference test_n_streams test_no_close test_open_params test_return_stop test_session_id test_stop_hang test_timestamps test_various; }
