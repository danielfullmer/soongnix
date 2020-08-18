{ cc_library_headers }:
let

"android.hardware.audio.common.util@all-versions" = cc_library_headers {
    name = "android.hardware.audio.common.util@all-versions";
    defaults = ["hidl_defaults"];
    vendor_available = true;

    export_include_dirs = ["include"];
};

in { inherit "android.hardware.audio.common.util@all-versions"; }
