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
        "src/com/google/android/traceur/AtraceUtils.java"
        "src/com/google/android/traceur/FileSender.java"
        "src/com/google/android/traceur/MainActivity.java"
        "src/com/google/android/traceur/MainFragment.java"
        "src/com/google/android/traceur/MainTvActivity.java"
        "src/com/google/android/traceur/PerfettoUtils.java"
        "src/com/google/android/traceur/QsService.java"
        "src/com/google/android/traceur/Receiver.java"
        "src/com/google/android/traceur/SearchProvider.java"
        "src/com/google/android/traceur/StopTraceService.java"
        "src/com/google/android/traceur/StorageProvider.java"
        "src/com/google/android/traceur/TraceService.java"
        "src/com/google/android/traceur/TraceUtils.java"
        "src/com/google/android/traceur/UserConsentActivityDialog.java"
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
