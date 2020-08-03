{ android_library }:
let

#
#  Build the setup design library.
#

setupdesign = android_library {
    name = "setupdesign";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.appcompat_appcompat"
        "androidx.recyclerview_recyclerview"
        "setupcompat"
        "setupdesign-strings"
    ];
    manifest = "main/AndroidManifest.xml";
    resource_dirs = [
        "main/res"
    ];
    sdk_version = "current";
    srcs = [
        "main/src/**/*.java"
    ];
    min_sdk_version = "14";
};

#
#  Strings that will not exposing.
#  If app requires these strings, please copy the string definitions directly.
#

setupdesign-strings = android_library {
    name = "setupdesign-strings";
    manifest = "main/AndroidManifest.xml";
    resource_dirs = [
        "strings/res"
    ];
    min_sdk_version = "14";
};

in { inherit setupdesign setupdesign-strings; }
