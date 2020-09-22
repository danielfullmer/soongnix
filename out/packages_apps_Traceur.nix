{ android_app, sh_binary }:
let

Traceur = android_app {
    name = "Traceur";
    platform_apis = true;
    certificate = "platform";
    required = ["notify_traceur.sh"];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    static_libs = [
        "androidx.leanback_leanback"
        "androidx.leanback_leanback-preference"
        "androidx.legacy_legacy-preference-v14"
        "androidx.appcompat_appcompat"
        "androidx.preference_preference"
        "androidx.recyclerview_recyclerview"
        "androidx.legacy_legacy-support-v4"
    ];
    resource_dirs = ["res"];
    srcs = [
        "src/com/android/traceur/AtraceUtils.java"
        "src/com/android/traceur/FileSender.java"
        "src/com/android/traceur/MainActivity.java"
        "src/com/android/traceur/MainFragment.java"
        "src/com/android/traceur/MainTvActivity.java"
        "src/com/android/traceur/PerfettoUtils.java"
        "src/com/android/traceur/QsService.java"
        "src/com/android/traceur/Receiver.java"
        "src/com/android/traceur/SearchProvider.java"
        "src/com/android/traceur/StopTraceService.java"
        "src/com/android/traceur/StorageProvider.java"
        "src/com/android/traceur/TraceService.java"
        "src/com/android/traceur/TraceUtils.java"
        "src/com/android/traceur/UserConsentActivityDialog.java"
    ];
    init_rc = ["traceur.rc"];
    defaults = [
        "SettingsLibDefaults"
    ];
};

"notify_traceur.sh" = sh_binary {
    name = "notify_traceur.sh";
    src = "notify_traceur.sh";
};

in { inherit "notify_traceur.sh" Traceur; }
