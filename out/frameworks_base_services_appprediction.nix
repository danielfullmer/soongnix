{ java_library_static }:
let

"services.appprediction" = java_library_static {
    name = "services.appprediction";
    srcs = [
        "java/com/android/server/appprediction/AppPredictionManagerService.java"
        "java/com/android/server/appprediction/AppPredictionManagerServiceShellCommand.java"
        "java/com/android/server/appprediction/AppPredictionPerUserService.java"
        "java/com/android/server/appprediction/RemoteAppPredictionService.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.appprediction"; }
