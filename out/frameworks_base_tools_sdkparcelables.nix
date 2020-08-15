{ java_binary_host, java_library_host }:
let

sdkparcelables = java_binary_host {
    name = "sdkparcelables";
    manifest = "manifest.txt";
    srcs = [
        "src/com/android/sdkparcelables/AncestorCollector.kt"
        "src/com/android/sdkparcelables/Main.kt"
        "src/com/android/sdkparcelables/ParcelableDetector.kt"
    ];
    static_libs = [
        "asm-6.0"
    ];
};

sdkparcelables_test = java_library_host {
    name = "sdkparcelables_test";
    manifest = "manifest.txt";
    srcs = [
        "tests/com/android/sdkparcelables/ParcelableDetectorTest.kt"
    ];
    static_libs = [
        "sdkparcelables"
        "junit"
    ];
};

in { inherit sdkparcelables sdkparcelables_test; }
