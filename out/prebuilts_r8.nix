{ java_binary_host, java_import_host }:
let

d8 = java_binary_host {
    name = "d8";
    wrapper = "d8";
    static_libs = ["r8-master"];
};

d8-compat-dx = java_binary_host {
    name = "d8-compat-dx";
    wrapper = "d8-compat-dx";
    static_libs = ["d8-compat-dx-master"];
};

r8-compat-proguard = java_binary_host {
    name = "r8-compat-proguard";
    wrapper = "r8-compat-proguard";
    static_libs = ["r8-compat-proguard-master"];
};

r8-master = java_import_host {
    name = "r8-master";
    jars = ["r8-master.jar"];
};

d8-compat-dx-master = java_import_host {
    name = "d8-compat-dx-master";
    jars = ["compatdx-master.jar"];
};

r8-compat-proguard-master = java_import_host {
    name = "r8-compat-proguard-master";
    jars = ["compatproguard-master.jar"];
};

in { inherit d8 d8-compat-dx d8-compat-dx-master r8-compat-proguard r8-compat-proguard-master r8-master; }
