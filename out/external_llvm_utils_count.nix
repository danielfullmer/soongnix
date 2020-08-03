{ cc_binary_host }:
let

# ===---------------------------------------------------------------===
#  count command line tool
# ===---------------------------------------------------------------===

count = cc_binary_host {
    name = "count";
    defaults = ["llvm-defaults"];
    srcs = ["count.c"];
};

in { inherit count; }
