{ android_test }:
let

FrameworkPerf = android_test {
    name = "FrameworkPerf";
    srcs = [
        "src/com/android/frameworkperf/FrameworkPerfActivity.java"
        "src/com/android/frameworkperf/FrameworkPerfTest.java"
        "src/com/android/frameworkperf/LocalTestService.java"
        "src/com/android/frameworkperf/Receiver.java"
        "src/com/android/frameworkperf/RunResult.java"
        "src/com/android/frameworkperf/SchedulerService.java"
        "src/com/android/frameworkperf/SimpleInflater.java"
        "src/com/android/frameworkperf/TestArgs.java"
        "src/com/android/frameworkperf/TestService.java"
    ];
    platform_apis = true;
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
    aaptflags = [
        "-c"
        "120dpi,240dpi,160dpi,161dpi,320dpi,nodpi"
    ];
};

in { inherit FrameworkPerf; }
