{ cc_defaults, cc_library_static }:
let

deqp_glslang_defaults = cc_defaults {
    cpp_std = "c++11";
    cppflags = [
        "-DAMD_EXTENSIONS"
        "-DENABLE_HLSL"
        "-DGLSLANG_OSINCLUDE_UNIX"
        "-DNV_EXTENSIONS"
        "-Wall"
        "-Werror"
        "-fno-exceptions"
    ];
    export_include_dirs = [
        "."
    ];
    name = "deqp_glslang_defaults";
    rtti = false;
    sdk_version = "27";
    stl = "libc++_static";
};

deqp_OSDependent = cc_library_static {
    defaults = [
        "deqp_glslang_defaults"
    ];
    export_include_dirs = [
        "glslang/OSDependent"
    ];
    name = "deqp_OSDependent";
    srcs = [
        "glslang/OSDependent/Unix/ossource.cpp"
    ];
};

deqp_OGLCompiler = cc_library_static {
    defaults = [
        "deqp_glslang_defaults"
    ];
    export_include_dirs = [
        "OGLCompilersDLL"
    ];
    local_include_dirs = [
        "OGLCompilersDLL"
    ];
    name = "deqp_OGLCompiler";
    srcs = [
        "OGLCompilersDLL/InitializeDll.cpp"
    ];
};

deqp_HLSL = cc_library_static {
    cppflags = [
        "-Wno-implicit-fallthrough"
    ];
    defaults = [
        "deqp_glslang_defaults"
    ];
    local_include_dirs = [
        "."
        "hlsl"
    ];
    name = "deqp_HLSL";
    srcs = [
        "hlsl/hlslAttributes.cpp"
        "hlsl/hlslGrammar.cpp"
        "hlsl/hlslOpMap.cpp"
        "hlsl/hlslParseables.cpp"
        "hlsl/hlslParseHelper.cpp"
        "hlsl/hlslScanContext.cpp"
        "hlsl/hlslTokenStream.cpp"
    ];
};

deqp_glslang = cc_library_static {
    cppflags = [
        "-Wno-implicit-fallthrough"
        "-Wno-missing-field-initializers"
        "-Wno-unused-variable"
    ];
    defaults = [
        "deqp_glslang_defaults"
    ];
    local_include_dirs = [
        "glslang/MachineIndependent"
    ];
    name = "deqp_glslang";
    srcs = [
        "glslang/GenericCodeGen/CodeGen.cpp"
        "glslang/GenericCodeGen/Link.cpp"
        "glslang/MachineIndependent/attribute.cpp"
        "glslang/MachineIndependent/Constant.cpp"
        "glslang/MachineIndependent/glslang_tab.cpp"
        "glslang/MachineIndependent/InfoSink.cpp"
        "glslang/MachineIndependent/Initialize.cpp"
        "glslang/MachineIndependent/Intermediate.cpp"
        "glslang/MachineIndependent/intermOut.cpp"
        "glslang/MachineIndependent/IntermTraverse.cpp"
        "glslang/MachineIndependent/iomapper.cpp"
        "glslang/MachineIndependent/limits.cpp"
        "glslang/MachineIndependent/linkValidate.cpp"
        "glslang/MachineIndependent/parseConst.cpp"
        "glslang/MachineIndependent/ParseContextBase.cpp"
        "glslang/MachineIndependent/ParseHelper.cpp"
        "glslang/MachineIndependent/PoolAlloc.cpp"
        "glslang/MachineIndependent/propagateNoContraction.cpp"
        "glslang/MachineIndependent/reflection.cpp"
        "glslang/MachineIndependent/RemoveTree.cpp"
        "glslang/MachineIndependent/Scan.cpp"
        "glslang/MachineIndependent/ShaderLang.cpp"
        "glslang/MachineIndependent/SymbolTable.cpp"
        "glslang/MachineIndependent/Versions.cpp"
        "glslang/MachineIndependent/preprocessor/PpAtom.cpp"
        "glslang/MachineIndependent/preprocessor/PpContext.cpp"
        "glslang/MachineIndependent/preprocessor/Pp.cpp"
        "glslang/MachineIndependent/preprocessor/PpScanner.cpp"
        "glslang/MachineIndependent/preprocessor/PpTokens.cpp"
    ];
    static_libs = [
        "deqp_OSDependent"
        "deqp_OGLCompiler"
        "deqp_HLSL"
    ];
};

deqp_SPIRV = cc_library_static {
    cppflags = [
        "-Wno-implicit-fallthrough"
        "-Wno-unused-parameter"
    ];
    defaults = [
        "deqp_glslang_defaults"
    ];
    export_include_dirs = [
        "SPIRV"
    ];
    local_include_dirs = [
        "SPIRV"
    ];
    name = "deqp_SPIRV";
    srcs = [
        "SPIRV/GlslangToSpv.cpp"
        "SPIRV/InReadableOrder.cpp"
        "SPIRV/Logger.cpp"
        "SPIRV/SPVRemapper.cpp"
        "SPIRV/SpvBuilder.cpp"
        "SPIRV/SpvPostProcess.cpp"
        "SPIRV/SpvTools.cpp"
        "SPIRV/disassemble.cpp"
        "SPIRV/doc.cpp"
    ];
    static_libs = [
        "deqp_glslang"
    ];
};

in { inherit deqp_HLSL deqp_OGLCompiler deqp_OSDependent deqp_SPIRV deqp_glslang deqp_glslang_defaults; }
