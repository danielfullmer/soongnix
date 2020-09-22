{ java_binary_host, java_import_host }:
let

manifest-merger-jars = java_import_host {
    name = "manifest-merger-jars";
    jars = [
        "com/android/tools/build/manifest-merger/26.6.0-dev/manifest-merger-26.6.0-dev.jar"
        "com/android/tools/common/26.6.0-dev/common-26.6.0-dev.jar"
        "com/android/tools/sdk-common/26.6.0-dev/sdk-common-26.6.0-dev.jar"
        "com/android/tools/sdklib/26.6.0-dev/sdklib-26.6.0-dev.jar"
    ];
};

manifest-merger = java_binary_host {
    name = "manifest-merger";
    main_class = "com.android.manifmerger.Merger";
    static_libs = [
        "manifest-merger-jars"
        "guava-21.0"
        "gson-prebuilt-jar"
        "kotlin-stdlib"
    ];
};

in { inherit manifest-merger manifest-merger-jars; }
