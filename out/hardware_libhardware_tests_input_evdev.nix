{ cc_test }:
let

libinput_evdevtests = cc_test {
    name = "libinput_evdevtests";

    srcs = [
        "BitUtils_test.cpp"
        "InputDevice_test.cpp"
        "InputHub_test.cpp"
        "InputMocks.cpp"
        "MouseInputMapper_test.cpp"
        "SwitchInputMapper_test.cpp"
        "TestHelpers.cpp"
    ];

    static_libs = ["libgmock"];

    shared_libs = [
        "libinput_evdev"
        "liblog"
        "libutils"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-unused-parameter"

        #  TestHelpers uses mktemp. As the path is given to TempFile, we can't do too much
        #  here (e.g., use mkdtemp first). At least races will lead to an early failure, as
        #  mkfifo fails on existing files.
        "-Wno-deprecated-declarations"
    ];
};

in { inherit libinput_evdevtests; }
