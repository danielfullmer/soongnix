{ java_library_host, java_test_host }:
let

# #############################################
#  Compile Robolectric shadowapi
# #############################################

Robolectric_shadowapi = java_library_host {
    name = "Robolectric_shadowapi";
    libs = ["jsr305"];
    srcs = [
        "src/main/java/org/robolectric/annotation/internal/DoNotInstrument.java"
        "src/main/java/org/robolectric/annotation/internal/Instrument.java"
        "src/main/java/org/robolectric/internal/IShadow.java"
        "src/main/java/org/robolectric/internal/ShadowProvider.java"
        "src/main/java/org/robolectric/shadow/api/Shadow.java"
        "src/main/java/org/robolectric/shadow/api/ShadowPicker.java"
        "src/main/java/org/robolectric/util/ReflectionHelpers.java"
    ];
};

# #############################################
#  Compile Robolectric shadowapi tests
# #############################################
Robolectric_shadowapi_tests = java_test_host {
    name = "Robolectric_shadowapi_tests";
    srcs = ["src/test/java/org/robolectric/util/ReflectionHelpersTest.java"];
    static_libs = [
        "Robolectric_shadowapi"
        "hamcrest"
        "guava"
        "junit"
        "truth-prebuilt"
    ];
    test_suites = ["general-tests"];
};

in { inherit Robolectric_shadowapi Robolectric_shadowapi_tests; }
