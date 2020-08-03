{ cc_library_shared }:
let

libnfc-nci = cc_library_shared {
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
    name = "libnfc-nci";
    shared_libs = [
        "libcutils"
        "liblog"
        "libdl"
        "libhardware"
        "libmetricslogger"
        "libz"
        "libchrome"
        "libbase"
        "libstatslog"

        #  Treble configuration
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libutils"
        "android.hardware.nfc@1.0"
        "android.hardware.nfc@1.1"
        "android.hardware.nfc@1.2"
    ];
    static_libs = [
        "libnfcutils"
    ];
    cflags = [
        "-DBUILDCFG=1"
        "-Wall"
        "-Werror"
        "-Wimplicit-fallthrough"
    ];
    local_include_dirs = [
        "include"
        "gki/ulinux"
        "gki/common"
        "nfa/include"
        "nfc/include"
    ];
    srcs = [
        "nfa/ce/*.cc"
        "nfa/dm/*.cc"
        "nfa/ee/*.cc"
        "nfa/hci/*.cc"
        "nfa/p2p/*.cc"
        "nfa/rw/*.cc"
        "nfa/sys/*.cc"
        "nfc/llcp/*.cc"
        "nfc/nci/*.cc"
        "nfc/ndef/*.cc"
        "nfc/nfc/*.cc"
        "nfc/tags/*.cc"
        "adaptation/*.cc"
        "gki/common/*.cc"
        "gki/ulinux/*.cc"
    ];
    product_variables = {
        debuggable = {
            cflags = [
                "-DDCHECK_ALWAYS_ON"
            ];
        };
    };
};

in { inherit libnfc-nci; }
