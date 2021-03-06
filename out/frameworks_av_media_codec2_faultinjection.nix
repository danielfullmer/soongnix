{ cc_library_shared }:
let

libcodec2_component_wrapper = cc_library_shared {
    name = "libcodec2_component_wrapper";
    vendor_available = true;

    srcs = [
        "C2ComponentWrapper.cpp"
        "SimpleMethodState.cpp"
    ];

    shared_libs = [
        "libcodec2"
        "libcodec2_vndk"
        "libcutils"
        "liblog"
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

in { inherit libcodec2_component_wrapper; }
