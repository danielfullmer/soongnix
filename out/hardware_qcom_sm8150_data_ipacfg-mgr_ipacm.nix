{ cc_binary, prebuilt_etc }:
let

ipacm = cc_binary {
    name = "ipacm";

    local_include_dirs = ["src"] ++ ["inc"];
    header_libs = ["device_kernel_headers"];
    cflags = ["-DFEATURE_IPA_ANDROID"] ++ ["-DFEATURE_IPACM_RESTART"] ++ [
        "-DFEATURE_IPACM_HAL"
        "-Wall"
        "-Werror"
        "-Wno-error=macro-redefined"
        "-Wno-enum-compare"
        "-Wno-error=implicit-fallthrough"
    ];

    srcs = [
        "src/IPACM_Main.cpp"
        "src/IPACM_EvtDispatcher.cpp"
        "src/IPACM_Config.cpp"
        "src/IPACM_CmdQueue.cpp"
        "src/IPACM_Filtering.cpp"
        "src/IPACM_Routing.cpp"
        "src/IPACM_Header.cpp"
        "src/IPACM_Lan.cpp"
        "src/IPACM_Iface.cpp"
        "src/IPACM_Wlan.cpp"
        "src/IPACM_Wan.cpp"
        "src/IPACM_IfaceManager.cpp"
        "src/IPACM_Neighbor.cpp"
        "src/IPACM_Netlink.cpp"
        "src/IPACM_Xml.cpp"
        "src/IPACM_Conntrack_NATApp.cpp"
        "src/IPACM_ConntrackClient.cpp"
        "src/IPACM_ConntrackListener.cpp"
        "src/IPACM_Log.cpp"
        "src/IPACM_OffloadManager.cpp"
        "src/IPACM_LanToLan.cpp"
    ];

    init_rc = ["src/ipacm.rc"];
    clang = true;
    vendor = true;

    shared_libs = [
        "liboffloadhal"
        "libipanat"
        "libxml2"
        "libnfnetlink"
        "libnetfilter_conntrack"
        "libhidlbase"
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhardware_legacy"
        "libhardware"
        "android.hardware.tetheroffload.config@1.0"
        "android.hardware.tetheroffload.control@1.0"
    ];
};

# ###############################################################################

"IPACM_cfg.xml" = prebuilt_etc {
    name = "IPACM_cfg.xml";

    vendor = true;
    owner = "ipacm";
    src = "src/IPACM_cfg.xml";

};

in { inherit "IPACM_cfg.xml" ipacm; }
