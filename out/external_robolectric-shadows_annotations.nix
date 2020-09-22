{ java_library_host }:
let

# #############################################
#  Compile Robolectric annotations
# #############################################

Robolectric_annotations = java_library_host {
    name = "Robolectric_annotations";
    static_libs = [
        "Robolectric_shadowapi"
        "jsr305"
    ];
    libs = ["robolectric-host-android_all"];
    srcs = [
        "src/main/java/org/robolectric/annotation/AccessibilityChecks.java"
        "src/main/java/org/robolectric/annotation/Config.java"
        "src/main/java/org/robolectric/annotation/DefaultApplication.java"
        "src/main/java/org/robolectric/annotation/HiddenApi.java"
        "src/main/java/org/robolectric/annotation/Implementation.java"
        "src/main/java/org/robolectric/annotation/Implements.java"
        "src/main/java/org/robolectric/annotation/RealObject.java"
        "src/main/java/org/robolectric/annotation/Resetter.java"
        "src/main/java/org/robolectric/annotation/package-info.java"
        "src/main/java/org/robolectric/annotation/internal/ConfigUtils.java"
    ];
};

in { inherit Robolectric_annotations; }
