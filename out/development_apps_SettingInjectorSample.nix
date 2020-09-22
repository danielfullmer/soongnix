{ android_test }:
let

SettingInjectorSample = android_test {
    name = "SettingInjectorSample";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/injector/DisabledInjectorService.java"
        "src/com/example/android/injector/FailingInjectorService.java"
        "src/com/example/android/injector/MyInjectorService.java"
        "src/com/example/android/injector/MySettingActivity.java"
        "src/com/example/android/injector/SlowInjectorService.java"
        "src/com/example/android/injector/UpdatingInjectorService.java"
    ];
    sdk_version = "current";
};

in { inherit SettingInjectorSample; }
