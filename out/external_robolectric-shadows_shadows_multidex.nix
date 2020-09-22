{ java_library_host }:
let

# #############################################
#  Compile Robolectric shadows multidex
# #############################################

Robolectric_shadows_multidex = java_library_host {
    name = "Robolectric_shadows_multidex";
    libs = [
        "Robolectric_annotations"
        "Robolectric_shadowapi"
        "robolectric-host-android-support-multidex"
        "robolectric-javax.annotation-api-1.2"
        "robolectric-host-android_all"
    ];
    plugins = ["Robolectric_processor"];
    javacflags = ["-Aorg.robolectric.annotation.processing.shadowPackage=org.robolectric.shadows.multidex"];
    srcs = [
        "src/main/java/org/robolectric/shadows/multidex/ShadowAndroidXMultiDex.java"
        "src/main/java/org/robolectric/shadows/multidex/package-info.java"
    ];
};

in { inherit Robolectric_shadows_multidex; }
