{ cc_test }:
let

write_sine = cc_test {
    name = "write_sine";
    srcs = ["src/write_sine.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libaaudio"];
    header_libs = ["libaaudio_example_utils"];
    pack_relocations = false;
};

write_sine_callback = cc_test {
    name = "write_sine_callback";
    srcs = ["src/write_sine_callback.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libaaudio"];
    header_libs = ["libaaudio_example_utils"];
    pack_relocations = false;
};

in { inherit write_sine write_sine_callback; }
