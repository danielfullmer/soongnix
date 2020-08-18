{ cc_library_shared }:
let

libc2_component_wrapper = cc_library_shared {
    name = "libc2_component_wrapper";
    vendor_available = true;

    srcs = [
        "C2ComponentWrapper.cpp"
        "SimpleMethodState.cpp"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
        "libstagefright_codec2"
        "libstagefright_codec2_vndk"
        "libstagefright_foundation"
        "libutils"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    ldflags = ["-Wl,-Bsymbolic"];
};

in { inherit libc2_component_wrapper; }
