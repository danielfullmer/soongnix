{ java_binary_host }:
let

xsdc = java_binary_host {
    name = "xsdc";
    srcs = ["src/**/*.java"];
    static_libs = [
        "commons-cli-1.2"
    ];
    manifest = "MANIFEST.MF";
};

in { inherit xsdc; }
