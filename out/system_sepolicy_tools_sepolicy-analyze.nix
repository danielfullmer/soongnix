{ cc_binary_host }:
let

sepolicy-analyze = cc_binary_host {
    name = "sepolicy-analyze";
    defaults = ["sepolicy_tools_defaults"];

    srcs = [
        "sepolicy-analyze.c"
        "dups.c"
        "neverallow.c"
        "perm.c"
        "typecmp.c"
        "booleans.c"
        "attribute.c"
        "utils.c"
    ];
};

in { inherit sepolicy-analyze; }
