{ android_app }:
let

SharedLibrary = android_app {
    name = "SharedLibrary";
    srcs = [
        "src/com/google/android/test/shared_library/ActivityMain.java"
        "src/com/google/android/test/shared_library/AddressView.java"
        "src/com/google/android/test/shared_library/SharedLibraryMain.java"
        "src/com/google/android/test/shared_library/VersionDialog.java"
    ];
    aaptflags = ["--shared-lib"];
    sdk_version = "current";
    export_package_resources = true;
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.proguard"];
    };
};

in { inherit SharedLibrary; }
