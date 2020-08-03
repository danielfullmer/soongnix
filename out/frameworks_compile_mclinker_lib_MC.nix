{ cc_library_static }:
let

libmcldMC = cc_library_static {
    name = "libmcldMC";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "Attribute.cpp"
        "AttributeSet.cpp"
        "CommandAction.cpp"
        "ContextFactory.cpp"
        "FileAction.cpp"
        "InputAction.cpp"
        "InputBuilder.cpp"
        "InputFactory.cpp"
        "Input.cpp"
        "MCLDDirectory.cpp"
        "SearchDirs.cpp"
        "SymbolCategory.cpp"
        "ZOption.cpp"
    ];
};

in { inherit libmcldMC; }
