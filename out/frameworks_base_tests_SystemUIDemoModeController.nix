{ android_test }:
let

DemoModeController = android_test {
    name = "DemoModeController";
    srcs = ["src/com/example/android/demomodecontroller/DemoModeController.java"];
    sdk_version = "current";
};

in { inherit DemoModeController; }
