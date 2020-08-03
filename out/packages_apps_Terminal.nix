{ android_app }:
let

subdirs = [
    "jni"
];
Terminal = android_app {
    name = "Terminal";
    srcs = ["src/**/*.java"];
    static_libs = ["androidx.viewpager_viewpager"];
    jni_libs = ["libjni_terminal"];
    #  TODO: enable proguard once development has settled down
    # LOCAL_PROGUARD_FLAG_FILES := proguard.flags
    optimize = {
        enabled = false;
    };
    platform_apis = true;
};

in { inherit Terminal; }
