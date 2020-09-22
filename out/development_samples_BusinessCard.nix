{ android_app }:
let

BusinessCard = android_app {
    name = "BusinessCard";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/businesscard/BusinessCardActivity.java"
        "src/com/example/android/businesscard/ContactAccessor.java"
        "src/com/example/android/businesscard/ContactAccessorSdk3_4.java"
        "src/com/example/android/businesscard/ContactAccessorSdk5.java"
        "src/com/example/android/businesscard/ContactInfo.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
};

BusinessCard_LowerApi = android_app {
    name = "BusinessCard_LowerApi";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/businesscard/BusinessCardActivity.java"
        "src/com/example/android/businesscard/ContactAccessor.java"
        "src/com/example/android/businesscard/ContactAccessorSdk3_4.java"
        "src/com/example/android/businesscard/ContactAccessorSdk5.java"
        "src/com/example/android/businesscard/ContactInfo.java"
    ];
    sdk_version = "21";
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
};

in { inherit BusinessCard BusinessCard_LowerApi; }
