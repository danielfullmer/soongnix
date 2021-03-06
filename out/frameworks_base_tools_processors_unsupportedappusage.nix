{ java_plugin }:
let

unsupportedappusage-annotation-processor = java_plugin {
    name = "unsupportedappusage-annotation-processor";
    processor_class = "android.processor.unsupportedappusage.UnsupportedAppUsageProcessor";

    java_resources = [
        "META-INF/**/*"
    ];
    srcs = [
        "src/android/processor/unsupportedappusage/SignatureBuilder.java"
        "src/android/processor/unsupportedappusage/UnsupportedAppUsageProcessor.java"
    ];
    static_libs = [
        "guava"
        "unsupportedappusage-annotation"
    ];
    openjdk9 = {
        javacflags = [
            "--add-modules=jdk.compiler"
            "--add-exports jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED"
            "--add-exports jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED"
            "--add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED"
            "--add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED"
        ];
    };

    use_tools_jar = true;
};

in { inherit unsupportedappusage-annotation-processor; }
