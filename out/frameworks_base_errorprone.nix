{ java_library_host, java_plugin }:
let

error_prone_android_framework = java_plugin {
    name = "error_prone_android_framework";

    static_libs = [
        "error_prone_android_framework_lib"
    ];
};

error_prone_android_framework_lib = java_library_host {
    name = "error_prone_android_framework_lib";

    srcs = [
        "java/com/google/errorprone/bugpatterns/android/RethrowFromSystemChecker.java"
        "java/com/google/errorprone/bugpatterns/android/TargetSdkChecker.java"
        "java/com/google/errorprone/matchers/FieldMatchers.java"
    ];

    static_libs = [
        "//external/error_prone:error_prone_core"
        "//external/dagger2:dagger2-auto-service"
    ];

    plugins = [
        "//external/dagger2:dagger2-auto-service"
    ];
};

in { inherit error_prone_android_framework error_prone_android_framework_lib; }
