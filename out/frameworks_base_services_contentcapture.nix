{ java_library_static }:
let

"services.contentcapture" = java_library_static {
    name = "services.contentcapture";
    srcs = [
        "java/com/android/server/contentcapture/ContentCaptureManagerService.java"
        "java/com/android/server/contentcapture/ContentCaptureManagerServiceShellCommand.java"
        "java/com/android/server/contentcapture/ContentCaptureMetricsLogger.java"
        "java/com/android/server/contentcapture/ContentCapturePerUserService.java"
        "java/com/android/server/contentcapture/ContentCaptureServerSession.java"
        "java/com/android/server/contentcapture/RemoteContentCaptureService.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.contentcapture"; }
