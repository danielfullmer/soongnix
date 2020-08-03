{ android_app }:
let

Music = android_app {
    name = "Music";
    srcs = ["src/**/*.java"];
    sdk_version = "current";
    product_specific = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit Music; }
