{ android_test }:
let

EmbmsTestStreamingApp = android_test {
    name = "EmbmsTestStreamingApp";
    srcs = [
        "src/com/android/phone/testapps/embmsfrontend/EmbmsTestStreamingApp.java"
        "src/com/android/phone/testapps/embmsfrontend/StreamingServiceTracker.java"
    ];
    platform_apis = true;
    certificate = "platform";
    # LOCAL_MODULE_TAGS := debug
};

in { inherit EmbmsTestStreamingApp; }
