{ java_binary_host }:
let

statsd_localdrive = java_binary_host {
    name = "statsd_localdrive";
    manifest = "localdrive_manifest.txt";
    srcs = [
        "src/com/android/statsd/shelltools/localdrive/LocalDrive.java"
        "src/com/android/statsd/shelltools/Utils.java"
    ];
    static_libs = [
        "platformprotos"
        "guava"
    ];
};

statsd_testdrive = java_binary_host {
    name = "statsd_testdrive";
    manifest = "testdrive_manifest.txt";
    srcs = [
        "src/com/android/statsd/shelltools/testdrive/TestDrive.java"
        "src/com/android/statsd/shelltools/Utils.java"
    ];
    static_libs = [
        "platformprotos"
        "guava"
    ];
};

in { inherit statsd_localdrive statsd_testdrive; }
