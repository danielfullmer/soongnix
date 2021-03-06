{ cc_binary }:
let

"android.hardware.input.classifier@1.0-service.default" = cc_binary {
    name = "android.hardware.input.classifier@1.0-service.default";
    init_rc = ["android.hardware.input.classifier@1.0-service.default.rc"];
    relative_install_path = "hw";
    vendor = true;
    vintf_fragments = ["manifest_input.classifier.xml"];
    srcs = [
        "InputClassifier.cpp"
        "service.cpp"
    ];
    shared_libs = [
        "android.hardware.input.classifier@1.0"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

in { inherit "android.hardware.input.classifier@1.0-service.default"; }
