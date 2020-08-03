{ cc_library_static }:
let

#  For the host and device
#  =====================================================
libStripUnkAttr = cc_library_static {
    name = "libStripUnkAttr";
    vendor_available = true;
    host_supported = true;
    defaults = ["slang-defaults"];

    srcs = [
        "strip_unknown_attributes.cpp"
        "strip_unknown_attributes_pass.cpp"
    ];
};

in { inherit libStripUnkAttr; }
