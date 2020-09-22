{ java_library_host, java_plugin }:
let

error_prone_mediaprovider = java_plugin {
    name = "error_prone_mediaprovider";

    static_libs = [
        "error_prone_mediaprovider_lib"
    ];
};

error_prone_mediaprovider_lib = java_library_host {
    name = "error_prone_mediaprovider_lib";

    srcs = [
        "src/com/android/providers/media/LocaleRootChecker.java"
        "src/com/android/providers/media/MimeTypeChecker.java"
        "src/com/google/errorprone/matchers/FieldMatchers.java"
    ];

    static_libs = [
        "//external/error_prone:error_prone_core"
        "//external/dagger2:dagger2-auto-service"
    ];

    plugins = [
        "//external/dagger2:dagger2-auto-service"
    ];

    javacflags = ["-verbose"];
};

in { inherit error_prone_mediaprovider error_prone_mediaprovider_lib; }
