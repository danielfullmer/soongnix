{ cc_library_static }:
let

libmcldSupport = cc_library_static {
    name = "libmcldSupport";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "Demangle.cpp"
        "Directory.cpp"
        "FileHandle.cpp"
        "FileOutputBuffer.cpp"
        "FileSystem.cpp"
        "LEB128.cpp"
        "MemoryArea.cpp"
        "MemoryAreaFactory.cpp"
        "MsgHandling.cpp"
        "Path.cpp"
        "raw_ostream.cpp"
        "RealPath.cpp"
        "SystemUtils.cpp"
        "Target.cpp"
        "TargetRegistry.cpp"
    ];
};

in { inherit libmcldSupport; }
