{ android_test }:
let

StatusBarTest = android_test {
    name = "StatusBarTest";
    srcs = ["**/*.java"];
    platform_apis = true;
    certificate = "platform";
    optimize = {
        enabled = false;
    };
};

in { inherit StatusBarTest; }
