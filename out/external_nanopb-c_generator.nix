{ python_binary_host }:
let

protoc-gen-nanopb = python_binary_host {
    name = "protoc-gen-nanopb";
    main = "nanopb_generator.py";
    srcs = [
        "nanopb_generator.py"
        "proto/nanopb.proto"
        "proto/plugin.proto"
    ];
    proto = {
        canonical_path_from_root = false;
        include_dirs = ["external/protobuf/src"];
    };
    libs = ["libprotobuf-python"];
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

in { inherit protoc-gen-nanopb; }
