{ java_library_static }:
let

subdirs = [
    "jni"
];

android-support-v8-renderscript = java_library_static {
    name = "android-support-v8-renderscript";
    sdk_version = "23";
    srcs = [
        "java/src/**/*.java"
    ];
    libs = [
        "android-support-annotations"
    ];
    product_variables = {
        unbundled_build = {
            enabled = false;
        };
    };
    java_version = "1.7";
};

in { inherit android-support-v8-renderscript; }
