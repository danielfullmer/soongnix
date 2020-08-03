{ java_library_static }:
let

"services.devicepolicy" = java_library_static {
    name = "services.devicepolicy";
    srcs = ["java/**/*.java"];

    libs = [
        "services.core"
    ];
};

in { inherit "services.devicepolicy"; }
