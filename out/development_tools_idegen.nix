{ java_library_host }:
let

idegen = java_library_host {
    name = "idegen";
    srcs = [
        "src/Configuration.java"
        "src/Eclipse.java"
        "src/Excludes.java"
        "src/Files.java"
        "src/IntelliJ.java"
        "src/Log.java"
        "src/Main.java"
        "src/Stopwatch.java"
        "src/com/android/idegen/DirectorySearch.java"
        "src/com/android/idegen/FrameworkModule.java"
        "src/com/android/idegen/IntellijProject.java"
        "src/com/android/idegen/MakeFileParser.java"
        "src/com/android/idegen/Module.java"
        "src/com/android/idegen/ModuleCache.java"
        "src/com/android/idegen/ModuleIndexes.java"
    ];
    static_libs = ["guava"];
};

in { inherit idegen; }
