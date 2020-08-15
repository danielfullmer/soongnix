{ cc_library_static }:
let

libLLVMObject = cc_library_static {
    name = "libLLVMObject";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "Archive.cpp"
        "ArchiveWriter.cpp"
        "Binary.cpp"
        "COFFObjectFile.cpp"
        "ELF.cpp"
        "ELFObjectFile.cpp"
        "Error.cpp"
        "IRObjectFile.cpp"
        "MachOObjectFile.cpp"
        "MachOUniversal.cpp"
        "ModuleSummaryIndexObjectFile.cpp"
        "Object.cpp"
        "ObjectFile.cpp"
        "RecordStreamer.cpp"
        "SymbolSize.cpp"
        "SymbolicFile.cpp"
    ];
    cflags = [
        "-Wno-unused-private-field"
    ];
};

in { inherit libLLVMObject; }
