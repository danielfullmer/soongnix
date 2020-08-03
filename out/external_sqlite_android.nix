{ cc_library_static, cc_test }:
let

libsqlite3_android = cc_library_static {
    name = "libsqlite3_android";
    vendor_available = true;
    host_supported = true;
    cflags = [
        "-DSQLITE_ENABLE_ICU"
        "-Wall"
        "-Werror"
        "-Wno-unused-function"
        "-Wno-unused-variable"
    ];
    srcs = [
        "PhoneNumberUtils.cpp"
        "OldPhoneNumberUtils.cpp"
        "sqlite3_android.cpp"
    ];
    include_dirs = ["external/sqlite/dist"];
    shared_libs = [
        "liblog"
        "libandroidicu"
    ];
    target = {
        vendor = {
            cflags = ["-USQLITE_ENABLE_ICU"];
            exclude_shared_libs = ["libandroidicu"];
        };
    };
    export_include_dirs = ["."];
};

#        The formal test for phone_number_compare() is in DataBaseGeneralTest.java
#        (as of 2009-08-02), in which phone_number_compare() is tested via sqlite's custom
#        function "PHONE_NUMBER_COMPARE".
libsqlite3_phone_number_utils_test = cc_test {
    name = "libsqlite3_phone_number_utils_test";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    srcs = [
        "OldPhoneNumberUtils.cpp"
        "OldPhoneNumberUtilsTest.cpp"
        "PhoneNumberUtils.cpp"
        "PhoneNumberUtilsTest.cpp"
    ];
};

in { inherit libsqlite3_android libsqlite3_phone_number_utils_test; }
