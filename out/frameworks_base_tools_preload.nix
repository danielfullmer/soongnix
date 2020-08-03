{ java_library_host }:
let

preload = java_library_host {
    name = "preload";
    srcs = [
        "Compile.java"
        "LoadedClass.java"
        "MemoryUsage.java"
        "Operation.java"
        "Policy.java"
        "PrintCsv.java"
        "PrintHtmlDiff.java"
        "PrintPsTree.java"
        "Proc.java"
        "Record.java"
        "Root.java"
        "WritePreloadedClassFile.java"
    ];
};

in { inherit preload; }
