{ android_app }:
let

SampleSpellCheckerService = android_app {
    name = "SampleSpellCheckerService";
    srcs = [
        "src/com/example/android/samplespellcheckerservice/SampleSpellCheckerService.java"
        "src/com/example/android/samplespellcheckerservice/SpellCheckerSettingsActivity.java"
        "src/com/example/android/samplespellcheckerservice/SpellCheckerSettingsFragment.java"
    ];
    #  TODO: Change sdk version to 16
    sdk_version = "current";
};

in { inherit SampleSpellCheckerService; }
