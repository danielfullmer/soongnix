{ android_test }:
let

RcsTests = android_test {
    name = "RcsTests";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/tests/ims/RcsGroupThreadIconChangedEventTest.java"
        "src/com/android/tests/ims/RcsGroupThreadNameChangedEventTest.java"
        "src/com/android/tests/ims/RcsGroupThreadParticipantJoinedEventTest.java"
        "src/com/android/tests/ims/RcsGroupThreadParticipantLeftEventTest.java"
        "src/com/android/tests/ims/RcsParticipantAliasChangedEventTest.java"
        "src/com/android/tests/ims/RcsParticipantQueryParamsTest.java"
        "src/com/android/tests/ims/RcsThreadQueryParamsTest.java"
    ];
    platform_apis = true;
    certificate = "platform";
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = [
        "junit"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
    ];
};

in { inherit RcsTests; }
