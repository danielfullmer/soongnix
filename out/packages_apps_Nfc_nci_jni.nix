{ cc_library_shared }:
let

libnfc_nci_jni = cc_library_shared {
    name = "libnfc_nci_jni";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Wno-unused-parameter"
        "-Werror"

        "-DNXP_UICC_ENABLE"
    ];

    srcs = ["**/*.cpp"];

    include_dirs = [
        "system/nfc/src/nfa/include"
        "system/nfc/src/nfc/include"
        "system/nfc/src/include"
        "system/nfc/src/gki/ulinux"
        "system/nfc/src/gki/common"
        "system/nfc/utils/include"
    ];

    local_include_dirs = [
        "extns/pn54x/inc"
        "extns/pn54x/src/common"
        "extns/pn54x/src/mifare"
    ];

    shared_libs = [
        "libandroidicu"
        "libnativehelper"
        "libcutils"
        "libutils"
        "liblog"
        "libnfc-nci"
        "libchrome"
        "libbase"
    ];

    static_libs = ["libxml2"];

    product_variables = {
        debuggable = {
            cflags = ["-DDCHECK_ALWAYS_ON"];
        };
    };
};

in { inherit libnfc_nci_jni; }
