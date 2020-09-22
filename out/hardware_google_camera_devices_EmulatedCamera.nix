{ soong_namespace }:
let

_missingName = soong_namespace {
    imports = [
        "hardware/google/camera"
    ];
};

in { inherit _missingName; }
