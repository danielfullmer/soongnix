{ cc_library, cc_library_static }:
let

libteeui = cc_library_static {
    name = "libteeui";
    defaults = ["keystore_defaults"];
    export_include_dirs = ["include"];
    srcs = [
        "src/button.cpp"
        "src/font_rendering.cpp"
        "src/label.cpp"
        "src/utils.cpp"
    ];
    static_libs = [
        "libft2.nodep"
    ];
    host_supported = true;
    cflags = [
        "-ffunction-sections"
    ];
};

libteeui_hal_support = cc_library {
    name = "libteeui_hal_support";
    defaults = ["keystore_defaults"];
    export_include_dirs = ["include"];
    srcs = [
        "src/evdev.cpp"
        "src/generic_messages.cpp"
        "src/msg_formatting.cpp"
        "src/utils.cpp"
        "src/weak_secure_input_device.cpp"
    ];
    shared_libs = [
        "android.hardware.confirmationui@1.0"
        "android.hardware.keymaster@4.0"
        "libhidlbase"
        "libbase"
    ];
    host_supported = true;
    vendor_available = true;
};

in { inherit libteeui libteeui_hal_support; }
