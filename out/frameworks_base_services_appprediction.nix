{ filegroup, java_library_static }:
let

"services.appprediction-sources" = filegroup {
    name = "services.appprediction-sources";
    srcs = [
        "java/com/android/server/appprediction/AppPredictionManagerService.java"
        "java/com/android/server/appprediction/AppPredictionManagerServiceShellCommand.java"
        "java/com/android/server/appprediction/AppPredictionPerUserService.java"
        "java/com/android/server/appprediction/RemoteAppPredictionService.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.appprediction" = java_library_static {
    name = "services.appprediction";
    defaults = ["services_defaults"];
    srcs = [":services.appprediction-sources"];
    libs = ["services.core"];
};

in { inherit "services.appprediction" "services.appprediction-sources"; }
