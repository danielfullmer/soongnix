{ cc_prebuilt_binary }:
let

gdbserver = cc_prebuilt_binary {
    name = "gdbserver";
    compile_multilib = "both";

    multilib = {
        lib64 = {
            suffix = "64";
        };
    };

    target = {
        android_arm = {
            srcs = ["android-arm/gdbserver"];
        };
        android_arm64 = {
            srcs = ["android-arm64/gdbserver64"];
        };
        android_mips = {
            srcs = ["android-mips/gdbserver"];
        };
        android_mips64 = {
            srcs = ["android-mips64/gdbserver64"];
        };
        android_x86 = {
            srcs = ["android-x86/gdbserver"];
        };
        android_x86_64 = {
            srcs = ["android-x86_64/gdbserver64"];
        };
    };
};

in { inherit gdbserver; }
