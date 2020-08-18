{ soong_namespace }:
let

_missingName = soong_namespace {
    imports = [
        "hardware/google/interfaces"
    ];
};

in { inherit _missingName; }
