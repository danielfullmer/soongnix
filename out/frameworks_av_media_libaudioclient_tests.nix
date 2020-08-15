{ cc_defaults, cc_test }:
let

libaudioclient_tests_defaults = cc_defaults {
    name = "libaudioclient_tests_defaults";
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

test_create_audiotrack = cc_test {
    name = "test_create_audiotrack";
    defaults = ["libaudioclient_tests_defaults"];
    srcs = [
        "test_create_audiotrack.cpp"
        "test_create_utils.cpp"
    ];
    shared_libs = [
        "libaudioclient"
        "libbinder"
        "libcutils"
        "libutils"
    ];
    data = ["track_test_input_v1.0_ref.txt"];
};

test_create_audiorecord = cc_test {
    name = "test_create_audiorecord";
    defaults = ["libaudioclient_tests_defaults"];
    srcs = [
        "test_create_audiorecord.cpp"
        "test_create_utils.cpp"
    ];
    shared_libs = [
        "libaudioclient"
        "libbinder"
        "libcutils"
        "libutils"
    ];
    data = ["record_test_input_v1.0_ref.txt"];
};

in { inherit libaudioclient_tests_defaults test_create_audiorecord test_create_audiotrack; }
