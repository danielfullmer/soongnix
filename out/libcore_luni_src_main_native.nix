{ filegroup }:
let

luni_native_srcs = filegroup {
    name = "luni_native_srcs";
    srcs = [
        "ExecStrings.cpp"
        "IcuUtilities.cpp"
        "JniConstants.cpp"
        "JniException.cpp"
        "NetworkUtilities.cpp"
        "Register.cpp"
        "ZipUtilities.cpp"
        "android_system_OsConstants.cpp"
        "cbigint.cpp"
        "java_lang_StringToReal.cpp"
        "java_lang_invoke_MethodHandle.cpp"
        "java_lang_invoke_VarHandle.cpp"
        "java_math_NativeBN.cpp"
        "java_util_regex_Matcher.cpp"
        "java_util_regex_Pattern.cpp"
        "libcore_icu_ICU.cpp"
        "libcore_icu_NativeConverter.cpp"
        "libcore_icu_TimeZoneNames.cpp"
        "libcore_io_AsynchronousCloseMonitor.cpp"
        "libcore_io_Linux.cpp"
        "libcore_io_Memory.cpp"
        "libcore_util_NativeAllocationRegistry.cpp"
        "org_apache_harmony_xml_ExpatParser.cpp"
        "sun_misc_Unsafe.cpp"
        "valueOf.cpp"
    ];
};

libandroidio_srcs = filegroup {
    name = "libandroidio_srcs";
    srcs = [
        "AsynchronousCloseMonitor.cpp"
    ];
};

in { inherit libandroidio_srcs luni_native_srcs; }
