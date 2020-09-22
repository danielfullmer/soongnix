{ android_app }:
let

#  Build the Sample Embms Services
EmbmsTestService = android_app {
    name = "EmbmsTestService";
    srcs = [
        "src/com/android/phone/testapps/embmsmw/AppActiveStreams.java"
        "src/com/android/phone/testapps/embmsmw/EmbmsSampleDownloadService.java"
        "src/com/android/phone/testapps/embmsmw/EmbmsTestStreamingService.java"
        "src/com/android/phone/testapps/embmsmw/FileServiceRepository.java"
        "src/com/android/phone/testapps/embmsmw/FrontendAppIdentifier.java"
        "src/com/android/phone/testapps/embmsmw/SideChannelReceiver.java"
        "src/com/android/phone/testapps/embmsmw/StreamStateTracker.java"
        "src/com/android/phone/testapps/embmsmw/StreamingServiceRepository.java"
    ];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
    #  Uncomment the following line to build the EmbmsTestService
    #  into the userdebug build:
    #  LOCAL_MODULE_TAGS := debug
};

in { inherit EmbmsTestService; }
