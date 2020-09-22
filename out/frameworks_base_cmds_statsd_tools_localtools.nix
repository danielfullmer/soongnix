{ java_binary_host, java_library_host, java_test_host }:
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

statsd_testdrive_lib = java_library_host {
    name = "statsd_testdrive_lib";
    srcs = [
        "src/com/android/statsd/shelltools/testdrive/TestDrive.java"
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
    static_libs = [
        "statsd_testdrive_lib"
    ];
};

statsd_testdrive_test = java_test_host {
    name = "statsd_testdrive_test";
    test_suites = ["general-tests"];
    srcs = [
        "test/com/android/statsd/shelltools/testdrive/ConfigurationTest.java"
        "test/com/android/statsd/shelltools/testdrive/TestDriveTest.java"
    ];
    static_libs = [
        "statsd_testdrive_lib"
        "junit"
        "platformprotos"
        "guava"
    ];
};

in { inherit statsd_localdrive statsd_testdrive statsd_testdrive_lib statsd_testdrive_test; }
