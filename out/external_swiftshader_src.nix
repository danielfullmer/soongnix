{ cc_defaults, cc_library_shared, cc_library_static }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

libswiftshader = cc_defaults {
    name = "libswiftshader";

    device_supported = false;
    host_supported = true;
    vendor = true;

    defaults = ["swiftshader_common"];

    cflags = [
        "-D_GNU_SOURCE"
        "-D__STDC_LIMIT_MACROS"
        "-D__STDC_CONSTANT_MACROS"
        "-D__STDC_FORMAT_MACROS"
        "-DHAVE_GRALLOC1"
        "-DNO_SANITIZE_FUNCTION="
        #  FIXME: Use <android/api-level.h> instead?
        "-DANDROID_PLATFORM_SDK_VERSION=10000"
        "-Wno-implicit-fallthrough"
        "-Wno-unused-parameter"
        "-Wno-unused-local-typedef"
    ];

    cppflags = [
        "-Wno-sign-promo"
        "-Wno-non-virtual-dtor"
    ];

    local_include_dirs = ["OpenGL"];

    target = {
        android = {
            relative_install_path = "hw";
            header_libs = [
                "swiftshader_platform_headers"
            ];
            shared_libs = [
                "libnativewindow"
                "libhardware"
                "libcutils"
                "libsync"
                "liblog"
            ];
        };

        host = {
            header_libs = [
                "swiftshader_host_headers"
                "swiftshader_platform_headers"
            ];

            #  Pretend to build for Android
            cflags = [
                "-D__ANDROID__"
                "-DANDROID_HOST_BUILD"
            ];

            allow_undefined_symbols = true;
            host_ldlibs = ["-ldl"];
        };
    };
};

libswiftshader_release = cc_defaults {
    name = "libswiftshader_release";

    defaults = ["libswiftshader"];

    cflags = [
        "-fomit-frame-pointer"
        "-ffunction-sections"
        "-fdata-sections"
        "-DANGLE_DISABLE_TRACE"
    ];
};

libswiftshader_debug = cc_defaults {
    name = "libswiftshader_debug";

    defaults = ["libswiftshader"];

    cflags = [
        "-UNDEBUG"
        "-g"
        "-O0"
        "-DDEFAULT_THREAD_COUNT=1"
    ];
};

#  Common libraries

libswiftshader_common_defaults = cc_defaults {
    name = "libswiftshader_common_defaults";

    cflags = [
        "-DLOG_TAG=\"swiftshader\""
    ];

    srcs = [
        "Common/CPUID.cpp"
        "Common/Configurator.cpp"
        "Common/DebugAndroid.cpp"
        "Common/GrallocAndroid.cpp"
        "Common/Half.cpp"
        "Common/Math.cpp"
        "Common/Memory.cpp"
        "Common/Resource.cpp"
        "Common/Socket.cpp"
        "Common/Thread.cpp"
        "Common/Timer.cpp"
        "Main/Config.cpp"
        "Main/FrameBuffer.cpp"
        "Main/FrameBufferAndroid.cpp"
        "Main/SwiftConfig.cpp"
        "Renderer/Blitter.cpp"
        "Renderer/Clipper.cpp"
        "Renderer/Color.cpp"
        "Renderer/Context.cpp"
        "Renderer/ETC_Decoder.cpp"
        "Renderer/Matrix.cpp"
        "Renderer/PixelProcessor.cpp"
        "Renderer/Plane.cpp"
        "Renderer/Point.cpp"
        "Renderer/QuadRasterizer.cpp"
        "Renderer/Renderer.cpp"
        "Renderer/Sampler.cpp"
        "Renderer/SetupProcessor.cpp"
        "Renderer/Surface.cpp"
        "Renderer/TextureStage.cpp"
        "Renderer/Vector.cpp"
        "Renderer/VertexProcessor.cpp"
        "Shader/Constants.cpp"
        "Shader/PixelPipeline.cpp"
        "Shader/PixelProgram.cpp"
        "Shader/PixelRoutine.cpp"
        "Shader/PixelShader.cpp"
        "Shader/SamplerCore.cpp"
        "Shader/SetupRoutine.cpp"
        "Shader/Shader.cpp"
        "Shader/ShaderCore.cpp"
        "Shader/VertexPipeline.cpp"
        "Shader/VertexProgram.cpp"
        "Shader/VertexRoutine.cpp"
        "Shader/VertexShader.cpp"
        "OpenGL/common/Image.cpp"
        "OpenGL/common/Object.cpp"
        "OpenGL/common/MatrixStack.cpp"
    ];

    target = {
        host = {
            exclude_srcs = ["Common/DebugAndroid.cpp"];
            srcs = ["Common/Debug.cpp"];
        };
    };
};

