{ java_library }:
let

apache-commons-compress = java_library {
    name = "apache-commons-compress";
    srcs = [
        "src/main/java/**/*.java"
        "src/stub/java/**/*.java"
    ];
    static_libs = [
        "xz-java"
        "brotli-java"
    ];
    sdk_version = "current";
};

in { inherit apache-commons-compress; }
