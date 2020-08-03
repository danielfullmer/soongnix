{ java_library_static }:
let

"services.appprediction" = java_library_static {
    name = "services.appprediction";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.appprediction"; }
