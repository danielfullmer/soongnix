{ android_test }:
let

launchperf = android_test {
    name = "launchperf";
    srcs = [
        "src/com/android/launchperf/ComplexActivity.java"
        "src/com/android/launchperf/ComplexActivityLaunchPerformance.java"
        "src/com/android/launchperf/EmptyActivity.java"
        "src/com/android/launchperf/EmptyActivityLaunchPerformance.java"
        "src/com/android/launchperf/HelloWorldLaunchPerformance.java"
        "src/com/android/launchperf/NotePadLaunchPerformance.java"
        "src/com/android/launchperf/PhoneLaunchPerformance.java"
        "src/com/android/launchperf/SimpleActivity.java"
        "src/com/android/launchperf/SimpleActivityLaunchPerformance.java"
    ];
    libs = ["android.test.runner"];
    platform_apis = true;
};

in { inherit launchperf; }
