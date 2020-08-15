{ cc_library_static }:
let

libclangARCMigrate = cc_library_static {
    name = "libclangARCMigrate";
    defaults = ["clang-defaults"];
    srcs = [
        "ARCMT.cpp"
        "ARCMTActions.cpp"
        "FileRemapper.cpp"
        "ObjCMT.cpp"
        "PlistReporter.cpp"
        "TransAPIUses.cpp"
        "TransARCAssign.cpp"
        "TransAutoreleasePool.cpp"
        "TransBlockObjCVariable.cpp"
        "TransEmptyStatementsAndDealloc.cpp"
        "TransGCAttrs.cpp"
        "TransGCCalls.cpp"
        "TransProperties.cpp"
        "TransProtectedScope.cpp"
        "TransRetainReleaseDealloc.cpp"
        "TransUnbridgedCasts.cpp"
        "TransUnusedInitDelegate.cpp"
        "TransZeroOutPropsInDealloc.cpp"
        "TransformActions.cpp"
        "Transforms.cpp"
    ];
};

in { inherit libclangARCMigrate; }
