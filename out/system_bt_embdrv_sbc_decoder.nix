{ cc_library_static }:
let

#  Bluetooth SBC decoder static library for target
#  ========================================================
libbt-sbc-decoder = cc_library_static {
    name = "libbt-sbc-decoder";
    defaults = ["fluoride_defaults"];
    srcs = [
        "srce/alloc.c"
        "srce/bitalloc.c"
        "srce/bitalloc-sbc.c"
        "srce/bitstream-decode.c"
        "srce/decoder-oina.c"
        "srce/decoder-private.c"
        "srce/decoder-sbc.c"
        "srce/dequant.c"
        "srce/framing.c"
        "srce/framing-sbc.c"
        "srce/oi_codec_version.c"
        "srce/synthesis-sbc.c"
        "srce/synthesis-dct8.c"
        "srce/synthesis-8-generated.c"
    ];
    local_include_dirs = [
        "include"
        "srce"
    ];
};

in { inherit libbt-sbc-decoder; }
