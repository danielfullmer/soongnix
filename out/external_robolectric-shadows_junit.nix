{ java_library_host }:
let

# ##########################################
#  Compile Robolectric junit
# ##########################################

Robolectric_junit = java_library_host {
    name = "Robolectric_junit";
    libs = [
        "Robolectric_annotations"
        "Robolectric_shadowapi"
        "Robolectric_sandbox"
        "Robolectric_utils"
        "asm-commons-6.0"
        "guava"
        "asm-tree-6.0"
        "hamcrest"
        "junit"
        "asm-6.0"
        "jsr305"
    ];
    srcs = ["src/main/java/org/robolectric/internal/SandboxTestRunner.java"];
};

in { inherit Robolectric_junit; }
