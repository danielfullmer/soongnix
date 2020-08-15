{ cc_library_static }:
let

libLLVMDebugInfoCodeView = cc_library_static {
    name = "libLLVMDebugInfoCodeView";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "ByteStream.cpp"
        "CVTypeVisitor.cpp"
        "CodeViewError.cpp"
        "EnumTables.cpp"
        "FieldListRecordBuilder.cpp"
        "Line.cpp"
        "ListRecordBuilder.cpp"
        "MemoryTypeTableBuilder.cpp"
        "MethodListRecordBuilder.cpp"
        "ModuleSubstream.cpp"
        "ModuleSubstreamVisitor.cpp"
        "RecordSerialization.cpp"
        "StreamReader.cpp"
        "StreamWriter.cpp"
        "SymbolDumper.cpp"
        "TypeDumper.cpp"
        "TypeRecord.cpp"
        "TypeRecordBuilder.cpp"
        "TypeStreamMerger.cpp"
        "TypeTableBuilder.cpp"
    ];
};

in { inherit libLLVMDebugInfoCodeView; }
