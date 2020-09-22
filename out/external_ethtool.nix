{ cc_binary }:
let

ethtool = cc_binary {
    name = "ethtool";
    srcs = [
        "amd8111e.c"
        "at76c50x-usb.c"
        "de2104x.c"
        "dsa.c"
        "e100.c"
        "e1000.c"
        "et131x.c"
        "ethtool.c"
        "fec.c"
        "fec_8xx.c"
        "fjes.c"
        "ibm_emac.c"
        "igb.c"
        "ixgb.c"
        "ixgbe.c"
        "ixgbevf.c"
        "lan78xx.c"
        "marvell.c"
        "natsemi.c"
        "pcnet32.c"
        "qsfp.c"
        "realtek.c"
        "rxclass.c"
        "sfc.c"
        "sff-common.c"
        "sfpdiag.c"
        "sfpid.c"
        "smsc911x.c"
        "stmmac.c"
        "tg3.c"
        "tse.c"
        "vioc.c"
        "vmxnet3.c"
    ];
    cflags = [
        "-Wno-missing-field-initializers"
        "-DPACKAGE=\"ethtool\""
        "-DVERSION=\"5.3\""
        "-std=gnu11"
    ];
};

in { inherit ethtool; }
