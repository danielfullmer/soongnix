{ filegroup, java_library }:
let

backuplib-sources = filegroup {
    name = "backuplib-sources";
    srcs = [
        "java/com/android/server/backup/TransportManager.java"
        "java/com/android/server/backup/transport/DelegatingTransport.java"
        "java/com/android/server/backup/transport/OnTransportRegisteredListener.java"
        "java/com/android/server/backup/transport/TransportClient.java"
        "java/com/android/server/backup/transport/TransportClientManager.java"
        "java/com/android/server/backup/transport/TransportConnectionListener.java"
        "java/com/android/server/backup/transport/TransportNotAvailableException.java"
        "java/com/android/server/backup/transport/TransportNotRegisteredException.java"
        "java/com/android/server/backup/transport/TransportStats.java"
        "java/com/android/server/backup/transport/TransportUtils.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

backuplib = java_library {
    name = "backuplib";
    srcs = [":backuplib-sources"];
    libs = ["services.core"];
};

in { inherit backuplib backuplib-sources; }
