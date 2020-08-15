{ android_app }:
let

VoiceEnrollment = android_app {
    name = "VoiceEnrollment";
    srcs = [
        "src/com/android/test/voiceenrollment/EnrollmentUtil.java"
        "src/com/android/test/voiceenrollment/TestEnrollmentActivity.java"
    ];
    platform_apis = true;
    privileged = true;
};

in { inherit VoiceEnrollment; }
