{ cc_binary, cc_binary_host, cc_library, java_library, sh_binary }:
let

liblockagent = cc_library {
    name = "liblockagent";
    host_supported = false;
    srcs = ["agent.cpp"];
    static_libs = [
        "libbase_ndk"
        "slicer_ndk_no_rtti"
    ];
    shared_libs = [
        "libz" #  for slicer (using adler32).
        "liblog"
    ];
    sdk_version = "current";
    stl = "c++_static";
    header_libs = [
        #  Use ScopedUtfChars.
        "libnativehelper_header_only"
        "libopenjdkjvmti_headers"
    ];
    compile_multilib = "both";
};

lockagenttest = cc_binary_host {
    name = "lockagenttest";
    srcs = ["agent.cpp"];
    static_libs = [
        "libbase"
        "liblog"
        "libz"
        "slicer"
    ];
    header_libs = [
        #  Use ScopedUtfChars.
        "libnativehelper_header_only"
        "libopenjdkjvmti_headers"
    ];
};

lockagent = java_library {
    name = "lockagent";
    srcs = [
        "java/com/android/lock_checker/LockHook.java"
        "java/com/android/lock_checker/OnThreadLockChecker.java"
    ];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    installable = true;
};

lockagent_crasher = cc_binary {
    name = "lockagent_crasher";
    srcs = ["crasher.cpp"];
    static_libs = ["libbase_ndk"];
    shared_libs = ["liblog"];
    sdk_version = "current";
    stl = "c++_static";
    compile_multilib = "first";
};

start_with_lockagent = sh_binary {
    name = "start_with_lockagent";
    src = "start_with_lockagent.sh";
    required = [
        "liblockagent"
        "lockagent"
        "lockagent_crasher"
    ];
};

in { inherit liblockagent lockagent lockagent_crasher lockagenttest start_with_lockagent; }
