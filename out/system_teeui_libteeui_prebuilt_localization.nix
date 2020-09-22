{ cc_library_static, cc_test }:
let

libteeui_localization = cc_library_static {
    name = "libteeui_localization";
    defaults = ["keystore_defaults"];
    export_include_dirs = ["include"];
    srcs = [
        "ConfirmationUITranslations.c"
    ];
    host_supported = true;
};

ConfirmationUITranslations_test = cc_test {
    name = "ConfirmationUITranslations_test";
    srcs = [
        "ConfirmationUITranslations-test.c"
    ];
    static_libs = [
        "libteeui_localization"
    ];
    host_supported = true;
    cflags = [
        "-ffunction-sections"
    ];
};

in { inherit ConfirmationUITranslations_test libteeui_localization; }
