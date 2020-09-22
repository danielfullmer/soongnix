{ cc_library_static }:
let

libpdfium-cmaps = cc_library_static {
    name = "libpdfium-cmaps";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    static_libs = [
        "libpdfium-fxcrt"
    ];

    srcs = [
        "fpdf_cmaps.cpp"
        "CNS1/Adobe-CNS1-UCS2_5.cpp"
        "CNS1/B5pc-H_0.cpp"
        "CNS1/B5pc-V_0.cpp"
        "CNS1/CNS-EUC-H_0.cpp"
        "CNS1/CNS-EUC-V_0.cpp"
        "CNS1/ETen-B5-H_0.cpp"
        "CNS1/ETen-B5-V_0.cpp"
        "CNS1/ETenms-B5-H_0.cpp"
        "CNS1/ETenms-B5-V_0.cpp"
        "CNS1/HKscs-B5-H_5.cpp"
        "CNS1/HKscs-B5-V_5.cpp"
        "CNS1/UniCNS-UCS2-H_3.cpp"
        "CNS1/UniCNS-UCS2-V_3.cpp"
        "CNS1/UniCNS-UTF16-H_0.cpp"
        "CNS1/cmaps_cns1.cpp"
        "GB1/Adobe-GB1-UCS2_5.cpp"
        "GB1/GB-EUC-H_0.cpp"
        "GB1/GB-EUC-V_0.cpp"
        "GB1/GBK-EUC-H_2.cpp"
        "GB1/GBK-EUC-V_2.cpp"
        "GB1/GBK2K-H_5.cpp"
        "GB1/GBK2K-V_5.cpp"
        "GB1/GBKp-EUC-H_2.cpp"
        "GB1/GBKp-EUC-V_2.cpp"
        "GB1/GBpc-EUC-H_0.cpp"
        "GB1/GBpc-EUC-V_0.cpp"
        "GB1/UniGB-UCS2-H_4.cpp"
        "GB1/UniGB-UCS2-V_4.cpp"
        "GB1/cmaps_gb1.cpp"
        "Japan1/83pv-RKSJ-H_1.cpp"
        "Japan1/90ms-RKSJ-H_2.cpp"
        "Japan1/90ms-RKSJ-V_2.cpp"
        "Japan1/90msp-RKSJ-H_2.cpp"
        "Japan1/90msp-RKSJ-V_2.cpp"
        "Japan1/90pv-RKSJ-H_1.cpp"
        "Japan1/Add-RKSJ-H_1.cpp"
        "Japan1/Add-RKSJ-V_1.cpp"
        "Japan1/Adobe-Japan1-UCS2_4.cpp"
        "Japan1/EUC-H_1.cpp"
        "Japan1/EUC-V_1.cpp"
        "Japan1/Ext-RKSJ-H_2.cpp"
        "Japan1/Ext-RKSJ-V_2.cpp"
        "Japan1/H_1.cpp"
        "Japan1/UniJIS-UCS2-HW-H_4.cpp"
        "Japan1/UniJIS-UCS2-HW-V_4.cpp"
        "Japan1/UniJIS-UCS2-H_4.cpp"
        "Japan1/UniJIS-UCS2-V_4.cpp"
        "Japan1/V_1.cpp"
        "Japan1/cmaps_japan1.cpp"
        "Korea1/Adobe-Korea1-UCS2_2.cpp"
        "Korea1/KSC-EUC-H_0.cpp"
        "Korea1/KSC-EUC-V_0.cpp"
        "Korea1/KSCms-UHC-HW-H_1.cpp"
        "Korea1/KSCms-UHC-HW-V_1.cpp"
        "Korea1/KSCms-UHC-H_1.cpp"
        "Korea1/KSCms-UHC-V_1.cpp"
        "Korea1/KSCpc-EUC-H_0.cpp"
        "Korea1/UniKS-UCS2-H_1.cpp"
        "Korea1/UniKS-UCS2-V_1.cpp"
        "Korea1/UniKS-UTF16-H_0.cpp"
        "Korea1/cmaps_korea1.cpp"
    ];
};

in { inherit libpdfium-cmaps; }