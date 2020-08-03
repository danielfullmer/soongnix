{ cc_library_static }:
let

libmcldObject = cc_library_static {
    name = "libmcldObject";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "ObjectBuilder.cpp"
        "ObjectLinker.cpp"
        "SectionMap.cpp"
    ];
};

in { inherit libmcldObject; }
