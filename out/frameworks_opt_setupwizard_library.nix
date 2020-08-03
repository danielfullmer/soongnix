{ android_library }:
let

#
#  Build the platform version of setup wizard library.
#

setup-wizard-lib = android_library {
    name = "setup-wizard-lib";

    libs = ["androidx.annotation_annotation"];
    manifest = "main/AndroidManifest.xml";
    resource_dirs = [
        "main/res"
        "platform/res"
    ];
    sdk_version = "current";
    srcs = [
        "main/src/**/*.java"
        "platform/src/**/*.java"
    ];
    min_sdk_version = "23";
};

#
#  Build gingerbread-compat library, which uses AppCompat support library to provide backwards
#  compatibility back to SDK v9.
#

setup-wizard-lib-gingerbread-compat = android_library {
    name = "setup-wizard-lib-gingerbread-compat";
    manifest = "main/AndroidManifest.xml";
    resource_dirs = [
        "main/res"
        "gingerbread/res"
        "recyclerview/res"
    ];
    sdk_version = "current";
    srcs = [
        "main/src/**/*.java"
        "gingerbread/src/**/*.java"
        "recyclerview/src/**/*.java"
    ];

    libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.appcompat_appcompat"
        "androidx.recyclerview_recyclerview"
    ];

    min_sdk_version = "14";
};

in { inherit setup-wizard-lib setup-wizard-lib-gingerbread-compat; }
