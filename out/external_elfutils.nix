{ cc_library_static }:
let

libelf_headers = cc_library_static {
    name = "libelf_headers";
    host_supported = true;
    vendor_available = true;
    export_include_dirs = [
        "."
        "lib"
    ];
    target = {
        android = {
            export_include_dirs = ["bionic-fixup"];
        };
    };
};

subdirs = ["libelf"];

in { inherit libelf_headers; }
