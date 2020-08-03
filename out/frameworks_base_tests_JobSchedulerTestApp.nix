{ android_app }:
let

JobSchedulerTestApp = android_app {
    name = "JobSchedulerTestApp";
    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];
    sdk_version = "current";
    optimize = {
        enabled = false;
    };
};

in { inherit JobSchedulerTestApp; }
