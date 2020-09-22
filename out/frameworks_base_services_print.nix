{ filegroup, java_library_static }:
let

"services.print-sources" = filegroup {
    name = "services.print-sources";
    srcs = [
        "java/com/android/server/print/PrintManagerService.java"
        "java/com/android/server/print/PrintShellCommand.java"
        "java/com/android/server/print/RemotePrintService.java"
        "java/com/android/server/print/RemotePrintServiceRecommendationService.java"
        "java/com/android/server/print/RemotePrintSpooler.java"
        "java/com/android/server/print/UserState.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.print" = java_library_static {
    name = "services.print";
    defaults = ["services_defaults"];
    srcs = [":services.print-sources"];
    libs = ["services.core"];
};

in { inherit "services.print" "services.print-sources"; }
