{ cc_binary }:
let

sgdisk = cc_binary {
    name = "sgdisk";
    host_supported = true;

    srcs = [
        "sgdisk.cc"
        "gptcl.cc"
        "crc32.cc"
        "support.cc"
        "guid.cc"
        "gptpart.cc"
        "mbrpart.cc"
        "basicmbr.cc"
        "mbr.cc"
        "gpt.cc"
        "bsd.cc"
        "parttypes.cc"
        "attributes.cc"
        "diskio.cc"
        "diskio-unix.cc"
        "android_popt.cc"
    ];
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-pragma-pack"
        "-Werror"
    ];

    shared_libs = ["libext2_uuid"];

    target = {
        darwin = {
            cflags = [
                "-D_FILE_OFFSET_BITS=64"
                "-Doff64_t=off_t"
            ];
        };
    };
};

in { inherit sgdisk; }
