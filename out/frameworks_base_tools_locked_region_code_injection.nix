{ java_binary_host }:
let

lockedregioncodeinjection = java_binary_host {
    name = "lockedregioncodeinjection";
    manifest = "manifest.txt";
    srcs = [
        "src/lockedregioncodeinjection/LockFindingClassVisitor.java"
        "src/lockedregioncodeinjection/LockTarget.java"
        "src/lockedregioncodeinjection/LockTargetState.java"
        "src/lockedregioncodeinjection/LockTargetStateAnalysis.java"
        "src/lockedregioncodeinjection/Main.java"
        "src/lockedregioncodeinjection/Utils.java"
    ];
    static_libs = [
        "asm-6.0"
        "asm-commons-6.0"
        "asm-tree-6.0"
        "asm-analysis-6.0"
        "guava-21.0"
    ];
};

in { inherit lockedregioncodeinjection; }
