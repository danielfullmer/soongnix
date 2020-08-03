{ cc_library }:
let

#  Copyright 2015 The Android Open Source Project

liblzma = cc_library {
    name = "liblzma";
    host_supported = true;
    vendor_available = true;
    recovery_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    sdk_version = "9";
    stl = "none";

    cflags = [
        "-D_7ZIP_ST"
        "-Wall"
        "-Werror"
        "-Wno-empty-body"
        "-Wno-enum-conversion"
        "-Wno-logical-op-parentheses"
        "-Wno-self-assign"
    ];

    export_include_dirs = ["."];

    srcs = [
        "7zAlloc.c"
        "7zArcIn.c"
        "7zBuf2.c"
        "7zBuf.c"
        "7zCrc.c"
        "7zCrcOpt.c"
        "7zDec.c"
        "7zFile.c"
        "7zStream.c"
        "Aes.c"
        "AesOpt.c"
        "Alloc.c"
        "Bcj2.c"
        "Bra86.c"
        "Bra.c"
        "BraIA64.c"
        "CpuArch.c"
        "Delta.c"
        "LzFind.c"
        "Lzma2Dec.c"
        "Lzma2Enc.c"
        "Lzma86Dec.c"
        "Lzma86Enc.c"
        "LzmaDec.c"
        "LzmaEnc.c"
        "LzmaLib.c"
        "Ppmd7.c"
        "Ppmd7Dec.c"
        "Ppmd7Enc.c"
        "Sha256.c"
        "Sort.c"
        "Xz.c"
        "XzCrc64.c"
        "XzCrc64Opt.c"
        "XzDec.c"
        "XzEnc.c"
        "XzIn.c"
    ];

    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
            srcs = [
                "Bcj2Enc.c"
                "DllSecur.c"
                "LzFindMt.c"
                "Lzma2DecMt.c"
                "MtCoder.c"
                "MtDec.c"
                "Threads.c"
            ];
        };
    };
};

in { inherit liblzma; }
