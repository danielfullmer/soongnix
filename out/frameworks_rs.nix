{ cc_binary_host, cc_defaults, cc_library_headers, cc_library_shared, gensrcs, llndk_library }:
let

rs-headers = cc_library_headers {
    name = "rs-headers";
    export_include_dirs = ["."];
    sdk_version = "9";
};

rs_defaults = cc_defaults {
    name = "rs_defaults";
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];
};

libRSDriver = cc_library_shared {
    name = "libRSDriver";
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    defaults = ["rs_defaults"];

    srcs = [
        "driver/rsdAllocation.cpp"
        "driver/rsdBcc.cpp"
        "driver/rsdCore.cpp"
        "driver/rsdElement.cpp"
        "driver/rsdFrameBuffer.cpp"
        "driver/rsdFrameBufferObj.cpp"
        "driver/rsdGL.cpp"
        "driver/rsdMesh.cpp"
        "driver/rsdMeshObj.cpp"
        "driver/rsdProgram.cpp"
        "driver/rsdProgramRaster.cpp"
        "driver/rsdProgramStore.cpp"
        "driver/rsdRuntimeStubs.cpp"
        "driver/rsdSampler.cpp"
        "driver/rsdScriptGroup.cpp"
        "driver/rsdShader.cpp"
        "driver/rsdShaderCache.cpp"
        "driver/rsdType.cpp"
        "driver/rsdVertexArray.cpp"
    ];

    shared_libs = [
        "libRS_internal"
        "libRSCpuRef"

        "liblog"
        "libEGL"
        "libGLESv1_CM"
        "libGLESv2"

        "libnativewindow"

        "libbcinfo"
    ];

    static_libs = ["libarect"];

    header_libs = [
        "libcutils_headers"
        "libutils_headers"
        "libnativebase_headers"
    ];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };

    #  Bug: http://b/77445194 - Disable x86 asan where rsdRuntimeStubs.cpp has
    #  undefined reference to half-conversion routines (__gnu_h2f_ieee,
    #  __gnu_f2h_ieee).
    arch = {
        x86 = {
            sanitize = {
                never = true;
            };
        };
    };
};

#  Build rsg-generator ====================

rsg-generator = cc_binary_host {
    name = "rsg-generator";

    srcs = [
        "spec.l"
        "rsg_generator.c"
    ];

    cflags = [
        "-Wno-unused-function"
    ];

    stl = "none";
    sanitize = {
        never = true;
    };
};

#  Generate custom headers
rs_generated_headers = gensrcs {
    name = "rs_generated_headers";
    tools = ["rsg-generator"];
    tool_files = [
        "rs.spec"
        "rsg.spec"
    ];
    cmd = "cat $(location rs.spec) $(location rsg.spec) | $(location rsg-generator) $(in) $(out)";
    output_extension = "h";
    srcs = [
        "rsgApiStructs.h_rsg"
        "rsgApiFuncDecl.h_rsg"
    ];
    export_include_dirs = ["."];
};

rs_generated_sources = gensrcs {
    name = "rs_generated_sources";
    tools = ["rsg-generator"];
    tool_files = [
        "rs.spec"
        "rsg.spec"
    ];
    cmd = "cat $(location rs.spec) $(location rsg.spec) | $(location rsg-generator) $(in) $(out)";
    output_extension = "cpp";
    srcs = [
        "rsgApi.cpp_rsg"
        "rsgApiReplay.cpp_rsg"
    ];
};

libRS_internal = cc_library_shared {
    name = "libRS_internal";
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    defaults = ["rs_defaults"];

    srcs = [
        "rsApiAllocation.cpp"
        "rsApiContext.cpp"
        "rsApiDevice.cpp"
        "rsApiElement.cpp"
        "rsApiFileA3D.cpp"
        "rsApiMesh.cpp"
        "rsApiType.cpp"
        "rsAllocation.cpp"
        "rsAnimation.cpp"
        "rsComponent.cpp"
        "rsContext.cpp"
        "rsClosure.cpp"
        "rsCppUtils.cpp"
        "rsDevice.cpp"
        "rsDriverLoader.cpp"
        "rsElement.cpp"
        "rsFBOCache.cpp"
        "rsFifoSocket.cpp"
        "rsFileA3D.cpp"
        "rsFont.cpp"
        "rsGrallocConsumer.cpp"
        "rsObjectBase.cpp"
        "rsMatrix2x2.cpp"
        "rsMatrix3x3.cpp"
        "rsMatrix4x4.cpp"
        "rsMesh.cpp"
        "rsMutex.cpp"
        "rsProgram.cpp"
        "rsProgramFragment.cpp"
        "rsProgramStore.cpp"
        "rsProgramRaster.cpp"
        "rsProgramVertex.cpp"
        "rsSampler.cpp"
        "rsScript.cpp"
        "rsScriptC.cpp"
        "rsScriptC_Lib.cpp"
        "rsScriptC_LibGL.cpp"
        "rsScriptGroup.cpp"
        "rsScriptGroup2.cpp"
        "rsScriptIntrinsic.cpp"
        "rsSignal.cpp"
        "rsStream.cpp"
        "rsThreadIO.cpp"
        "rsType.cpp"
    ];

    generated_sources = ["rs_generated_sources"];
    generated_headers = ["rs_generated_headers"];

    shared_libs = [
        "liblog"
        "libutilscallstack"
        "libutils"
        "libEGL"
        "libGLESv1_CM"
        "libGLESv2"

        "libdl"
        "libnativewindow"

        "libft2"

        "libbcinfo"
        "libmediandk"
    ];

    static_libs = ["libarect"];

    #  These runtime modules, including libcompiler_rt.so, are required for
    #  RenderScript.
    required = [
        "libclcore.bc"
        "libclcore_debug.bc"
        "libclcore_debug_g.bc"
        "libclcore_g.bc"
        "libcompiler_rt"
    ];

    arch = {
        x86 = {
            required = ["libclcore_x86.bc"];
        };
        x86_64 = {
            required = ["libclcore_x86.bc"];
        };

        arm = {
            neon = {
                required = ["libclcore_neon.bc"];
            };
        };
    };

    product_variables = {
        override_rs_driver = {
            cflags = ["-DOVERRIDE_RS_DRIVER=%s"];
        };
        pdk = {
            enabled = false;
        };
    };
};

libRS = cc_library_shared {
    name = "libRS";
    defaults = ["rs_defaults"];
    srcs = [
        "rsApiStubs.cpp"
        "rsHidlAdaptation.cpp"
        "rsFallbackAdaptation.cpp"
    ];

    #  Default CPU fallback
    required = [
        "libRS_internal"
        "libRSDriver"
        "libRSCacheDir"
    ];

    #  Treble configuration
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libutilscallstack"
        "libutils"
        "android.hardware.renderscript@1.0"

        "liblog"
        "libcutils"
    ];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };

    static_libs = ["libRSDispatch"];

    version_script = "libRS.map";
};

libRS = llndk_library {
    name = "libRS";
    symbol_file = "libRS.map";
};

libRSCacheDir = cc_library_shared {
    name = "libRSCacheDir";
    defaults = ["rs_defaults"];

    srcs = ["rsCacheDir.cpp"];
    shared_libs = [
        "libandroid_runtime"
        "liblog"
    ];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

build = [
    "support.bp"
];

subdirs = [
    "cpp"
    "cpu_ref"
    "script_api"
    "support"
];

in { inherit libRS libRSCacheDir libRSDriver libRS_internal rs-headers rs_defaults rs_generated_headers rs_generated_sources rsg-generator; }
