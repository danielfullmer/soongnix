{ soong_namespace }:
let

_missingName = soong_namespace {
};

GNSS_CFLAGS = [
    "-Werror"
    "-Wno-error=unused-parameter"
    "-Wno-error=macro-redefined"
    "-Wno-error=reorder"
    "-Wno-error=missing-braces"
    "-Wno-error=self-assign"
    "-Wno-error=enum-conversion"
    "-Wno-error=logical-op-parentheses"
    "-Wno-error=null-arithmetic"
    "-Wno-error=null-conversion"
    "-Wno-error=parentheses-equality"
    "-Wno-error=undefined-bool-conversion"
    "-Wno-error=tautological-compare"
    "-Wno-error=switch"
    "-Wno-error=date-time"
];

/* Activate the following for regression testing */
GNSS_SANITIZE = {
    /*  address: true,*/
    cfi = true;
    misc_undefined = [
        "alignment"
        "bounds"
        "null"
        "unreachable"
        "integer"
    ];
};

/* Activate the following for debug purposes only,
   comment out for production */
GNSS_SANITIZE_DIAG = {
    /*
    diag: {
        cfi: true,
        misc_undefined: [
            "alignment",
            "bounds",
            "null",
            "unreachable",
            "integer",
        ],
    },
    */
};

in { inherit _missingName; }
