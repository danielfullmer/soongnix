{ java_binary_host, java_import_host }:
let

d8 = java_binary_host {
    name = "d8";
    wrapper = "d8";
    static_libs = ["r8"];
};

r8-compat-proguard = java_binary_host {
    name = "r8-compat-proguard";
    wrapper = "r8-compat-proguard";
    static_libs = ["r8"];
};

r8 = java_import_host {
    name = "r8";
    jars = ["r8.jar"];
};

in { inherit d8 r8 r8-compat-proguard; }
