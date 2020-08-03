{ java_library_host }:
let

idegen = java_library_host {
    name = "idegen";
    srcs = ["**/*.java"];
    static_libs = ["guava"];
};

in { inherit idegen; }
