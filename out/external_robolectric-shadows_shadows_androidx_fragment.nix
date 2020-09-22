{ java_library_host }:
let

# ###############################################################
#  Compile Robolectric shadows androidx fragment                #
# ###############################################################

Robolectric_shadows_androidx_fragment = java_library_host {
    name = "Robolectric_shadows_androidx_fragment";
    static_libs = [
        "Robolectric_shadows_framework"
        "Robolectric_shadowapi"
    ];
    libs = [
        "robolectric-host-android_all"
        "robolectric-host-androidx"
    ];
    plugins = ["Robolectric_processor"];
    javacflags = ["-Aorg.robolectric.annotation.processing.shadowPackage=org.robolectric.shadows.androidx.fragment"];
    srcs = [
        "src/main/java/org/robolectric/shadows/androidx/fragment/FragmentController.java"
        "src/main/java/org/robolectric/shadows/androidx/fragment/package-info.java"
    ];
};

in { inherit Robolectric_shadows_androidx_fragment; }
