{ android_test }:
let

SharedLibraryClient = android_test {
    name = "SharedLibraryClient";
    srcs = [
        "src/com/google/android/test/lib_client/ActivityMain.java"
        "src/com/google/android/test/lib_client/DependentAppwidgetProvider.java"
    ];
    libs = ["SharedLibrary"];
    sdk_version = "current";
};

in { inherit SharedLibraryClient; }
