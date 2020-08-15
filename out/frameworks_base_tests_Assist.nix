{ android_test }:
let

Assist = android_test {
    name = "Assist";
    srcs = [
        "src/com/android/test/assist/AboveKeyguardActivity.java"
        "src/com/android/test/assist/AssistInteractionService.java"
        "src/com/android/test/assist/AssistInteractionSession.java"
        "src/com/android/test/assist/AssistInteractionSessionService.java"
        "src/com/android/test/assist/AssistRecognitionService.java"
        "src/com/android/test/assist/ScrimView.java"
    ];
    platform_apis = true;
};

in { inherit Assist; }
