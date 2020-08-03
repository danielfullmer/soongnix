{ java_library_static }:
let

"services.autofill" = java_library_static {
    name = "services.autofill";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.autofill"; }
