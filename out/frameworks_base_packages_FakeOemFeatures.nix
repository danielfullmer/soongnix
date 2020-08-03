{ android_app }:
let

FakeOemFeatures = android_app {
    name = "FakeOemFeatures";
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
    optimize = {
        enabled = false;
    };
};

in { inherit FakeOemFeatures; }
