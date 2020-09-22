{ java_binary_host, java_library_host }:
let

codegen_cli = java_binary_host {
    name = "codegen_cli";
    manifest = "manifest.txt";
    srcs = [
        "src/com/android/codegen/ClassInfo.kt"
        "src/com/android/codegen/ClassPrinter.kt"
        "src/com/android/codegen/ConstDef.kt"
        "src/com/android/codegen/FeatureFlag.kt"
        "src/com/android/codegen/FieldInfo.kt"
        "src/com/android/codegen/FileInfo.kt"
        "src/com/android/codegen/Generators.kt"
        "src/com/android/codegen/ImportsProvider.kt"
        "src/com/android/codegen/InputSignaturesComputation.kt"
        "src/com/android/codegen/Main.kt"
        "src/com/android/codegen/Printer.kt"
        "src/com/android/codegen/SharedConstants.kt"
        "src/com/android/codegen/Utils.kt"
    ];
    static_libs = [
        "javaparser"
    ];
};

codegen-version-info = java_library_host {
    name = "codegen-version-info";

    srcs = [
        "src/com/android/codegen/SharedConstants.kt"
    ];
};

in { inherit codegen-version-info codegen_cli; }
