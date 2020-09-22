{ android_app }:
let

HelloSpellChecker = android_app {
    name = "HelloSpellChecker";
    srcs = ["src/com/example/android/hellospellchecker/HelloSpellCheckerActivity.java"];
    #  TODO: Change sdk version to 16
    sdk_version = "current";
};

in { inherit HelloSpellChecker; }
