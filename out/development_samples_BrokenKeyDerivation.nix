{ android_app }:
let

BrokenKeyDerivation = android_app {
    name = "BrokenKeyDerivation";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/brokenkeyderivation/BrokenKeyDerivationActivity.java"
        "src/com/example/android/brokenkeyderivation/InsecureSHA1PRNGKeyDerivator.java"
    ];
    sdk_version = "current";
};

in { inherit BrokenKeyDerivation; }
