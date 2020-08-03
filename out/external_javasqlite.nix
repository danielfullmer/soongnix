{ cc_library_shared, java_library }:
let

libsqlite_jni = cc_library_shared {
    #  This name is dictated by the fact that the SQLite code calls loadLibrary("sqlite_jni").
    name = "libsqlite_jni";
    host_supported = true;
    cflags = [
        "-Werror"
        "-Wno-error=sign-compare"
        "-Wno-unused-parameter"
    ];
    srcs = ["src/main/native/sqlite_jni.c"];
    static_libs = ["libsqlite_static_minimal"];

    sdk_version = "23";
};

sqlite-jdbc = java_library {
    name = "sqlite-jdbc";
    hostdex = true;
    srcs = ["src/main/java/**/*.java"];
    sdk_version = "core_current";
};

in { inherit libsqlite_jni sqlite-jdbc; }
