{ java_library_host }:
let

desugar = java_library_host {
    name = "desugar";
    srcs = ["java/**/*.java"];
    #  Remove com.google.devtools.common.options.testing classes, they are
    #  extensions to the Truth library that we are missing dependencies for
    #  and don't need.
    #  Also remove com.google.devtools.common.options.InvocationPolicy*,
    #  which depend on protobuf and are not used in desugar.
    exclude_srcs = [
        "java/com/google/devtools/common/options/testing/**/*.java"
        "java/com/google/devtools/common/options/InvocationPolicyEnforcer.java"
        "java/com/google/devtools/common/options/InvocationPolicyParser.java"
    ];

    manifest = "manifest.txt";
    static_libs = [
        "asm-6.0"
        "asm-commons-6.0"
        "asm-tree-6.0"
        "error_prone_annotations-2.0.18"
        "guava-21.0"
        "jsr305-3.0.1"
    ];

    openjdk9 = {
        #  Required for use of javax.annotation.Generated per http://b/62050818
        javacflags = ["-J--add-modules=java.xml.ws.annotation"];
    };

    #  Use Dagger2 annotation processor
    plugins = ["dagger2-auto-value"];
    libs = ["dagger2-auto-value"];
};

in { inherit desugar; }
