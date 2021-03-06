{ cc_library_static }:
let

#  =====================================================
#  Static library: libmcldLD
#  =====================================================

libmcldLD = cc_library_static {
    name = "libmcldLD";
    defaults = ["mcld-defaults"];
    host_supported = true;

    srcs = [
        "Archive.cpp"
        "ArchiveReader.cpp"
        "BranchIsland.cpp"
        "BranchIslandFactory.cpp"
        "BinaryReader.cpp"
        "DWARFLineInfo.cpp"
        "Diagnostic.cpp"
        "DiagnosticEngine.cpp"
        "DiagnosticInfos.cpp"
        "DiagnosticLineInfo.cpp"
        "DiagnosticPrinter.cpp"
        "DebugString.cpp"
        "DynObjReader.cpp"
        "ELFBinaryReader.cpp"
        "ELFSegment.cpp"
        "ELFSegmentFactory.cpp"
        "EhFrame.cpp"
        "EhFrameHdr.cpp"
        "EhFrameReader.cpp"
        "GarbageCollection.cpp"
        "GroupReader.cpp"
        "IdenticalCodeFolding.cpp"
        "LDContext.cpp"
        "LDFileFormat.cpp"
        "LDReader.cpp"
        "LDSection.cpp"
        "LDSymbol.cpp"
        "MergedStringTable.cpp"
        "MsgHandler.cpp"
        "NamePool.cpp"
        "ObjectWriter.cpp"
        "RelocData.cpp"
        "RelocationFactory.cpp"
        "Relocator.cpp"
        "ResolveInfo.cpp"
        "Resolver.cpp"
        "SectionData.cpp"
        "SectionSymbolSet.cpp"
        "StaticResolver.cpp"
        "StubFactory.cpp"
        "TextDiagnosticPrinter.cpp"
    ];

    static_libs = ["libz"];
};

#  =====================================================
#  Static library: libmcldLDVariant
#  =====================================================

libmcldLDVariant = cc_library_static {
    name = "libmcldLDVariant";
    defaults = ["mcld-defaults"];
    host_supported = true;

    srcs = [
        "BSDArchiveReader.cpp"
        "GNUArchiveReader.cpp"
        "ELFDynObjFileFormat.cpp"
        "ELFDynObjReader.cpp"
        "ELFExecFileFormat.cpp"
        "ELFFileFormat.cpp"
        "ELFObjectReader.cpp"
        "ELFObjectWriter.cpp"
        "ELFReader.cpp"
        "ELFReaderIf.cpp"
    ];
};

in { inherit libmcldLD libmcldLDVariant; }
