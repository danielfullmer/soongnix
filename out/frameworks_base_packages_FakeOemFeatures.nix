{ android_app }:
let

FakeOemFeatures = android_app {
    name = "FakeOemFeatures";
    srcs = [
        "src/com/android/fakeoemfeatures/FakeApp.java"
        "src/com/android/fakeoemfeatures/FakeBackgroundService.java"
        "src/com/android/fakeoemfeatures/FakeCoreService.java"
        "src/com/android/fakeoemfeatures/FakeCoreService2.java"
        "src/com/android/fakeoemfeatures/FakeCoreService3.java"
        "src/com/android/fakeoemfeatures/FakeView.java"
    ];
    platform_apis = true;
    certificate = "platform";
    optimize = {
        enabled = false;
    };
};

in { inherit FakeOemFeatures; }
