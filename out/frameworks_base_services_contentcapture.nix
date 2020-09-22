{ filegroup, java_library_static }:
let

"services.contentcapture-sources" = filegroup {
    name = "services.contentcapture-sources";
    srcs = [
        "java/com/android/server/contentcapture/ContentCaptureManagerService.java"
        "java/com/android/server/contentcapture/ContentCaptureManagerServiceShellCommand.java"
        "java/com/android/server/contentcapture/ContentCaptureMetricsLogger.java"
        "java/com/android/server/contentcapture/ContentCapturePerUserService.java"
        "java/com/android/server/contentcapture/ContentCaptureServerSession.java"
        "java/com/android/server/contentcapture/RemoteContentCaptureService.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.contentcapture" = java_library_static {
    name = "services.contentcapture";
    defaults = ["services_defaults"];
    srcs = [":services.contentcapture-sources"];
    libs = ["services.core"];
};

in { inherit "services.contentcapture" "services.contentcapture-sources"; }
