{ android_library }:
let

#
#  Build the setup compat library.
#

setupcompat = android_library {
    name = "setupcompat";
    manifest = "AndroidManifest.xml";
    resource_dirs = [
        "main/res"
    ];
    srcs = [
        "main/java/**/*.java"
        "partnerconfig/java/**/*.java"
        "main/aidl/**/*.aidl"
    ];
    static_libs = [
        "androidx.annotation_annotation"
    ];
    min_sdk_version = "14";
};

in { inherit setupcompat; }
