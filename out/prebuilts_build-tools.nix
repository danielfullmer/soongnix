{ cc_library_headers }:
let

FlexLexer = cc_library_headers {
    name = "FlexLexer";
    host_supported = true;
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    export_include_dirs = ["common/flex"];
    notice = "common/flex/NOTICE";
};

in { inherit FlexLexer; }
