{ cc_library_static, cc_test }:
let

#  Build the unit tests.
libinput_tests = cc_test {
    name = "libinput_tests";
    srcs = [
        "InputChannel_test.cpp"
        "InputDevice_test.cpp"
        "InputEvent_test.cpp"
        "InputPublisherAndConsumer_test.cpp"
        "InputWindow_test.cpp"
        "TouchVideoFrame_test.cpp"
        "VelocityTracker_test.cpp"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-unused-variable"
    ];
    shared_libs = [
        "libinput"
        "libcutils"
        "libutils"
        "libbinder"
        "libui"
        "libbase"
    ];
};

#  NOTE: This is a compile time test, and does not need to be
#  run. All assertions are static_asserts and will fail during
#  buildtime if something's wrong.
StructLayout_test = cc_library_static {
    name = "StructLayout_test";
    srcs = ["StructLayout_test.cpp"];
    cflags = [
        "-O0"
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    shared_libs = [
        "libinput"
        "libcutils"
        "libutils"
        "libbinder"
        "libui"
        "libbase"
    ];
};

in { inherit StructLayout_test libinput_tests; }
