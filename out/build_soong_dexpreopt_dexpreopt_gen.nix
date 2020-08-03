{ blueprint_go_binary }:
let

dexpreopt_gen = blueprint_go_binary {
    name = "dexpreopt_gen";
    srcs = [
        "dexpreopt_gen.go"
    ];
    deps = [
        "soong-dexpreopt"
        "blueprint-pathtools"
        "blueprint-proptools"
    ];
};

in { inherit dexpreopt_gen; }
