{ java_library_static }:
let

"services.print" = java_library_static {
    name = "services.print";
    srcs = [
        "java/com/android/server/print/PrintManagerService.java"
        "java/com/android/server/print/PrintShellCommand.java"
        "java/com/android/server/print/RemotePrintService.java"
        "java/com/android/server/print/RemotePrintServiceRecommendationService.java"
        "java/com/android/server/print/RemotePrintSpooler.java"
        "java/com/android/server/print/UserState.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.print"; }
