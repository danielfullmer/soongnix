{ android_test }:
let

SharedLibraryClient = android_test {
    name = "SharedLibraryClient";
    srcs = ["**/*.java"];
    libs = ["SharedLibrary"];
    sdk_version = "current";
};

in { inherit SharedLibraryClient; }
