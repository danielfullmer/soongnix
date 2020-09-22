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

    srcs = [
        "CondVar.cpp"
        "DataQueue.cpp"
        "HciEventManager.cpp"
        "IntervalTimer.cpp"
        "Mutex.cpp"
        "NativeLlcpConnectionlessSocket.cpp"
        "NativeLlcpServiceSocket.cpp"
        "NativeLlcpSocket.cpp"
        "NativeNfcManager.cpp"
        "NativeNfcTag.cpp"
        "NativeP2pDevice.cpp"
        "NfcJniUtil.cpp"
        "NfcTag.cpp"
        "PeerToPeer.cpp"
        "PowerSwitch.cpp"
        "RouteDataSet.cpp"
        "RoutingManager.cpp"
        "extns/pn54x/src/phNxpExtns.cpp"
        "extns/pn54x/src/mifare/phFriNfc_MifStdFormat.cpp"
        "extns/pn54x/src/mifare/phFriNfc_MifareStdMap.cpp"
        "extns/pn54x/src/mifare/phFriNfc_SmtCrdFmt.cpp"
        "extns/pn54x/src/mifare/phNxpExtns_MifareStd.cpp"
    ];

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
    sanitize = {
        integer_overflow = true;
        misc_undefined = ["bounds"];
    };
};

in { inherit libnfc_nci_jni; }
