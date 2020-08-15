{ android_app }:
let

JobSchedulerTestApp = android_app {
    name = "JobSchedulerTestApp";
    srcs = [
        "src/com/android/demo/jobSchedulerApp/MainActivity.java"
        "src/com/android/demo/jobSchedulerApp/service/TestJobService.java"
    ];
    resource_dirs = ["res"];
    sdk_version = "current";
    optimize = {
        enabled = false;
    };
};

in { inherit JobSchedulerTestApp; }
