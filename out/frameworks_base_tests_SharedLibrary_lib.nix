{ android_app }:
let

SharedLibrary = android_app {
    name = "SharedLibrary";
    srcs = ["**/*.java"];
    aaptflags = ["--shared-lib"];
    sdk_version = "current";
    export_package_resources = true;
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.proguard"];
    };
};

in { inherit SharedLibrary; }
