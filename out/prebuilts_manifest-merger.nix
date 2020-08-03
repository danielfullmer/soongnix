{ java_binary_host, java_import_host }:
let

manifest-merger-jars = java_import_host {
    name = "manifest-merger-jars";
    jars = [
        "com/android/tools/build/manifest-merger/26.4.0-beta05/manifest-merger-26.4.0-beta05.jar"
        "com/android/tools/common/26.4.0-beta05/common-26.4.0-beta05.jar"
        "com/android/tools/sdk-common/26.4.0-beta05/sdk-common-26.4.0-beta05.jar"
        "com/android/tools/sdklib/26.4.0-beta05/sdklib-26.4.0-beta05.jar"
    ];
};

manifest-merger = java_binary_host {
    name = "manifest-merger";
    main_class = "com.android.manifmerger.Merger";
    static_libs = [
        "manifest-merger-jars"
        "guava-21.0"
        "kotlin-stdlib"
    ];
};

in { inherit manifest-merger manifest-merger-jars; }
