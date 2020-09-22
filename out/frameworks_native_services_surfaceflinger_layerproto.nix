{ cc_library_shared, java_library_static }:
let

liblayers_proto = cc_library_shared {
    name = "liblayers_proto";
    export_include_dirs = ["include"];

    srcs = [
        "LayerProtoParser.cpp"
        "layers.proto"
        "layerstrace.proto"
    ];

    shared_libs = [
        "android.hardware.graphics.common@1.1"
        "libgui"
        "libui"
        "libprotobuf-cpp-lite"
        "libbase"
    ];

    proto = {
        export_proto_headers = true;
    };

    cppflags = [
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-format"
        "-Wno-c++98-compat-pedantic"
        "-Wno-float-conversion"
        "-Wno-disabled-macro-expansion"
        "-Wno-float-equal"
        "-Wno-sign-conversion"
        "-Wno-padded"
        "-Wno-old-style-cast"
        "-Wno-undef"
    ];

};

layersprotosnano = java_library_static {
    name = "layersprotosnano";
    host_supported = true;
    proto = {
        type = "nano";
    };
    srcs = [
        "layers.proto"
        "layerstrace.proto"
    ];
    sdk_version = "core_platform";
    target = {
        android = {
            jarjar_rules = "jarjar-rules.txt";
        };
        host = {
            static_libs = ["libprotobuf-java-nano"];
        };
    };
};

in { inherit layersprotosnano liblayers_proto; }
