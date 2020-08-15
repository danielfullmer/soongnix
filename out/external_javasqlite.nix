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
    srcs = [
        "src/main/java/SQLite/Authorizer.java"
        "src/main/java/SQLite/Backup.java"
        "src/main/java/SQLite/Blob.java"
        "src/main/java/SQLite/BusyHandler.java"
        "src/main/java/SQLite/Callback.java"
        "src/main/java/SQLite/Constants.java"
        "src/main/java/SQLite/Database.java"
        "src/main/java/SQLite/Exception.java"
        "src/main/java/SQLite/Function.java"
        "src/main/java/SQLite/FunctionContext.java"
        "src/main/java/SQLite/JDBCDriver.java"
        "src/main/java/SQLite/Profile.java"
        "src/main/java/SQLite/ProgressHandler.java"
        "src/main/java/SQLite/Shell.java"
        "src/main/java/SQLite/Stmt.java"
        "src/main/java/SQLite/StringEncoder.java"
        "src/main/java/SQLite/TableResult.java"
        "src/main/java/SQLite/Trace.java"
        "src/main/java/SQLite/Vm.java"
        "src/main/java/SQLite/JDBC2z/JDBCConnection.java"
        "src/main/java/SQLite/JDBC2z/JDBCDatabaseMetaData.java"
        "src/main/java/SQLite/JDBC2z/JDBCPreparedStatement.java"
        "src/main/java/SQLite/JDBC2z/JDBCResultSet.java"
        "src/main/java/SQLite/JDBC2z/JDBCResultSetMetaData.java"
        "src/main/java/SQLite/JDBC2z/JDBCStatement.java"
        "src/main/java/SQLite/JDBC2z/TableResultX.java"
    ];
    sdk_version = "core_current";
};

in { inherit libsqlite_jni sqlite-jdbc; }
