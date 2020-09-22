{ sh_binary }:
let

mm_logd = sh_binary {
    name = "mm_logd";
    src = "init.mm.logging.sh";
    vendor = true;
    init_rc = [
        "pixel-mm-logd.rc"
    ];
};

in { inherit mm_logd; }