libswiftshader_llvm_defaults = cc_defaults {
    name = "libswiftshader_llvm_defaults";

    defaults = ["libswiftshader_common_defaults"];

    srcs = [
        "Reactor/LLVMReactor.cpp"
        "Reactor/Routine.cpp"
        "Reactor/LLVMRoutine.cpp"
        "Reactor/LLVMRoutineManager.cpp"
    ];

    static_libs = [
        "libLLVM_swiftshader"
    ];
};

libswiftshader_common = cc_defaults {
    name = "libswiftshader_common";

    defaults = [
        "libswiftshader_release"
        "libswiftshader_common_defaults"
    ];
};

libswiftshader_common_debug = cc_defaults {
    name = "libswiftshader_common_debug";

    srcs = ["OpenGL/common/debug.cpp"];

    defaults = [
        "libswiftshader_debug"
        "libswiftshader_common_defaults"
    ];
};

libswiftshader_llvm = cc_library_static {
    name = "libswiftshader_llvm";

    defaults = [
        "libswiftshader_common"
        "libswiftshader_llvm_defaults"
    ];
    device_supported = false;
};

libswiftshader_llvm_debug = cc_library_static {
    name = "libswiftshader_llvm_debug";
    device_supported = false;

    defaults = [
        "libswiftshader_common_debug"
        "libswiftshader_llvm_defaults"
    ];
};

#  compiler libraries

libswiftshader_compiler_defaults = cc_defaults {
    name = "libswiftshader_compiler_defaults";

    defaults = ["libswiftshader"];

    cflags = [
        "-DLOG_TAG=\"swiftshader_compiler\""
    ];

    srcs = [
        "OpenGL/compiler/preprocessor/DiagnosticsBase.cpp"
        "OpenGL/compiler/preprocessor/DirectiveHandlerBase.cpp"
        "OpenGL/compiler/preprocessor/DirectiveParser.cpp"
        "OpenGL/compiler/preprocessor/ExpressionParser.cpp"
        "OpenGL/compiler/preprocessor/Input.cpp"
        "OpenGL/compiler/preprocessor/Lexer.cpp"
        "OpenGL/compiler/preprocessor/Macro.cpp"
        "OpenGL/compiler/preprocessor/MacroExpander.cpp"
        "OpenGL/compiler/preprocessor/Preprocessor.cpp"
        "OpenGL/compiler/preprocessor/Token.cpp"
        "OpenGL/compiler/preprocessor/Tokenizer.cpp"
        "OpenGL/compiler/AnalyzeCallDepth.cpp"
        "OpenGL/compiler/Compiler.cpp"
        "OpenGL/compiler/debug.cpp"
        "OpenGL/compiler/Diagnostics.cpp"
        "OpenGL/compiler/DirectiveHandler.cpp"
        "OpenGL/compiler/glslang_lex.cpp"
        "OpenGL/compiler/glslang_tab.cpp"
        "OpenGL/compiler/InfoSink.cpp"
        "OpenGL/compiler/Initialize.cpp"
        "OpenGL/compiler/InitializeParseContext.cpp"
        "OpenGL/compiler/IntermTraverse.cpp"
        "OpenGL/compiler/Intermediate.cpp"
        "OpenGL/compiler/intermOut.cpp"
        "OpenGL/compiler/ossource_posix.cpp"
        "OpenGL/compiler/OutputASM.cpp"
        "OpenGL/compiler/parseConst.cpp"
        "OpenGL/compiler/ParseHelper.cpp"
        "OpenGL/compiler/PoolAlloc.cpp"
        "OpenGL/compiler/SymbolTable.cpp"
        "OpenGL/compiler/TranslatorASM.cpp"
        "OpenGL/compiler/util.cpp"
        "OpenGL/compiler/ValidateLimitations.cpp"
        "OpenGL/compiler/ValidateSwitch.cpp"
    ];
};

