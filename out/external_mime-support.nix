{ java_genrule }:
let

"debian.mime.types.minimized" = java_genrule {
    name = "debian.mime.types.minimized";
    visibility = [
        "//visibility:public"
    ];
    out = ["debian.mime.types"];
    srcs = [
        "mime.types"
    ];
    #     strip comments            normalize whitepace       drop empty lines
    cmd = "awk '{gsub(/#.*$$/,\"\"); $$1=$$1; print;}' $(in) | grep ' ' > $(out)";
};

in { inherit "debian.mime.types.minimized"; }
