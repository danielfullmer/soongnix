{ cc_library_static }:
let

libLLVMDebugInfoDWARF = cc_library_static {
    name = "libLLVMDebugInfoDWARF";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "DWARFAbbreviationDeclaration.cpp"
        "DWARFAcceleratorTable.cpp"
        "DWARFCompileUnit.cpp"
        "DWARFContext.cpp"
        "DWARFDebugAbbrev.cpp"
        "DWARFDebugArangeSet.cpp"
        "DWARFDebugAranges.cpp"
        "DWARFDebugFrame.cpp"
        "DWARFDebugInfoEntry.cpp"
        "DWARFDebugLine.cpp"
        "DWARFDebugLoc.cpp"
        "DWARFDebugMacro.cpp"
        "DWARFDebugRangeList.cpp"
        "DWARFFormValue.cpp"
        "DWARFTypeUnit.cpp"
        "DWARFUnit.cpp"
        "DWARFUnitIndex.cpp"
        "SyntaxHighlighting.cpp"
    ];
};

in { inherit libLLVMDebugInfoDWARF; }
