{ cc_library_headers }:
let

Magick_headers = cc_library_headers {
    name = "Magick_headers";
    export_include_dirs = ["."];
    sdk_version = "24";

    arch = {
        arm = {
            export_include_dirs = [
                "configs/arm"
            ];
        };
        arm64 = {
            export_include_dirs = [
                "configs/arm64"
            ];
        };
        x86 = {
            export_include_dirs = [
                "configs/x86"
            ];
        };
        x86_64 = {
            export_include_dirs = [
                "configs/x86-64"
            ];
        };
    };
};

in { inherit Magick_headers; }
