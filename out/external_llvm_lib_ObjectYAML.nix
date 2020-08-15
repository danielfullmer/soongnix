{ cc_library_static }:
let

libLLVMObjectYAML = cc_library_static {
    name = "libLLVMObjectYAML";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "COFFYAML.cpp"
        "ELFYAML.cpp"
        "MachOYAML.cpp"
        "ObjectYAML.cpp"
        "YAML.cpp"
    ];
};

in { inherit libLLVMObjectYAML; }
