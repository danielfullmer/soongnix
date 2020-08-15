{ cc_library_static }:
let

libLLVMAsmPrinter = cc_library_static {
    name = "libLLVMAsmPrinter";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "ARMException.cpp"
        "AddressPool.cpp"
        "AsmPrinter.cpp"
        "AsmPrinterDwarf.cpp"
        "AsmPrinterInlineAsm.cpp"
        "CodeViewDebug.cpp"
        "DIE.cpp"
        "DIEHash.cpp"
        "DbgValueHistoryCalculator.cpp"
        "DebugHandlerBase.cpp"
        "DebugLocStream.cpp"
        "DwarfAccelTable.cpp"
        "DwarfCFIException.cpp"
        "DwarfCompileUnit.cpp"
        "DwarfDebug.cpp"
        "DwarfExpression.cpp"
        "DwarfFile.cpp"
        "DwarfStringPool.cpp"
        "DwarfUnit.cpp"
        "EHStreamer.cpp"
        "ErlangGCPrinter.cpp"
        "OcamlGCPrinter.cpp"
        "WinException.cpp"
    ];
};

in { inherit libLLVMAsmPrinter; }
