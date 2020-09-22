{ filegroup }:
let

q-gsi_avbpubkey = filegroup {
    name = "q-gsi_avbpubkey";
    srcs = [
        "q-gsi.avbpubkey"
    ];
};

r-gsi_avbpubkey = filegroup {
    name = "r-gsi_avbpubkey";
    srcs = [
        "r-gsi.avbpubkey"
    ];
};

s-gsi_avbpubkey = filegroup {
    name = "s-gsi_avbpubkey";
    srcs = [
        "s-gsi.avbpubkey"
    ];
};

in { inherit q-gsi_avbpubkey r-gsi_avbpubkey s-gsi_avbpubkey; }
