{ cc_test }:
let

#  Build the unit tests.

inputflinger_tests = cc_test {
    name = "inputflinger_tests";
    srcs = [
        "BlockingQueue_test.cpp"
        "TestInputListener.cpp"
        "InputClassifier_test.cpp"
        "InputClassifierConverter_test.cpp"
        "InputDispatcher_test.cpp"
        "InputReader_test.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
    ];
    shared_libs = [
        "android.hardware.input.classifier@1.0"
        "libbase"
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
        "libhardware"
        "libhardware_legacy"
        "libui"
        "libinput"
        "libinputflinger"
        "libinputreader"
        "libinputflinger_base"
        "libinputservice"
    ];
};

in { inherit inputflinger_tests; }
