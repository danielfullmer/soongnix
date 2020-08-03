{ android_app }:
let

Gallery = android_app {
    name = "Gallery";
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "media";
};

in { inherit Gallery; }
