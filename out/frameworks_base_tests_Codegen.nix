{ android_test }:
let

CodegenTests = android_test {
    name = "CodegenTests";
    srcs = [
        "src/com/android/codegentest/HierrarchicalDataClassBase.java"
        "src/com/android/codegentest/HierrarchicalDataClassChild.java"
        "src/com/android/codegentest/MyDateParcelling.java"
        "src/com/android/codegentest/ParcelAllTheThingsDataClass.java"
        "src/com/android/codegentest/SampleDataClass.java"
        "src/com/android/codegentest/SampleDataClassTest.java"
        "src/com/android/codegentest/SampleWithCustomBuilder.java"
        "src/com/android/codegentest/SampleWithNestedDataClasses.java"
        "src/com/android/codegentest/StaleDataclassDetectorFalsePositivesTest.java"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];
    certificate = "platform";

    optimize = {
        enabled = false;
    };

    plugins = [
        "staledataclass-annotation-processor"
    ];
    static_libs = [
        "junit"
        "hamcrest"
        "hamcrest-library"
        "androidx.test.runner"
        "androidx.test.rules"
    ];
};

in { inherit CodegenTests; }