libswiftshader_compiler = cc_library_static {
    name = "libswiftshader_compiler";

    defaults = [
        "libswiftshader_release"
        "libswiftshader_compiler_defaults"
    ];
};

libswiftshader_compiler_debug = cc_library_static {
    name = "libswiftshader_compiler_debug";

    defaults = [
        "libswiftshader_debug"
        "libswiftshader_compiler_defaults"
    ];
};

#  libEGL libraries

swiftshader_client_libraries_subzero_or_llvm = cc_defaults {
    name = "swiftshader_client_libraries_subzero_or_llvm";

    defaults = ["libswiftshader_release"];

    target = {
        android = {
            static_libs = [
                "libswiftshader_llvm"
                "libLLVM_swiftshader"
            ];
        };

        host = {
            static_libs = [
                "libswiftshader_llvm"
                "libLLVM_swiftshader"
            ];
        };
    };
};

swiftshader_client_libraries_subzero_or_llvm_debug = cc_defaults {
    name = "swiftshader_client_libraries_subzero_or_llvm_debug";

    defaults = ["libswiftshader_debug"];

    target = {
        android = {
            static_libs = [
                "libswiftshader_llvm_debug"
                "libLLVM_swiftshader"
            ];
        };

        host = {
            static_libs = [
                "libswiftshader_llvm_debug"
                "libLLVM_swiftshader"
            ];
        };
    };
};

libEGL_swiftshader_defaults = cc_defaults {
    name = "libEGL_swiftshader_defaults";

    defaults = ["libswiftshader"];

    cflags = [
        "-DLOG_TAG=\"libEGL_swiftshader\""
        "-DEGLAPI="
        "-DEGL_EGLEXT_PROTOTYPES"
        "-Wno-format"
    ];

    srcs = [
        "OpenGL/libEGL/Config.cpp"
        "OpenGL/libEGL/Display.cpp"
        "OpenGL/libEGL/Surface.cpp"
        "OpenGL/libEGL/libEGL.cpp"
        "OpenGL/libEGL/main.cpp"
    ];

    version_script = "OpenGL/libEGL/libEGL.lds";
};

libEGL_swiftshader = cc_library_shared {
    name = "libEGL_swiftshader";

    defaults = [
        "libEGL_swiftshader_defaults"
        "swiftshader_client_libraries_subzero_or_llvm"
    ];
    device_supported = false;
};

libEGL_swiftshader_debug = cc_library_shared {
    name = "libEGL_swiftshader_debug";

    defaults = [
        "libEGL_swiftshader_defaults"
        "swiftshader_client_libraries_subzero_or_llvm_debug"
    ];
    device_supported = false;
};

#  libGLESv1_CM libraries

libGLESv1_CM_swiftshader_defaults = cc_defaults {
    name = "libGLESv1_CM_swiftshader_defaults";

    defaults = ["libswiftshader"];

    cflags = [
        "-DLOG_TAG=\"libGLES_CM_swiftshader\""
        "-DEGLAPI="
        "-DGL_API="
        "-DGL_APICALL="
        "-DGL_GLEXT_PROTOTYPES"
        "-Wno-format"
    ];

    srcs = [
        "OpenGL/libGLES_CM/Buffer.cpp"
        "OpenGL/libGLES_CM/Context.cpp"
        "OpenGL/libGLES_CM/Device.cpp"
        "OpenGL/libGLES_CM/Framebuffer.cpp"
        "OpenGL/libGLES_CM/IndexDataManager.cpp"
        "OpenGL/libGLES_CM/libGLES_CM.cpp"
        "OpenGL/libGLES_CM/main.cpp"
        "OpenGL/libGLES_CM/Renderbuffer.cpp"
        "OpenGL/libGLES_CM/ResourceManager.cpp"
        "OpenGL/libGLES_CM/Texture.cpp"
        "OpenGL/libGLES_CM/utilities.cpp"
        "OpenGL/libGLES_CM/VertexDataManager.cpp"
    ];

    version_script = "OpenGL/libGLES_CM/libGLES_CM.lds";
};

