{ filegroup }:
let

#  Generated by aosp-gen-bp.sh
mesa_x86_sse41_srcs = filegroup {
    name = "mesa_x86_sse41_srcs";
    visibility = [":__subpackages__"];
    srcs = [
        "main/streaming-load-memcpy.c"
        "main/sse_minmax.c"
    ];
};

in { inherit mesa_x86_sse41_srcs; }