{ android_test }:
let

ShowWhenLocked = android_test {
    name = "ShowWhenLocked";
    srcs = ["src/com/android/showwhenlocked/ShowWhenLockedActivity.java"];
    sdk_version = "current";
};

in { inherit ShowWhenLocked; }