libGLESv1_CM_swiftshader = cc_library_shared {
    name = "libGLESv1_CM_swiftshader";

    defaults = [
        "libGLESv1_CM_swiftshader_defaults"
        "swiftshader_client_libraries_subzero_or_llvm"
    ];
    device_supported = false;
};

libGLESv1_CM_swiftshader_debug = cc_library_shared {
    name = "libGLESv1_CM_swiftshader_debug";

    defaults = [
        "libGLESv1_CM_swiftshader_defaults"
        "swiftshader_client_libraries_subzero_or_llvm_debug"
    ];
    device_supported = false;
};

#  libGLESv2 libraries

libGLESv2_swiftshader_defaults = cc_defaults {
    name = "libGLESv2_swiftshader_defaults";

    defaults = ["libswiftshader"];
    device_supported = false;

    cflags = [
        "-DLOG_TAG=\"libGLESv2_swiftshader\""
        "-DEGLAPI="
        "-DGL_API="
        "-DGL_APICALL="
        "-DGL_GLEXT_PROTOTYPES"
        "-Wno-format"
    ];

    srcs = [
        "OpenGL/libGLESv2/Buffer.cpp"
        "OpenGL/libGLESv2/Context.cpp"
        "OpenGL/libGLESv2/Device.cpp"
        "OpenGL/libGLESv2/Fence.cpp"
        "OpenGL/libGLESv2/Framebuffer.cpp"
        "OpenGL/libGLESv2/IndexDataManager.cpp"
        "OpenGL/libGLESv2/libGLESv2.cpp"
        "OpenGL/libGLESv2/libGLESv3.cpp"
        "OpenGL/libGLESv2/main.cpp"
        "OpenGL/libGLESv2/entry_points.cpp"
        "OpenGL/libGLESv2/Program.cpp"
        "OpenGL/libGLESv2/Query.cpp"
        "OpenGL/libGLESv2/Renderbuffer.cpp"
        "OpenGL/libGLESv2/ResourceManager.cpp"
        "OpenGL/libGLESv2/Shader.cpp"
        "OpenGL/libGLESv2/Texture.cpp"
        "OpenGL/libGLESv2/TransformFeedback.cpp"
        "OpenGL/libGLESv2/utilities.cpp"
        "OpenGL/libGLESv2/VertexArray.cpp"
        "OpenGL/libGLESv2/VertexDataManager.cpp"
    ];

    version_script = "OpenGL/libGLESv2/libGLESv2.lds";
};

libGLESv2_swiftshader = cc_library_shared {
    name = "libGLESv2_swiftshader";

    defaults = [
        "libGLESv2_swiftshader_defaults"
        "swiftshader_client_libraries_subzero_or_llvm"
    ];
    device_supported = false;

    static_libs = ["libswiftshader_compiler"];
};

libGLESv2_swiftshader_debug = cc_library_shared {
    name = "libGLESv2_swiftshader_debug";

    defaults = [
        "libGLESv2_swiftshader_defaults"
        "swiftshader_client_libraries_subzero_or_llvm_debug"
    ];
    device_supported = false;

    static_libs = ["libswiftshader_compiler_debug"];
};

in { inherit libEGL_swiftshader libEGL_swiftshader_debug libEGL_swiftshader_defaults libGLESv1_CM_swiftshader libGLESv1_CM_swiftshader_debug libGLESv1_CM_swiftshader_defaults libGLESv2_swiftshader libGLESv2_swiftshader_debug libGLESv2_swiftshader_defaults libswiftshader libswiftshader_common libswiftshader_common_debug libswiftshader_common_defaults libswiftshader_compiler libswiftshader_compiler_debug libswiftshader_compiler_defaults libswiftshader_debug libswiftshader_llvm libswiftshader_llvm_debug libswiftshader_llvm_defaults libswiftshader_release swiftshader_client_libraries_subzero_or_llvm swiftshader_client_libraries_subzero_or_llvm_debug; }
