{ java_test_host }:
let

CtsTaggingHostTestCases = java_test_host {
    name = "CtsTaggingHostTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/tagging/TaggingBaseTest.java"
        "src/com/android/cts/tagging/TaggingDefaultTest.java"
        "src/com/android/cts/tagging/TaggingDisabledTest.java"
        "src/com/android/cts/tagging/TaggingEnabledTest.java"
    ];
    libs = [
        "cts-tradefed"
        "tradefed"
    ];
    static_libs = ["CompatChangeGatingTestBase"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
        "vts10"
    ];
};

in { inherit CtsTaggingHostTestCases; }
